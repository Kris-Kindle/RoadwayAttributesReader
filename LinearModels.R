library(psych)
library(tidyverse)
setwd("/Users/Kris/Google Drive/Thesis")

#Creates the first model and then writes 
#the ouput to a text file
ols <- lm(lnfadjfatalpc ~ lnvmtpc + seatbelt + LiberalC, 
          data = dataset4)
sink("Model1.txt")
summary(ols)
sink()

#Creates Latex table of summary data for first model
xtable(summary(ols))

#Creates the second model and then writes 
#the ouput to a text file
ols2 <- lm(lnfadjfatalpc ~ lnvmtpc + LiberalC + seatbelt, 
           data = dataset4)
sink("Model2.txt")
summary(ols2)
sink()

#Creates Latex table of summary data for second model
xtable(summary(ols))

#Create data frame of state dummy variables
StateDummies <- dummy.code(dataset4$stab)

#Create data frame of year dummy variables
Yeardummies <- dummy.code(dataset3$Year)

#Creates the third model and then writes 
#the output to a text file
ols3 <- lm(lnfadjfatalpc ~ lnvmtpc + LiberalC + seatbelt + 
             dummy.code(stab) + dummy.code(Year), 
           data = dataset4)
sink("Model3.txt")
summary(ols3)
sink()

#Creates the fourth model and then writes 
#the output to a text file
ols4 <- lm(lnfadjfatalpc ~ lnvmtpc + LiberalC + seatbelt +
            dummy.code(stab) +dummy.code(Year) + 
             Year*dummy.code(stab), 
           data = dataset4)
sink("Model4.txt")
summary(ols4)
sink()

