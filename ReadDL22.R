Read.dl22 <- function(file){
  file <- read.xlsx(file, sheetIndex = 3, header = TRUE)
}

Clean.dl22 <- function(dataframe){
  colnames(drivers$dataframe) <- as.character(unlist(drivers$dataframe[12,]))
  drivers$dataframe <- drivers$dataframe[-1:-11,]
} 