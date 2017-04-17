setwd("/Volumes/DiscDrive/Google Drive/Thesis/Data")
library(dplyr)
library(tidyverse)

dataset <- read.csv("DataSetFinal.csv", header = TRUE)

indiv_year <- function(year){
  dfyear <<- filter(dataset, dataset$Year == year)
}



years <- seq(1996,2014,1)
dfyears <- lapply(years, indiv_year)


Index_year <- function(df, colname1,colname2,colname3,colname4,colname5,colname6,colname7,colname8){
  df[[colname1]] <- sum(df$POP)
  df[[colname2]] <- rowSums(df[,11:13], na.rm = TRUE)
  df[[colname3]] <- rowSums(df[,14:20], na.rm = TRUE)
  df[[colname4]] <- rowSums(df[,21:24], na.rm = TRUE)
  df[[colname5]] <- sum(df$X15..x..19)
  df[[colname6]] <- sum(df[[colname2]])
  df[[colname7]] <- sum(df[[colname3]])
  df[[colname8]] <- sum(df[[colname4]])
  df
    }


df96 <- as.data.frame(dfyears[1])
df96$popUS <- sum(df96$POP)
df96$"x20.34" <- rowSums(df96[,11:13], na.rm = TRUE)
df96$"x35.69" <- rowSums(df96[,14:20], na.rm = TRUE)
df96$"x70plus" <- rowSums(df96[,21:24], na.rm = TRUE)
df96$x15.19Nat <- sum(df96$X15..x..19)
df96$x20.34Nat <- sum(df96$x20.34)
df96$x35.69Nat <- sum(df96$x35.69)
df96$x70PlusNat <- sum(df96$x70plus)


df97 <- as.data.frame(dfyears[2])
df97$popUS <- sum(df97$POP)

df98 <- as.data.frame(dfyears[3])
df98$popUS <- sum(df98$POP)

df99 <- as.data.frame(dfyears[4])
df99$popUS <- sum(df99$POP)

df00 <- as.data.frame(dfyears[5])
df00$popUS <- sum(df00$POP)

df01 <- as.data.frame(dfyears[6])
df01$popUS <- sum(df01$POP)

df02 <- as.data.frame(dfyears[7])
df02$popUS <- sum(df02$POP)

df03 <- as.data.frame(dfyears[8])
df03$popUS <- sum(df03$POP)

df04 <- as.data.frame(dfyears[9])
df04$popUS <- sum(df04$POP)

df05 <- as.data.frame(dfyears[10])
df05$popUS <- sum(df05$POP)

df06 <- as.data.frame(dfyears[11])
df06$popUS <- sum(df06$POP)

df07 <- as.data.frame(dfyears[12])
df07$popUS <- sum(df07$POP)

df08 <- as.data.frame(dfyears[13])
df08$popUS <- sum(df08$POP)

df09 <- as.data.frame(dfyears[14])
df09$popUS <- sum(df09$POP)

df10 <- as.data.frame(dfyears[15])
df10$popUS <- sum(df10$POP)

df11 <- as.data.frame(dfyears[16])
df11$popUS <- sum(df11$POP)

df12 <- as.data.frame(dfyears[17])
df12$popUS <- sum(df12$POP)

df13 <- as.data.frame(dfyears[18])
df13$popUS <- sum(df13$POP)

df14 <- as.data.frame(dfyears[19])
df14$popUS <- sum(df14$POP)

dataset2 <- rbind(df96,df97,df98,df99,df00,df01,df02,df03,df04,df05,df06,df07,df08,df09,df10,df11,df12,df13,df14, deparse.level = 1)

year_pop <- function(year){
  sum(filter(dataset, dataset$Year == year)$POP)
}



dataset$"x20.34" <- rowSums(dataset[,11:13], na.rm = TRUE)
dataset$"x35.69" <- rowSums(dataset[,14:20], na.rm = TRUE)
dataset$"x70plus" <- rowSums(dataset[,21:24], na.rm = TRUE)


#Creates the percentage of states population in a given age group
dataset$POP <- as.numeric(dataset$POP)
dataset$alpha <- dataset$X15..x..19 / dataset$POP
dataset$alpha20.34 <- dataset$x20.34 / dataset$POP
dataset$alpha35.69 <- dataset$x35.69 / dataset$POP
dataset$alpha70 <- dataset$x70plus / dataset$POP

#Creates the value for the top half of the index (state portion)
dataset$stateIndex <- (dataset$alpha *(dataset$X16.19Rate / dataset$X16.19Pop) +
  dataset$alpha20.34 * (dataset$X20.34Rate / dataset$X20.34Pop) + 
  dataset$alpha35.69 * (dataset$X35.69Rate / dataset$X35.69Pop) +
  dataset$alpha70 * (dataset$X70.Rate / dataset$X70.Pop))

#Creates the value for the bottom half of the index (national portion)
dataset$nationalIndex <- ((dataset$X16.19Pop / dataset2$popUS) *(dataset$X16.19Rate / dataset$X16.19Pop) +
                            (dataset$X20.34Pop / dataset2$popUS) * (dataset$X20.34Rate / dataset$X20.34Pop) + 
                            (dataset$X35.69Pop / dataset2$popUS)* (dataset$X35.69Rate / dataset$X35.69Pop) +
                            (dataset$X70.Pop / dataset2$popUS) * (dataset$X70.Rate / dataset$X70.Pop))

#Divides the state portion by the national portion
dataset$stateriskiness <- dataset$stateIndex / dataset$nationalIndex



#Variables for the Linear Model
dataset3$VMT_CLM <- dataset3$VMT/ dataset3$CMT
dataset3$LM_CLM <- dataset3$Lane.Miles / dataset3$CMT
dataset3$FATAL_POP <- (dataset3$FATAL / dataset3$POP) *10000

#Linear Model 1
ols <- lm(FATAL_POP ~ VMT_CLM + LM_CLM + SumW + stateriskiness, data = dataset)

#Outputs linear model results to text file
sink("LinearModel4.txt")
summary(ols2)
sink()



