getCT <- function( filepath ) {
    doc = xmlTreeParse( filepath, useInternalNodes = T )
    namespaces <- namespaces()
    
    #Code List
    clNode <<- getNodeSet( doc, "//ns:CodeList", namespaces )
    #ValueListDef <- getAttr( Nodeset=ValueListDefNode,  Attr="OID")
    
    clList <- list()
    for ( i in 1:length(clNode) ){
      clf <<- getNodeSet(clNode[[i]], "./ns:CodeList", namespaces)
      
#      CL_OID <- getAttr(Nodeset=clf, Attr="OID")
#      CL_Name <- getAttr(Nodeset=clf, Attr="Name")
      clList_temp <- list(xmlAttrs(clNode[[1]]))
      clList <- append(clList, clList_temp)
    }

    return( clList )
}
