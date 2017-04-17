library(tidyverse)
library(xlsx)
setwd("/Volumes/DiscDrive/Google Drive/Thesis/Data/AvgTemp")

avgtemp <- read.xlsx("AvgTemp.xlsx", header =T, sheetIndex = 1)
dataset3$AverageTemp <- avgtemp$AverageTemp