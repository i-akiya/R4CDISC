getCT <- function( filepath ) {
    cl <- getCodeListItem(filepath)
    enu <- getEnumeratedItem(filepath)
    
    mm <- merge(cl, enu, all=T, stringsAsFactors=FALSE)
    mm <- mm %>% dplyr::arrange(OID, OrderNumber, Rank, CodedValue)
    
    return( mm )
}
