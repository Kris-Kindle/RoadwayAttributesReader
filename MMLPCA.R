library(tidyverse)
library(psy)

dataset3 <- read.csv("FinalDataSet3.csv", header = T)

MML <- select(dataset3, Recreational, ChronicPain, 
              VoluntaryRegistration, SmokableSupply,
              HomeCultivation, Caregivers, OutofStateIDs, 
              RegistrationFree, AssistanceProgram)

#Uses the covariance matrix to perform PCA
MMLPCA.Cov <- princomp(MML)
plot(MMLPCA.Cov, type = "lines")

#Uses the correlation matrix to perform PCA
MMLPCA.Cor <- princomp(MML, cor =T)
plot(MMLPCA.Cor, type = "lines")

sink("MMLPCAcov.txt")
summary(MMLPCA.Cov)
sink()

sink("MMLPCAcor.txt")
summary(MMLPCA.Cor)
sink()


#Performs Factor Analysis to determine if there is
# 1 - 5 factors
MMLFA1 <- factanal(MML, factors =1)
MMLFA2 <- factanal(MML, factors =2)
MMLFA3 <- factanal(MML, factors =3)
MMLFA4 <- factanal(MML, factors =4)
MMLFA5 <- factanal(MML, factors =5)

#Outputs the results to a text file
sink("FactorAnalysis.txt")
summary(MMLFA1)
summary(MMLFA2)
summary(MMLFA3)
summary(MMLFA4)
summary(MMLFA5)
sink()

scree.plot(MML)