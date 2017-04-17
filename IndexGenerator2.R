setwd("/Volumes/DiscDrive/Google Drive/Thesis/Data")
library(dplyr)
library(tidyverse)

dataset <- read.csv("DataSetFinal.csv", header = TRUE)


#Riskiness Index
indiv_year <- function(year){
  dfyear <<- filter(dataset, dataset$Year == year)
}


years <- seq(1996,2014,1)
dfyears <- lapply(years, indiv_year)


df96 <- as.data.frame(dfyears[1])
df97 <- as.data.frame(dfyears[2])
df98 <- as.data.frame(dfyears[3])
df99 <- as.data.frame(dfyears[4])
df00 <- as.data.frame(dfyears[5])
df01 <- as.data.frame(dfyears[6])
df02 <- as.data.frame(dfyears[7])
df03 <- as.data.frame(dfyears[8])
df04 <- as.data.frame(dfyears[9])
df05 <- as.data.frame(dfyears[10])
df06 <- as.data.frame(dfyears[11])
df07 <- as.data.frame(dfyears[12])
df08 <- as.data.frame(dfyears[13])
df09 <- as.data.frame(dfyears[14])
df10 <- as.data.frame(dfyears[15])
df11 <- as.data.frame(dfyears[16])
df12 <- as.data.frame(dfyears[17])
df13 <- as.data.frame(dfyears[18])
df14 <- as.data.frame(dfyears[19])



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

df96 <- Index_year(df96, "popUS", "x20.34","x35.69","x70plus",
            "x15.19Nat", "x20.34Nat", "x35.69Nat", "x70PlusNat")
df97 <- Index_year(df97, "popUS", "x20.34","x35.69","x70plus", 
            "x15.19Nat", "x20.34Nat", "x35.69Nat", "x70PlusNat")
df98 <- Index_year(df98, "popUS", "x20.34","x35.69","x70plus", 
            "x15.19Nat", "x20.34Nat", "x35.69Nat", "x70PlusNat")
df99 <- Index_year(df99, "popUS", "x20.34","x35.69","x70plus", 
            "x15.19Nat", "x20.34Nat", "x35.69Nat", "x70PlusNat")
df00 <- Index_year(df00, "popUS", "x20.34","x35.69","x70plus", 
            "x15.19Nat", "x20.34Nat", "x35.69Nat", "x70PlusNat")
df01 <- Index_year(df01, "popUS", "x20.34","x35.69","x70plus", 
            "x15.19Nat", "x20.34Nat", "x35.69Nat", "x70PlusNat")
df02 <- Index_year(df02, "popUS", "x20.34","x35.69","x70plus", 
            "x15.19Nat", "x20.34Nat", "x35.69Nat", "x70PlusNat")
df03 <- Index_year(df03, "popUS", "x20.34","x35.69","x70plus", 
            "x15.19Nat", "x20.34Nat", "x35.69Nat", "x70PlusNat")
df04 <- Index_year(df04, "popUS", "x20.34","x35.69","x70plus", 
            "x15.19Nat", "x20.34Nat", "x35.69Nat", "x70PlusNat")
df05 <- Index_year(df05, "popUS", "x20.34","x35.69","x70plus", 
            "x15.19Nat", "x20.34Nat", "x35.69Nat", "x70PlusNat")
df06 <- Index_year(df06, "popUS", "x20.34","x35.69","x70plus", 
            "x15.19Nat", "x20.34Nat", "x35.69Nat", "x70PlusNat")
df07 <- Index_year(df07, "popUS", "x20.34","x35.69","x70plus", 
            "x15.19Nat", "x20.34Nat", "x35.69Nat", "x70PlusNat")
df08 <- Index_year(df08, "popUS", "x20.34","x35.69","x70plus", 
            "x15.19Nat", "x20.34Nat", "x35.69Nat", "x70PlusNat")
df09 <- Index_year(df09, "popUS", "x20.34","x35.69","x70plus", 
            "x15.19Nat", "x20.34Nat", "x35.69Nat", "x70PlusNat")
df10 <- Index_year(df10, "popUS", "x20.34","x35.69","x70plus", 
            "x15.19Nat", "x20.34Nat", "x35.69Nat", "x70PlusNat")
df11 <- Index_year(df11, "popUS", "x20.34","x35.69","x70plus", 
            "x15.19Nat", "x20.34Nat", "x35.69Nat", "x70PlusNat")
df12 <- Index_year(df12, "popUS", "x20.34","x35.69","x70plus", 
            "x15.19Nat", "x20.34Nat", "x35.69Nat", "x70PlusNat")
df13 <- Index_year(df13, "popUS", "x20.34","x35.69","x70plus", 
            "x15.19Nat", "x20.34Nat", "x35.69Nat", "x70PlusNat")
df14 <- Index_year(df14, "popUS", "x20.34","x35.69","x70plus", 
            "x15.19Nat", "x20.34Nat", "x35.69Nat", "x70PlusNat")



dataset <- rbind(df96,df97,df98,df99,df00,df01,df02,df03,df04,df05,df06,
                 df07,df08,df09,df10,df11,df12,df13,df14,
                 deparse.level = 1)


dataset2 <- read.csv("FinalDataSet.csv", header = TRUE)
dataset2$x20.34 <- NULL
dataset2$x35.69 <- NULL
dataset2$x70plus <- NULL
dataset2 <- dataset2[,-53:-59]
dataset3 <- cbind(dataset2, dataset[,51:58])
dataset3 <- dataset3[,-1]

#Generates the percentage of a states population that is 
#in a given age bracket
dataset3$alpha <- dataset3$X15..x..19 / dataset$POP
dataset3$alpha20.34 <- dataset3$x20.34 / dataset$POP
dataset3$alpha35.69 <- dataset3$x35.69 / dataset$POP
dataset3$alpha70 <- dataset3$x70plus / dataset$POP


#Creates the state portion of the riskiness index
#This takes the accident rate (per capita(national)) and 
#multpilies it with the percentage of the
#states population in that age bracket
dataset3$stateIndex <- 
  (dataset3$alpha *(dataset3$X16.19Rate / dataset3$x15.19Nat) +
   dataset3$alpha20.34 * (dataset3$X20.34Rate / dataset3$x20.34Nat) + 
   dataset3$alpha35.69 * (dataset3$X35.69Rate / dataset3$x35.69Nat) +
   dataset3$alpha70 * (dataset3$X70.Rate / dataset3$x70PlusNat))

#Creates the national portion of the riskiness index
#This takes the accident rate (per capita(national)) and multpilies it
#with the percentage of the national population in that age bracket
dataset3$nationalIndex <- 
  ((dataset3$x15.19Nat / dataset3$popUS) *
     (dataset3$X16.19Rate / dataset3$x15.19Nat) +
  (dataset3$x20.34Nat / dataset3$popUS) * 
    (dataset3$X20.34Rate / dataset3$x20.34Nat) + 
  (dataset3$x35.69Nat / dataset3$popUS)* 
    (dataset3$X35.69Rate / dataset3$x35.69Nat) +
  (dataset3$x70PlusNat / dataset3$popUS) * 
    (dataset3$X70.Rate / dataset3$x70PlusNat))

#This creates a the riskiness index. 
#It is the ratio of a states riskiness and
#the national riskiness.
#Entries >1 imply that a state has a 
#greater than average risk due 
#to age makeup of its population
#Entries <1 imply that a state has a 
#less than average risk due 
#to the age makeup of its population
dataset3$stateriskiness <- 
  dataset3$stateIndex / dataset3$nationalIndex

#Weighted Loosenes Indices
dataset3$RecreationalW <-
  dataset3$Recreational / sum(dataset3$Recreational)
dataset3$ChronicPainW <- 
  dataset3$ChronicPain / sum(dataset3$ChronicPain)
dataset3$VoluntaryRegistrationW <- 
  dataset3$VoluntaryRegistration / sum(dataset3$VoluntaryRegistration)
dataset3$SmokableSupplyW <- 
  dataset3$SmokableSupply / sum(dataset3$SmokableSupply)
dataset3$HomeCultivationW <- 
  dataset3$HomeCultivation / sum(dataset3$HomeCultivation)
dataset3$CaregiversW <- 
  dataset3$Caregivers / sum(dataset3$Caregivers)
dataset3$OutofStateIDsW <- 
  dataset3$OutofStateIDs/ sum(dataset3$OutofStateIDs)
dataset3$RegistrationFreeW<- 
  dataset3$RegistrationFree / sum(dataset3$RegistrationFree)
dataset3$AssistanceProgramW <-
  dataset3$AssistanceProgram / sum(dataset3$AssistanceProgram)

#Sum of weighted looseness Indices
dataset3$SumW <- rowSums(dataset3[,67:74])



#Variables for the Linear Model
dataset3$VMT <- dataset3$VMT * 1000000
dataset3$VMT = dataset3$VMT
dataset3$VMT_CLM <- dataset3$VMT/ dataset3$CMT
dataset3$LM_CLM <- dataset3$Lane.Miles / dataset3$CMT
dataset3$FATAL_POP <- (dataset3$FATAL / dataset3$POP) *10000

#Linear Model 1
ols <- lm(FATAL_POP ~ VMT_CLM + LM_CLM + Sum + PrimarySeatbelt + 
            stateriskiness + AveragePrecipitation, data = dataset3)

#Outputs linear model results to text file
sink("LinearModel4.txt")
summary(ols2)
sink()




