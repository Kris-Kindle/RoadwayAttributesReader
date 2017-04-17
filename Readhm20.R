library(tidyverse)
setwd("/Users/Kris/Google Drive/Thesis/Data/CenterLineMiles")
HM20_files <- list.files(getwd())
HM20_files <- HM20_files[-20]


read_hm20 <- function(file){
  file<- read.csv(file, header = TRUE, stringsAsFactors = F)
}

clean_hm20 <- function(dataframe){
  dataframe <- select(dataframe, 1, 16)
  dataframe <- dataframe[-1:-7,]
  names(dataframe) <- c("State", "CLM")
  dataframe <- dataframe[1:51,]
  dataframe
}


clmlist <- lapply(HM20_files, read_hm20)

number <- seq(1,19,1)

df96 <- clean_hm20(as.data.frame(clmlist[1]))
df97 <- clean_hm20(as.data.frame(clmlist[2]))
df98 <- clean_hm20(as.data.frame(clmlist[3]))
df99 <- clean_hm20(as.data.frame(clmlist[4]))
df00 <- clean_hm20(as.data.frame(clmlist[5]))
df01 <- clean_hm20(as.data.frame(clmlist[6]))
df02 <- clean_hm20(as.data.frame(clmlist[7]))
df03 <- clean_hm20(as.data.frame(clmlist[8]))
df04 <- clean_hm20(as.data.frame(clmlist[9]))
df05 <- clean_hm20(as.data.frame(clmlist[10]))
df06 <- clean_hm20(as.data.frame(clmlist[11]))
df07 <- clean_hm20(as.data.frame(clmlist[12]))
df08 <- clean_hm20(as.data.frame(clmlist[13]))
df09 <- clean_hm20(as.data.frame(clmlist[14]))
df10 <- clean_hm20(as.data.frame(clmlist[15]))
df11 <- clean_hm20(as.data.frame(clmlist[16]))
df12 <- clean_hm20(as.data.frame(clmlist[17]))
df13 <- clean_hm20(as.data.frame(clmlist[18]))
df14 <- clean_hm20(as.data.frame(clmlist[19]))

clm <- rbind(df96,df97,df98,df99,df00,df01,df02,df03,df04,df05,
             df06,df07,df08,df09,df10,df11,df12,df13,df14, 
             deparse.level = 1)

#This saves the day!!!!
#Changes charachter variables into numeric
#The variables are being imported as factor due to the 
#comma in the number but we forced it into 
#character then from character to numeric by removing the comma
clm$CLM <- as.numeric(gsub(",","",clm$CLM))

dataset3$CLM <- clm$CLM

#This will read in as factor variables for some reason
#Output the final dataset out open in Excel 
#and change the format to number
#Reload the dataset and it should have 
#numeric or integer data type
