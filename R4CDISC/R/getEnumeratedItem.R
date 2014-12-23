getEnumeratedItem <- function(CodeListList){
    numItem <- 0
    # Count of EnumeratedItem
    for (i in 1:length(CodeListList$EnumeratedItem)){
        if (is.null(CodeListList[i]$EnumeratedItem) == FALSE){
            numItem <- numItem + 1
        }
    }

    CodedValue <- c()
    Rank <- c()
    OrderNumber <- c()
    ExtendedValue <- c()
    Alias <- c()
    Context <- c()
    
    for (i in 1:numItem){
        # CodedValue
        CodedValue.exist <- "CodedValue" %in% names(CodeListList[i][["EnumeratedItem"]])
        if ( CodedValue.exist == TRUE){
            CodedValue.temp <- CodeListList[i]$EnumeratedItem[["CodedValue"]]
            names(CodedValue.temp) <- NULL
            CodedValue <- append(CodedValue, CodedValue.temp)
        }else{
            CodedValue <- append(CodedValue, NA)
        }

        # Rank
        Rank.exist <- "Rank" %in% names(CodeListList[i][["EnumeratedItem"]])
        if ( Rank.exist == TRUE){
            Rank.temp <- CodeListList[i]$EnumeratedItem[["Rank"]]
            names(Rank.temp) <- NULL
            Rank <- append(Rank, Rank.temp)
        }else{
            Rank <- append(Rank, NA)
        }

        # OrderNumber
        OrderNumber.exist <- "OrderNumber" %in% names(CodeListList[i][["EnumeratedItem"]])
        if ( OrderNumber.exist == TRUE){
            OrderNumber.temp <- CodeListList[i]$EnumeratedItem[["OrderNumber"]]
            names(OrderNumber.temp) <- NULL
            OrderNumber <- append(OrderNumber, OrderNumber.temp)
        }else{
            OrderNumber <- append(OrderNumber, NA)
        }

        # def:ExtendedValue
        ExtendedValue.exist <- "CodedValue" %in% names(CodeListList[i][["def:ExtendedValue"]])
        if ( ExtendedValue.exist == TRUE){
            ExtendedValue.temp <- CodeListList[i]$EnumeratedItem[["CodedValue"]]
            names(ExtendedValue.temp) <- NULL
            ExtendedValue <- append(ExtendedValue, ExtendedValue.temp)
        }else{
            ExtendedValue <- append(ExtendedValue, NA)
        }

      
        # Alias
        Alias.exist <- "Alias" %in% names(CodeListList[i][["EnumeratedItem"]])
        if (Alias.exist==TRUE){
            # Alias.Name
            Alias.exist <- "Name" %in% names(CodeListList[i]$EnumeratedItem[["Alias"]])
            if (Alias.exist == TRUE){
                Alias.temp <- CodeListList[i]$EnumeratedItem[["Alias"]][["Name"]]
                names(Alias.temp) <- NULL
                Alias <- append(Alias, Alias.temp)
            } else {
                Alias <- append(Alias, NA)
            }
            # Alias.Context
            Context.exist <- "Context" %in% names(CodeListList[i]$EnumeratedItem[["Alias"]])
            if (Context.exist == TRUE){
                Context.temp <- CodeListList[i]$EnumeratedItem[["Alias"]][["Context"]]
                names(Context.temp) <- NULL
                Context <- append(Context, Context.temp)
            } else {
                Context <- append(Context, NA)
            }
        } else {
            Alias <- append(Alias, NA)
            Context <- append(Context, NA)
        }
    }

    item <- data.frame(CodedValue = CodedValue, 
                        Rank = Rank,
                        OrderNumber = OrderNumber,
                        ExtendedValue = ExtendedValue,
                        Alias = Alias,
                        Context = Context,
                        stringsAsFactors = FALSE)
    return(item)
}

