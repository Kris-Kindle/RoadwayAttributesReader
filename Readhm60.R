library(tidyverse)
setwd("/Users/Kris/Google Drive/Thesis/Data/LaneMiles")
HM60_files <- list.files(getwd())
HM60_files <- HM60_files[-20]



read_hm60 <- function(file){
  file <- read.csv(file, header = FALSE,  stringsAsFactors = F)
}

clean_hm60 <- function(dataframe){
  dataframe <- select(dataframe, 1, 16)
  dataframe <- dataframe[-1:-8,]
  names(dataframe) <- c("State", "LM")
  dataframe <- dataframe[1:51,]
  dataframe
}


lmlist <- lapply(HM60_files, read_hm60)

number <- seq(1,19,1)

df96 <- clean_hm60(as.data.frame(lmlist[1]))
df97 <- clean_hm60(as.data.frame(lmlist[2]))
df98 <- clean_hm60(as.data.frame(lmlist[3]))
df99 <- clean_hm60(as.data.frame(lmlist[4]))
df00 <- clean_hm60(as.data.frame(lmlist[5]))
df01 <- clean_hm60(as.data.frame(lmlist[6]))
df02 <- clean_hm60(as.data.frame(lmlist[7]))
df03 <- clean_hm60(as.data.frame(lmlist[8]))
df04 <- clean_hm60(as.data.frame(lmlist[9]))
df05 <- clean_hm60(as.data.frame(lmlist[10]))
df06 <- clean_hm60(as.data.frame(lmlist[11]))
df07 <- clean_hm60(as.data.frame(lmlist[12]))
df08 <- clean_hm60(as.data.frame(lmlist[13]))
df09 <- clean_hm60(as.data.frame(lmlist[14]))
df10 <- clean_hm60(as.data.frame(lmlist[15]))
df11 <- clean_hm60(as.data.frame(lmlist[16]))
df12 <- clean_hm60(as.data.frame(lmlist[17]))
df13 <- clean_hm60(as.data.frame(lmlist[18]))
df14 <- clean_hm60(as.data.frame(lmlist[19]))

lm <- rbind(df96,df97,df98,df99,df00,df01,df02,df03,df04,df05,
            df06,df07,df08,df09,df10,df11,df12,df13,df14, 
            deparse.level = 1)

lm$LM <- as.numeric(gsub(",","",lm$LM))

dataset3$LM <- lm$LM

#This will read in as factor variables for some reason
#Output the final dataset out open in Excel 
#and change the format to number
#Reload the dataset and it should 
#have numeric or integer data type
