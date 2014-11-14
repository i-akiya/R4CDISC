getItemDef <- function( Nodeset ){

    namespaces <- c( ns = 'http://www.cdisc.org/ns/odm/v1.3', 
                    def = 'http://www.cdisc.org/ns/def/v2.0' )
    ItemDefNode <- getNodeSet(Nodeset, "//ns:ItemDef", namespaces)
    
    ID_OID <- getAttr(Nodeset=ItemDefNode, Attr="OID")
    ID_Name <- getAttr(Nodeset=ItemDefNode, Attr="Name")
    
    ID_DataType <- getAttr(Nodeset=ItemDefNode, Attr="DataType")
    ID_Length <- getAttr(Nodeset=ItemDefNode, Attr="Length")
    ID_SASFieldName <- getAttr(Nodeset=ItemDefNode, Attr="SASFieldName")
    
    ItemDefNode2 <- getNodeSet(Nodeset, "//ns:ItemDef/ns:Description", namespaces)
    ID_Label <- getVal(ItemDefNode2, 'TranslatedText[@xml:lang = "en"]')
    
    ItemDefNode3 <- getNodeSet(Nodeset, "//ns:ItemDef//ns:CodeListRef", namespaces)
    ID_CodeListOID <<- getAttr(Nodeset=ItemDefNode3, Attr="CodeListOID")
    
    ItemDefNode4 <- getNodeSet(Nodeset, "//ns:ItemDef/def:Origin", namespaces)
    ID_OriginDescription <<- getVal(ItemDefNode4, 'TranslatedText[@xml:lang = "en"]')
    
 
    df <- data.frame(
        ID_OID,
        ID_Name, 
        ID_Length, 
        ID_DataType, 
        ID_Label, 
        ID_SASFieldName,
        #ID_CodeListOID,
        #ID_OriginDescription,
        stringsAsFactors = FALSE
        )
      
}
    