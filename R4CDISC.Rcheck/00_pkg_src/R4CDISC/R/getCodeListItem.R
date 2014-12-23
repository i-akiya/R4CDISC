getCodeListItem <- function(CodeListList){
    numItem <- 0
    # Count of CodeListItem
    for (i in 1:length(CodeListList$CodeListItem)){
      if (is.null(CodeListList[i]$CodeListItem) == FALSE){
        numItem <- numItem + 1
      }
    }

    CodedValue <- c()
    Rank <- c()
    OrderNumber <- c()
    ExtendedValue <- c()
    Decode <- c()
    Alias <- c()
    Context <- c()
    
    for (i in 1:numItem){
      # CodedValue
      CodedValue.temp <- CodeListList[i]$CodeListItem$.attrs["CodedValue"]
      if (is.null(CodedValue.temp) == TRUE){
        CodedValue <- append(CodedValue, NA)
      } else {
        names(CodedValue.temp) <- NULL
        CodedValue <- append(CodedValue, CodedValue.temp)
      }
      # Rank
      Rank.temp <- CodeListList[i]$CodeListItem$.attrs["Rank"]
      if (is.null(Rank.temp) == TRUE){
        Rank <- append(Rank, NA)
      } else {
        names(Rank.temp) <- NULL
        Rank <- append(Rank, Rank.temp)
      }
      # OrderNumber
      OrderNumber.temp <- CodeListList[i]$CodeListItem$.attrs["OrderNumber"]
      if (is.null(OrderNumber.temp) == TRUE){
        OrderNumber <- append(OrderNumber, NA)
      } else {
        names(OrderNumber.temp) <- NULL
        OrderNumber <- append(OrderNumber, OrderNumber.temp)
      }
# def:ExtendedValue
      ExtendedValue.temp <- CodeListList[i]$CodeListItem$.attrs["def:ExtendedValue"]
      if (is.null(ExtendedValue.temp) == TRUE){
        ExtendedValue <- append(ExtendedValue, NA)
      } else {
        names(ExtendedValue.temp) <- NULL
        ExtendedValue <- append(ExtendedValue, ExtendedValue.temp)
      }
      # Decode
      Decode.temp <- CodeListList[i]$CodeListItem$Decode$TranslatedText$text
      if (is.null(Decode.temp) == TRUE){
        Decode <- append(Decode, NA)
      } else {
        names(Decode.temp) <- NULL
        Decode <- append(Decode, Decode.temp)
      }
      # Alias
      Alias.temp <- CodeListList[i]$CodeListItem$Alias["Name"]
      if (is.null(Alias.temp) == TRUE){
        Alias <- append(Alias, NA)
      } else {
        names(Alias.temp) <- NULL
        Alias <- append(Alias, Alias.temp)
      }
      # Context
      Context.temp <- CodeListList[i]$CodeListItem$Alias["Context"]
      if (is.null(Context.temp) == TRUE){
        Context <- append(Context, NA)
      } else {
        names(Context.temp) <- NULL
        Context <- append(Context, Context.temp)
      }
    }

  item <- data.frame(CodedValue = CodedValue, 
                        Rank = Rank,
                        OrderNumber = OrderNumber,
                        Decode = Decode,
                        ExtendedValue = ExtendedValue,
                        Alias = Alias,
                        Context = Context,
                        stringsAsFactors = FALSE)
  return(item)
}