getCT <- function( filepath ) {
    doc = xmlTreeParse( filepath, useInternalNodes = T )
    namespaces <- namespaces()
    
    #Code List
    clNode <- getNodeSet( doc, "//ns:CodeList", namespaces )
    clList <- list()
    
    for ( i in 1:length(clNode) ){
        cll <- xmlToList(clNode[[i]])
        
        cl.oid <- cll$.attrs[["OID"]]
        #names(cl.oid) <- NULL
        cl.name <- cll$.attrs[["Name"]]
        #names(cl.name) <- NULL
        cl.datatype <- cll$.attrs[["DataType"]]
        #names(cl.datatype) <- NULL
        if (is.null(cll$CodeListItem) == FALSE ){
            cl.cltype <- "CodeListItem"
        }else{
            cl.cltype <- "EnumeratedItem"
        }
        #names(cl.cltype) <- NULL
        # Alias
        if (is.null(cll$Alias[["Name"]]) == TRUE){
          cl.aname <- NA
        } else {
          cl.aname <- cll$Alias["Name"]
          names(cl.aname) <- NULL
        }
        # Context
        if (is.null(cll$Alias["Context"]) == TRUE){
          cl.acontext <- NA
        } else {
          cl.acontext <- cll$Alias["Context"]
          names(cl.acontext) <- NULL
        }
    }
        cl.items <- data.frame( cl.oid, cl.name, cl.datatype, cl.cltype, 
                                cl.aname, cl.acontext,
                                stringsAsFactors = FALSE)
        names(cl.items) <- c("OID", "Name", "DataType", "CodeListType", "Alias", "Context")
        #clList_temp <- c(CodeList = cl.items, item = getCodeListItem(cll))
                
    return( cl.items )
}
