#To make a choropleth using choroplethr you must have a variable corresponding to the 
#state.region regions. This is a list of the United States in lower case.
#The rename function is in the choroplethr library
data96 <- rename(data96, c(State="region"))

#If your state names are not lower case the choropleth will not plot
data96$region <- tolower(data96$region)

#Rename the column that you wish to plot to value
data96 <- rename(data96, c(VMT="value"))



c = StateChoropleth$new(data96)
c$title = "1996 State Vehicle Miles Traveled"
c$legend = "VMT(in thousands of miles)"
c$set_num_colors(7)
c$set_zoom(NULL)
#This removes the State Abbreviation labels from the choropleth
c$show_labels = FALSE
without_abbr = c$render()

without_abbr