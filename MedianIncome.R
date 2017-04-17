library(tidyverse)
library(xlsx)
setwd("/Volumes/DiscDrive/Google Drive/Thesis/Data/MedianIncome")

MI <- read.xlsx("MedianIncome.xlsx", header = T, sheetIndex = 1)

list_cols <- colnames(MI)
list_cols <- list_cols[-1]

MI <- gather(MI,Year, MedianIncome, X2014.:X1996.)
MI <- arrange(MI,Year,State)
MI <- filter(MI, State != "United States")

dataset3$MedianIncome <- MI$MedianIncome