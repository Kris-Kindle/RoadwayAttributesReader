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

number <- seq(1,19,1)

df96 <- clean_VM02(as.data.frame(vmtlist[1]))
df97 <- clean_VM02(as.data.frame(vmtlist[2]))
df98 <- clean_VM02(as.data.frame(vmtlist[3]))
df99 <- clean_VM02(as.data.frame(vmtlist[4]))
df00 <- clean_VM02(as.data.frame(vmtlist[5]))
df01 <- clean_VM02(as.data.frame(vmtlist[6]))
df02 <- clean_VM02(as.data.frame(vmtlist[7]))
df03 <- clean_VM02(as.data.frame(vmtlist[8]))
df04 <- clean_VM02(as.data.frame(vmtlist[9]))
df05 <- clean_VM02(as.data.frame(vmtlist[10]))
df06 <- clean_VM02(as.data.frame(vmtlist[11]))
df07 <- clean_VM02(as.data.frame(vmtlist[12]))
df08 <- clean_VM02(as.data.frame(vmtlist[13]))
df09 <- clean_VM02(as.data.frame(vmtlist[14]))
df10 <- clean_VM02(as.data.frame(vmtlist[15]))
df11 <- clean_VM02(as.data.frame(vmtlist[16]))
df12 <- clean_VM02(as.data.frame(vmtlist[17]))
df13 <- clean_VM02(as.data.frame(vmtlist[18]))
df14 <- clean_VM02(as.data.frame(vmtlist[19]))

vmt <- rbind(df96,df97,df98,df99,df00,df01,df02,df03,df04,
             df05,df06,df07,df08,df09,df10,df11,df12,df13,df14, 
             deparse.level = 1)


vmt$VMT <- as.numeric(gsub(",","",vmt$VMT))


dataset3$VMT <- vmt$VMT

#This will read in as factor variables for some reason
#Output the final dataset out open in Excel 
#and change the format to number
#Reload the dataset and it should have 
#numeric or integer data type
