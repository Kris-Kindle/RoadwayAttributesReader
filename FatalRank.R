# Creates a variable with States ranked based on the number of fatal accidents
data96$FatalRank <- rank(-(data96$FATAL), ties.method = "first")

# remove a column
Data$Rank96 <- NULL

# Read in a new sheet
data96 <- read.xlsx("Data.xlsx", sheetIndex = 2, header = TRUE)

# Creates a vector with the set of years
years <- unique(Data$Years)

# Create a function to create a DataFrame for each year
create.years <- function(year){
  d <- subset(dataset3, Year == year)
}

# Create a list of years
years <- c(1996:2014)

# Create a list of Dataframes of years
yearset <- lapply(years, create.years)


# Function to create matrix of States rank by Fatalities
create.rank <- function(year){
  yearset[[year]]$FatalRank <- rank(-(yearset[[year]]$FATAL), ties.method = "first")
  
}

# Makes the matrix from the previous step into a data.frame
# This is so that we can add state names as a column
yearset2 <- as.data.frame(yearset)

# Adds the State column
yearset2$State <- unique(dataset3$State)

# Rename the variables with the year
# Should find a way to create automate this
yearset2 <- rename(yearset2, c("1997" = "x_1997"))
yearset2 <- rename(yearset2, c("1998" = "x_1998"))
yearset2 <- rename(yearset2, c("1999" = "x_1999"))
yearset2 <- rename(yearset2, c("2000" = "x_2000"))
yearset2 <- rename(yearset2, c("2001" = "x_2001"))
yearset2 <- rename(yearset2, c("2002" = "x_2002"))
yearset2 <- rename(yearset2, c("2003" = "x_2003"))
yearset2 <- rename(yearset2, c("2004" = "x_2004"))
yearset2 <- rename(yearset2, c("2005" = "x_2005"))
yearset2 <- rename(yearset2, c("2006" = "x_2006"))
yearset2 <- rename(yearset2, c("2007" = "x_2007"))
yearset2 <- rename(yearset2, c("2008" = "x_2008"))
yearset2 <- rename(yearset2, c("2009" = "x_2009"))
yearset2 <- rename(yearset2, c("2010" = "x_2010"))
yearset2 <- rename(yearset2, c("2011" = "x_2011"))
yearset2 <- rename(yearset2, c("2012" = "x_2012"))
yearset2 <- rename(yearset2, c("2013" = "x_2013"))
yearset2 <- rename(yearset2, c("2014" = "x_2014"))

# Reoders the columns
yearset2 <- yearset2[,c(16, 1:15)]

# Reshape the data to long
yearset2 <- reshape(yearset2, dir = "long", varying = 2:16, sep = "_")

# Create subset with just the top three states for fatalities
topThree <- subset(yearset2, State == "Florida" | State == "Texas" | State == "California")()

# Creates linplot of rank by fatalities 
qplot(Year, Rank, data = topThree, geom = "line", color = State, ylim = c(3,1), xlim = c(1996,2010))