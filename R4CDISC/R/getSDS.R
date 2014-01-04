getSDS <- function(xml_doc){
      namespaces <- c(ns='http://www.cdisc.org/ns/odm/v1.3', 
                      sds='http://www.cdisc.org/ns/sds/v1.0')

      ItemGroupData <- getNodeSet(xml_doc, "//ns:ItemGroupData", namespaces)
      ItemGroupDataSeq <- getItemGroupDataSeq( ItemGroupData )
      ItemGroupOID <- unique( getAttr(ItemGroupData, "ItemGroupOID") )

      for (i in ItemGroupDataSeq) {
          xpath_stat <- paste('//ns:ItemGroupData[@sds:ItemGroupDataSeq="', 
                              i, 
                              '"]/ns:ItemData', 
                              sep=""
                              )
          ItemGroupDef <- getNodeSet(xml_doc, xpath_stat, namespaces)
          row_id <- c(as.integer(i))
          ItemOID <- sapply(ItemGroupDef, 
                            function(el) xmlGetAttr(el, "ItemOID", default = "")
                            )
          ID_Val <- sapply(ItemGroupDef, 
                          function(el) xmlGetAttr(el, "Value", default = "")
                          )
  
          if (i == ItemGroupDataSeq[1]){
              temp_df <- data.frame(row_id, 
                                    ItemOID, 
                                    ID_Val, 
                                    stringsAsFactors = FALSE,
                                    row.names = NULL)  
          }else{
              cur_df <- data.frame(row_id, 
                                   ItemOID, 
                                   ID_Val, 
                                   stringsAsFactors = FALSE,
                                   row.names = NULL)  
              temp_df <- merge(temp_df, cur_df, all = row_id)
          } 
      }

    df <- reshape(temp_df, 
                  timevar = "ItemOID", 
                  idvar = "row_id", 
                  direction = "wide"
          )

    # rename to variable name
    i_oids <- names(df)
    for(i in c(1:length(i_oids)) ){
        splt <- unlist(strsplit(i_oids[[i]], '[.]'))
        varnm <- splt[length(splt)]
        if( i==1 ){
            var_names <- c(varnm)
        }
        else{
            var_names <- c(var_names, varnm)
        }
    }
    
    names(df) <- var_names
    df <- df[setdiff(colnames(df), "row_id")]
    return( list(IGOID = ItemGroupOID, sdsdata = df ))
}
