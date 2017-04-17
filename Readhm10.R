read_hm10 <- function(file){
  file <- read.csv(file, header = TRUE, as.is = T)
}

clean_hm10 <- function(dataframe){
  dataframe <<- dataframe[-1:-7,]
  names(cmt96) <- c("State", "CMT")
  dataframe <<- dataframe[,-2:-15]
  cmt96 <-cmt96[-52:-59,]
}

listfiles <- list.files(getwd())
listfiles <- listfiles[-20]

cmtlist <- lapply(listfiles, read_hm10)
cmtlist <- lapply(cmtlist, clean_hm10)

number <- seq(1,19,1)

df96 <- as.data.frame(cmtlist[1])
df97 <- as.data.frame(cmtlist[2])
df98 <- as.data.frame(cmtlist[3])
df99 <- as.data.frame(cmtlist[4])
df00 <- as.data.frame(cmtlist[5])
df01 <- as.data.frame(cmtlist[6])
df02 <- as.data.frame(cmtlist[7])
df03 <- as.data.frame(cmtlist[8])
df04 <- as.data.frame(cmtlist[9])
df05 <- as.data.frame(cmtlist[10])
df06 <- as.data.frame(cmtlist[11])
df07 <- as.data.frame(cmtlist[12])
df08 <- as.data.frame(cmtlist[13])
df09 <- as.data.frame(cmtlist[14])
df10 <- as.data.frame(cmtlist[15])
df11 <- as.data.frame(cmtlist[16])
df12 <- as.data.frame(cmtlist[17])
df13 <- as.data.frame(cmtlist[18])
df14 <- as.data.frame(cmtlist[19])

cmt <- rbind(df96,df97,df98,df99,df00,df01,df02,df03,df04,df05,df06,df07,df08,df09,df10,df11,df12,df13,df14, deparse.level = 1)

dataset$CMT <- cmt$CMT

#This will read in as factor variables for some reason
#Output the final dataset out open in Excel and change the format to number
#Reload the dataset and it should have numeric or integer data type
