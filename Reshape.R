setwd("/Volumes/DiscDrive/Google Drive/Thesis/Data/Population")
library(dplyr)


year_pop <- function(year){
  sum(filter(dataset, dataset$Year == year)$POP)
}

pop <- read.csv("PopAge10-15.csv", header = TRUE)
pop10 <- pop[,1:5]
pop10 <- pop10[,-4]
rpop10 <- spread(pop10, AGE, POPEST2010_CIV)
rpop10$SEX <- NULL

rpop10$"<5" <- rowSums(rpop10[,2:6], na.rm = TRUE)
rpop10$"5-9" <- rowSums(rpop10[,7:11], na.rm = TRUE)
rpop10$"10-14" <- rowSums(rpop10[,12:16], na.rm = TRUE)
rpop10$"15-19" <- rowSums(rpop10[,17:21], na.rm = TRUE)
rpop10$"20-24" <- rowSums(rpop10[,22:26], na.rm = TRUE)
rpop10$"25-29" <- rowSums(rpop10[,27:31], na.rm = TRUE)
rpop10$"30-34" <- rowSums(rpop10[,32:36], na.rm = TRUE)
rpop10$"35-39" <- rowSums(rpop10[,37:41], na.rm = TRUE)
rpop10$"40-44" <- rowSums(rpop10[,42:46], na.rm = TRUE)
rpop10$"45-49" <- rowSums(rpop10[,47:51], na.rm = TRUE)
rpop10$"50-54" <- rowSums(rpop10[,52:56], na.rm = TRUE)
rpop10$"55-59" <- rowSums(rpop10[,57:61], na.rm = TRUE)
rpop10$"60-64" <- rowSums(rpop10[,62:66], na.rm = TRUE)
rpop10$"65-69" <- rowSums(rpop10[,67:71], na.rm = TRUE)
rpop10$"70-74" <- rowSums(rpop10[,72:76], na.rm = TRUE)
rpop10$"75-79" <- rowSums(rpop10[,77:81], na.rm = TRUE)
rpop10$"80-84" <- rowSums(rpop10[,82:86], na.rm = TRUE)
rpop10$">85" <- rowSums(rpop10[,87:88]) -rowSums(rpop10[,2:86], na.rm = TRUE)
rpop10 <- rpop10[,-2:-88]


pop11 <- pop[,c("NAME", "AGE", "POPEST2011_CIV")]
rpop11 <- spread(pop11, AGE, POPEST2011_CIV)

rpop11$"<5" <- rowSums(rpop11[,2:6], na.rm = TRUE)
rpop11$"5-9" <- rowSums(rpop11[,7:11], na.rm = TRUE)
rpop11$"10-14" <- rowSums(rpop11[,12:16], na.rm = TRUE)
rpop11$"15-19" <- rowSums(rpop11[,17:21], na.rm = TRUE)
rpop11$"20-24" <- rowSums(rpop11[,22:26], na.rm = TRUE)
rpop11$"25-29" <- rowSums(rpop11[,27:31], na.rm = TRUE)
rpop11$"30-34" <- rowSums(rpop11[,32:36], na.rm = TRUE)
rpop11$"35-39" <- rowSums(rpop11[,37:41], na.rm = TRUE)
rpop11$"40-44" <- rowSums(rpop11[,42:46], na.rm = TRUE)
rpop11$"45-49" <- rowSums(rpop11[,47:51], na.rm = TRUE)
rpop11$"50-54" <- rowSums(rpop11[,52:56], na.rm = TRUE)
rpop11$"55-59" <- rowSums(rpop11[,57:61], na.rm = TRUE)
rpop11$"60-64" <- rowSums(rpop11[,62:66], na.rm = TRUE)
rpop11$"65-69" <- rowSums(rpop11[,67:71], na.rm = TRUE)
rpop11$"70-74" <- rowSums(rpop11[,72:76], na.rm = TRUE)
rpop11$"75-79" <- rowSums(rpop11[,77:81], na.rm = TRUE)
rpop11$"80-84" <- rowSums(rpop11[,82:86], na.rm = TRUE)
rpop11$">85" <- rowSums(rpop11[,87:88]) -rowSums(rpop11[,2:86], na.rm = TRUE)
rpop11 <- rpop11[,-2:-88]

pop12 <- pop[,c("NAME", "AGE", "POPEST2012_CIV")]
rpop12 <- spread(pop12, AGE, POPEST2012_CIV)

rpop12$"<5" <- rowSums(rpop12[,2:6], na.rm = TRUE)
rpop12$"5-9" <- rowSums(rpop12[,7:11], na.rm = TRUE)
rpop12$"10-14" <- rowSums(rpop12[,12:16], na.rm = TRUE)
rpop12$"15-19" <- rowSums(rpop12[,17:21], na.rm = TRUE)
rpop12$"20-24" <- rowSums(rpop12[,22:26], na.rm = TRUE)
rpop12$"25-29" <- rowSums(rpop12[,27:31], na.rm = TRUE)
rpop12$"30-34" <- rowSums(rpop12[,32:36], na.rm = TRUE)
rpop12$"35-39" <- rowSums(rpop12[,37:41], na.rm = TRUE)
rpop12$"40-44" <- rowSums(rpop12[,42:46], na.rm = TRUE)
rpop12$"45-49" <- rowSums(rpop12[,47:51], na.rm = TRUE)
rpop12$"50-54" <- rowSums(rpop12[,52:56], na.rm = TRUE)
rpop12$"55-59" <- rowSums(rpop12[,57:61], na.rm = TRUE)
rpop12$"60-64" <- rowSums(rpop12[,62:66], na.rm = TRUE)
rpop12$"65-69" <- rowSums(rpop12[,67:71], na.rm = TRUE)
rpop12$"70-74" <- rowSums(rpop12[,72:76], na.rm = TRUE)
rpop12$"75-79" <- rowSums(rpop12[,77:81], na.rm = TRUE)
rpop12$"80-84" <- rowSums(rpop12[,82:86], na.rm = TRUE)
rpop12$">85" <- rowSums(rpop12[,87:88]) -rowSums(rpop12[,2:86], na.rm = TRUE)
rpop12 <- rpop12[,-2:-88]

pop13 <- pop[,c("NAME", "AGE", "POPEST2013_CIV")]
rpop13 <- spread(pop13, AGE, POPEST2013_CIV)

rpop13$"<5" <- rowSums(rpop13[,2:6], na.rm = TRUE)
rpop13$"5-9" <- rowSums(rpop13[,7:11], na.rm = TRUE)
rpop13$"10-14" <- rowSums(rpop13[,12:16], na.rm = TRUE)
rpop13$"15-19" <- rowSums(rpop13[,17:21], na.rm = TRUE)
rpop13$"20-24" <- rowSums(rpop13[,22:26], na.rm = TRUE)
rpop13$"25-29" <- rowSums(rpop13[,27:31], na.rm = TRUE)
rpop13$"30-34" <- rowSums(rpop13[,32:36], na.rm = TRUE)
rpop13$"35-39" <- rowSums(rpop13[,37:41], na.rm = TRUE)
rpop13$"40-44" <- rowSums(rpop13[,42:46], na.rm = TRUE)
rpop13$"45-49" <- rowSums(rpop13[,47:51], na.rm = TRUE)
rpop13$"50-54" <- rowSums(rpop13[,52:56], na.rm = TRUE)
rpop13$"55-59" <- rowSums(rpop13[,57:61], na.rm = TRUE)
rpop13$"60-64" <- rowSums(rpop13[,62:66], na.rm = TRUE)
rpop13$"65-69" <- rowSums(rpop13[,67:71], na.rm = TRUE)
rpop13$"70-74" <- rowSums(rpop13[,72:76], na.rm = TRUE)
rpop13$"75-79" <- rowSums(rpop13[,77:81], na.rm = TRUE)
rpop13$"80-84" <- rowSums(rpop13[,82:86], na.rm = TRUE)
rpop13$">85" <- rowSums(rpop13[,87:88]) -rowSums(rpop13[,2:86], na.rm = TRUE)
rpop13 <- rpop13[,-2:-88]

pop14 <- pop[,c("NAME", "AGE", "POPEST2014_CIV")]
rpop14 <- spread(pop14, AGE, POPEST2014_CIV)

rpop14$"<5" <- rowSums(rpop14[,2:6], na.rm = TRUE)
rpop14$"5-9" <- rowSums(rpop14[,7:11], na.rm = TRUE)
rpop14$"10-14" <- rowSums(rpop14[,12:16], na.rm = TRUE)
rpop14$"15-19" <- rowSums(rpop14[,17:21], na.rm = TRUE)
rpop14$"20-24" <- rowSums(rpop14[,22:26], na.rm = TRUE)
rpop14$"25-29" <- rowSums(rpop14[,27:31], na.rm = TRUE)
rpop14$"30-34" <- rowSums(rpop14[,32:36], na.rm = TRUE)
rpop14$"35-39" <- rowSums(rpop14[,37:41], na.rm = TRUE)
rpop14$"40-44" <- rowSums(rpop14[,42:46], na.rm = TRUE)
rpop14$"45-49" <- rowSums(rpop14[,47:51], na.rm = TRUE)
rpop14$"50-54" <- rowSums(rpop14[,52:56], na.rm = TRUE)
rpop14$"55-59" <- rowSums(rpop14[,57:61], na.rm = TRUE)
rpop14$"60-64" <- rowSums(rpop14[,62:66], na.rm = TRUE)
rpop14$"65-69" <- rowSums(rpop14[,67:71], na.rm = TRUE)
rpop14$"70-74" <- rowSums(rpop14[,72:76], na.rm = TRUE)
rpop14$"75-79" <- rowSums(rpop14[,77:81], na.rm = TRUE)
rpop14$"80-84" <- rowSums(rpop14[,82:86], na.rm = TRUE)
rpop14$">85" <- rowSums(rpop14[,87:88]) -rowSums(rpop14[,2:86], na.rm = TRUE)
rpop14 <- rpop14[,-2:-88]


write.csv(rpop11, "PopAge11.csv", row.names = TRUE)
write.csv(rpop12, "PopAge12.csv", row.names = TRUE)
write.csv(rpop13, "PopAge13.csv", row.names = TRUE)
write.csv(rpop14, "PopAge14.csv", row.names = TRUE)



