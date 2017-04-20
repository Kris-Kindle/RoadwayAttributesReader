library(tidyverse)
setwd("/Users/Kris/Google Drive/Thesis/Data/VMT")
VM02_files <- list.files(getwd())
VM02_files <- VM02_files[-20]



read_VM02 <- function(file){
  file <- read.csv(file, header = TRUE, stringsAsFactors = F)
}

clean_VM02 <- function(dataframe){
  dataframe <- select(dataframe, 1, 16)
  dataframe <- dataframe[-1:-7,]
  names(dataframe) <- c("State", "VMT")
  dataframe <- dataframe[1:51,]
  dataframe
}


vmtlist <- lapply(VM02_files, read_VM02)

vmtlist <- lapply(vmtlist, clean_VM02)

vmt <- do.call("rbind", vmtlist)


vmt$VMT <- as.numeric(gsub(",","",vmt$VMT))


dataset3$VMT <- vmt$VMT

#This will read in as factor variables for some reason
#Output the final dataset out open in Excel and change the format to number
#Reload the dataset and it should have numeric or integer data type
