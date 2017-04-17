require(ggplot2)
require(graphics)
#Used to create tiled graphics using special multiplot function
require(grid)
#USed to create the Choropleths for each year
require(choroplethr)


MML <- select(dataset3, Year, region =  State, value = MML)
MML$region <- tolower(MML$region)

#Create a choropleth for the year 1996
MML96 <- filter(MML, Year == 1996)

c = StateChoropleth$new(MML96)
c$title = "1996"
c$legend = "MML"
c$set_num_colors(2)
c$set_zoom(NULL)
c$show_labels = FALSE
#Changes the fill color to green
c$ggplot_scale = scale_fill_brewer(name = "MML", palette = "Greens", 
                                   drop = FALSE)
cp96 = c$render()

#Create a choropleth for the year 2002
MML02 <- filter(MML, Year == 2002)

c = StateChoropleth$new(MML02)
c$title = "2002"
c$legend = "MML"
c$set_num_colors(2)
c$set_zoom(NULL)
c$show_labels = FALSE
#Changes the fill color to green
c$ggplot_scale = scale_fill_brewer(name = "MML", palette = "Greens", 
                                   drop = FALSE)
cp02 = c$render()

#Create a choropleth for the year 2002
MML08 <- filter(MML, Year == 2008)

c = StateChoropleth$new(MML08)
c$title = "2008"
c$legend = "MML"
c$set_num_colors(2)
c$set_zoom(NULL)
c$show_labels = FALSE
#Changes the fill color to green
c$ggplot_scale = scale_fill_brewer(name = "MML", palette = "Greens", 
                                   drop = FALSE)
cp08 = c$render()

MML14 <- filter(MML, Year == 2014)

#Create a choropleth for the year 2014
d = StateChoropleth$new(MML14)
d$title = "2014"
d$legend = "MML"
d$set_num_colors(2)
d$set_zoom(NULL)
d$show_labels = FALSE
d$ggplot_scale = scale_fill_brewer(name = "MML", palette = "Greens", 
                                   drop = FALSE)
cp14 = d$render()

# The custom function below is via
# ggplot2 Cookbook
# http://www.cookbook-r.com/Graphs
# /Multiple_graphs_on_one_page_(ggplot2)/

#Custom multiplot function
# Multiple plot function
#
# ggplot objects can be passed in ..., or to plotlist 
#(as a list of ggplot objects)
# - cols:   Number of columns in layout
# - layout: A matrix specifying the layout. 
# If present, 'cols' is ignored.
#
# If the layout is something like 
# matrix(c(1,2,3,3), nrow=2, byrow=TRUE),
# then plot 1 will go in the upper left, 
# 2 will go in the upper right, and
# 3 will go all the way across the bottom.
#
multiplot <- function(..., plotlist=NULL, file, cols=1, 
                      layout=NULL) {
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
    pushViewport(viewport(layout = grid.layout(nrow(layout),
                                               ncol(layout))))
    
    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that 
      # contain this subplot
      matchidx <- as.data.frame(which(layout == i, 
                                      arr.ind = TRUE))
      
      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}

#Create grid with the choropleths that we made

multiplot(cp96,cp02,cp08,cp14, layout = matrix(c(1,2,3,4), 
                                               nrow=2, byrow=TRUE))