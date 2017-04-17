library(tidyverse)


years <- seq(1996,2014,1)

create.year<- function(year){
  year <- dplyr::filter(dataset3, Year == year)
  year$FATALRANK <- rank(desc(year$FATAL))
  year
}

yearset <- lapply(years, create.year)

yearset2 <- do.call("rbind", yearset)
yearset2$FATALRANK <- as.integer(yearset2$FATALRANK)


top_3 <- filter(yearset2, State == "California" | 
                  State == "Florida" | State == "Texas")

qplot(Year, FATALRANK, data = top_3, geom = "line", 
      color = State, ylim = c(3,1), xlim = c(1996,2014),
      ylab = "Rank by Fatalities") 
  
#ggplot(top_3, aes(x = Year,  y = FATALRANK)) + 
geom_line(aes(color = State))


