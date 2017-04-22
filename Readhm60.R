library(tidyverse)
setwd("/Users/Kris/Google Drive/Thesis/Data/LaneMiles")
HM60_files <- list.files(getwd())
HM60_files <- HM60_files[-20]



read_hm60 <- function(file){
  file <- read.csv(file, header = FALSE,  stringsAsFactors = F)
}


clean_hm60 <- function(dataframe){
  dataframe <- select(dataframe, 1, 16)
  dataframe <- dataframe[-1:-7,]
  names(dataframe) <- c("State", "LM")
  dataframe <- dataframe[1:51,]
  dataframe
}


lmlist <- lapply(HM60_files, read_hm60)

test <- clean_hm60(lmlist[[13]])

lmlist <- lapply(lmlist, clean_hm60)

lm <- do.call("rbind", lmlist)


lm$LM <- as.numeric(gsub(",","",lm$LM))

dataset3$LM <- lm$LM

#This will read in as factor variables for some reason
#Output the final dataset out open in Excel and change the format to number
#Reload the dataset and it should have numeric or integer data type
