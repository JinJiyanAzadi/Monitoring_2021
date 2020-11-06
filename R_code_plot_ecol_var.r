# Go Biden!
# R code for plotting ecological relationships among several ecological variables

install.packages("sp") # we use the quotes as we are outside the R environment
library(sp) # we do not use the quotes as we are already in R

# the require f has the same functionality

# used to recall the meuse dataset
data(meuse)  

View(meuse) # the table will pop out showing all the data
head(meuse)ta

#ex --> find the mean of all the values
