getCT <- function( filepath ) {
    doc = xmlTreeParse( filepath, useInternalNodes = T )
    namespaces <- namespaces()
    
    
    #Select CodeList nodeset including CodeListItem and EnumeratedItem
    clNode <- getNodeSet( doc, "//ns:CodeList[ns:CodeListItem]|//ns:CodeList[ns:EnumeratedItem]", namespaces )
    
    #Code List
    #clNode <- getNodeSet( doc, "//ns:CodeList", namespaces )
    #clList <- list()
    for ( i in 1:length(clNode) ){
print(i)
      cll <- xmlToList(clNode[[i]])
      # check codelist type: don't change "names(codelist[1])"

      if ("EnumeratedItem" == names(cll[1]) ){
          print("OK getCT")
          EnumItem <- getEnumeratedItem(cll)
          #EnumItem <- merge(EnumItem, EnumItem.temp, alll=TRUE)
      }
      
    }
      
      
#       
#       if (is.null(cll$CodeListItem) == FALSE) {
#         cl.oid <- cll$.attrs[["OID"]]
#         cl.name <- cll$.attrs[["Name"]]
#         cl.datatype <- cll$.attrs[["DataType"]]
#         cl.cltype <- "CodeListItem"
#         # Alias
#         if (is.null(cll$Alias[["Name"]]) == TRUE){
#           cl.aname <- NA
#         } else {
#           cl.aname <- cll$Alias[["Name"]]
#         }
#         # Context
#         if (is.null(cll$Alias[["Context"]]) == TRUE){
#           cl.acontext <- NA
#         } else {
#           cl.acontext <- cll$Alias["Context"]
#         }
#         cl.items <- list(cl.oid, 
#                          cl.name, 
#                          cl.datatype, 
#                          cl.cltype, 
#                          cl.aname, 
#                          cl.acontext)
#         names(cl.items) <- c("OID", "Name", "DataType", "CodeListType", "Alias", "Context")
#         clList_temp <- c(CodeList = cl.items, item = getCodeListItem(cll))
#      
#       } else if (is.null(cll$EnumeratedItem) == FALSE) {
#         cl.oid <- cll$.attrs[["OID"]]
#         cl.name <- cll$.attrs[["Name"]]
#         cl.datatype <- cll$.attrs[["DataType"]]
#         cl.cltype <- "EnumeratedItem"
#         # Alias
#         if (is.null(cll$Alias[["Name"]]) == TRUE){
#           cl.aname <- NA
#         } else {
#           cl.aname <- cll$Alias[["Name"]]
#         }
#         # Context
#         if (is.null(cll$Alias[["Context"]]) == TRUE){
#           cl.acontext <- NA
#         } else {
#           cl.acontext <- cll$Alias[["Context"]]
#         }
#         cl.items <- list(cl.oid, 
#                          cl.name, 
#                          cl.datatype, 
#                          cl.cltype, 
#                          cl.aname, 
#                          cl.acontext)
#         names(cl.items) <- c("OID", "Name", "DataType", "CodeListType", "Alias", "Context")
#         clList_temp <- c(CodeList = cl.items, item = getEnumeratedItem(cll))
#       }
#       clList <- c(clList, list(clList_temp))
#     }
    
    return( EnumItem )
}
