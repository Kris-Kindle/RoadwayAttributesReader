# Roadway Attribute Reader
This is designed to read in data from NHTSA regarding common attributes of the roadway system in the United States. It takes the data across a particular set of years and creates a dataframe in R. I created this to compile the data that I needed for my thesis analysis. This is a work in progress as I clean up the files and rewrite some of the functions to increase the portability.

## Roadway files
For my analysis I used the following tables to capture the given data.

-VM02 was used to capture the Vehicle Miles Traveled
-HM20 was used to capture the Center Line Miles
-HM60 was used to capture the Lane Miles

I chose to use these files because there are consistent with one another and were captured for every single year of my analysis. The functions that read these tables capture from the files the total of the given metric for every state and the District of Columbia plus the name of the state. It is then compiled into one dataframe with all of the years that you have downloaded the tables for.
