
setwd("/Users/Kris/Google Drive/Thesis/Data/CenterLineMiles")

read_hm20 <- function(file){
  file <- read.csv(file, header = TRUE, as.is = T)
}

clean_hm20 <- function(dataframe){
  dataframe <- select(dataframe, 1, 16)
  dataframe <- dataframe[-1:-7,]
  names(dataframe) <- c("State", "CMT")
  dataframe <- dataframe[1:51,]
  dataframe
}

listfiles <- list.files(getwd())
listfiles <- listfiles[-20]

cmtlist <- lapply(listfiles, read_hm20)
cmtlist <- lapply(cmtlist, clean_hm20)

cmt <- do.call("rbind", cmtlist)

cmtlist[[1]]

#This will read in as factor variables for some reason
#Output the final dataset out open in Excel and change the format to number
#Reload the dataset and it should have numeric or integer data type


