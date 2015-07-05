getEnumeratedItem <- function(filepath){
    doc = xmlTreeParse( filepath, useInternalNodes = T )
    namespaces <- namespaces()
    
    #Select CodeList nodeset including CodeListItem and EnumeratedItem
    clNode <- getNodeSet( doc, "//ns:CodeList[ns:EnumeratedItem]", namespaces )
    #Extract Code List OID as Collection
    CL.OIDs <- getAttr( Nodeset = clNode, Attr = "OID" )
    CL.Names <- getAttr( Nodeset = clNode, Attr = "Name" )
    CL.DataTypes <- getAttr( Nodeset = clNode, Attr = "DataTypes" )
    CL.SASFormatNames <- getAttr( Nodeset = clNode, Attr = "SASFormatName" )
    
    
    for ( i in 1:length(clNode) ){
        # get attributes of CodeList element
        OID <- CL.OIDs[i]
        Name <- CL.Names[i]
        DataType <- CL.DataTypes[i]
        SASFormatName <- CL.SASFormatNames[i]
        
        # get attributes of CodeList Alias
        doc2 <- xmlTreeParse(toString.XMLNode( clNode[[i]] ), useInternalNodes = T)
        CodeListAlias <- getNodeSet( doc2, "/CodeList/Alias", namespaces )
        if (length(CodeListAlias) > 0){
            CodeListCode <- getAttr( Nodeset = CodeListAlias, Attr = "Name" )
            CodeListContext <- getAttr( Nodeset = CodeListAlias, Attr = "Context" )
        }else{
            CodeListCode <- NA
            CodeListContext <- NA
        }
        
        # get EnumeratedItem
        enumItems <- getNodeSet( doc2, "//EnumeratedItem")

        CodedValue <- getAttr( Nodeset = enumItems, Attr = "CodedValue" )
        OrderNumber <- getAttr( Nodeset = enumItems, Attr = "OrderNumber" )
        ExtendedValue <- getAttr( Nodeset = enumItems, Attr = "def:ExtendedValue" )
        
        # get EnumeratedItem Alias
        EnumeratedItemCode <- c()
        EnumeratedItemContext <- c()
        for (j in 1:length(enumItems)){
            enumAlias <- getNodeSet( doc2, paste0("//EnumeratedItem[", j,  "]/Alias") )
            if( length(enumAlias)==0 ){
                EnumeratedItemCode <- append(EnumeratedItemCode, NA)
                EnumeratedItemContext <- append(EnumeratedItemContext, NA)
            }else{
                EnumeratedItemCode <- append(EnumeratedItemCode, getAttr( Nodeset = enumAlias, Attr = "Name" ))
                EnumeratedItemContext <- append(EnumeratedItemContext, getAttr( Nodeset = enumAlias, Attr = "Context" ))
            }
         }
        
        df <- data.frame(OID=OID, 
                         Name=Name, 
                         DataType=DataType, 
                         SASFormatName=SASFormatName, 
                         CodeListCode=CodeListCode, 
                         CodeListContext=CodeListContext,
                         CodedValue=CodedValue, 
                         OrderNumber=OrderNumber, 
                         ExtendedValue=ExtendedValue,
                         EnumeratedItemCode=EnumeratedItemCode,
                         EnumeratedItemContext=EnumeratedItemContext)
        
        if ( i ==1 ){
            enumDF <- df
        }else{
            enumDF <- rbind(enumDF, df)
        }
    }
    

    return(enumDF)
}

