getVarName <-
function( ItemOID ){
    for ( i in names( df )) {
        temp_list <- strsplit( i, "[.]" )
        len <- length( temp_list[[1]] )
  
        if ( i == names( df )[1] ) {
            varName <- temp_list[[1]][len]
        }else{
            varName <- append( varName, temp_list[[1]][len] )
        }
    }
    return( varName )
}
