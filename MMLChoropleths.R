#Load the necessary libraries
#Used for the rename function
require(XLConnect)
#Used to load workbook
require(xlsx)

require(ggplot2)
require(graphics)
#Used to create tiled graphics using special multiplot function
require(grid)
#USed to create the Choropleths for each year
require(choroplethr)

#Load the file
setwd("/Volumes/DiscDrive/Google Drive/Thesis/Data/MMLYears")
MML <- read.xlsx("MMLBreakdown3.xlsx", sheetIndex =1, header =TRUE)

#Renames the State variable to be consistent with choroplethr requirements
MML <-rename(MML, c(State = "region"))

#Creates all lower case version of the state names to be consistent with the choroplethr
#rrequirements
MML$region <- tolower(MML$region)

#Renames the MML variable to be consistent with the requirement for choroplethr
MML <- rename(MML, c(MML = "value"))

#Create subsets for the years 1996 - 2014
MML96 <- subset(MML, Year == 1996)
MML97 <- subset(MML, Year == 1997)
MML98 <- subset(MML, Year == 1998)
MML99 <- subset(MML, Year == 1999)
MML00 <- subset(MML, Year == 2000)
MML01 <- subset(MML, Year == 2001)
MML02 <- subset(MML, Year == 2002)
MML03 <- subset(MML, Year == 2003)
MML04 <- subset(MML, Year == 2004)
MML05 <- subset(MML, Year == 2005)
MML06 <- subset(MML, Year == 2006)
MML07 <- subset(MML, Year == 2007)
MML08 <- subset(MML, Year == 2008)
MML09 <- subset(MML, Year == 2009)
MML10 <- subset(MML, Year == 2010)
MML11 <- subset(MML, Year == 2011)
MML12 <- subset(MML, Year == 2012)
MML13 <- subset(MML, Year == 2013)
MML14 <- subset(MML, Year == 2014)

#Create a choropleth for the year 2002
c = StateChoropleth$new(MML02)
c$title = "2002"
c$legend = "MML"
c$set_num_colors(2)
c$set_zoom(NULL)
c$show_labels = FALSE
#Changes the fill color to green
c$ggplot_scale = scale_fill_brewer(name = "MML", palette = "Greens", drop = FALSE)
cp02 = c$render()

#Create a choropleth for the year 2014
d = StateChoropleth$new(MML14)
d$title = "2014"
d$legend = "MML"
d$set_num_colors(2)
d$set_zoom(NULL)
d$show_labels = FALSE
cp14 = d$render()

#Custom multiplot function
# Multiple plot function
#
# ggplot objects can be passed in ..., or to plotlist (as a list of ggplot objects)
# - cols:   Number of columns in layout
# - layout: A matrix specifying the layout. If present, 'cols' is ignored.
#
# If the layout is something like matrix(c(1,2,3,3), nrow=2, byrow=TRUE),
# then plot 1 will go in the upper left, 2 will go in the upper right, and
# 3 will go all the way across the bottom.
#
multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  library(grid)
  
  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)
  
  numPlots = length(plots)
  
  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                     ncol = cols, nrow = ceiling(numPlots/cols))
  }
  
  if (numPlots==1) {
    print(plots[[1]])
    
  } else {
    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
    
    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
      
      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}

#Create grid with the choropleths that we made

multiplot(cp96, cp02,cp08,cp14, layout = matrix(c(1,2,3,4), nrow=2, byrow=TRUE))

