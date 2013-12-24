getItemGroupDataSeq <-
function( ItemGroupData ){
    sapply( ItemGroupData, 
            function(el) xmlGetAttr(el, 
            'sds:ItemGroupDataSeq', 
            default = ""
            )
    )
}
