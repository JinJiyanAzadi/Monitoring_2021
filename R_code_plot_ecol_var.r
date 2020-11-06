# Go Biden!
# R code for plotting ecological relationships among several ecological variables

install.packages("sp") # we use the quotes as we are outside the R environment
library(sp) # we do not use the quotes as we are already in R

# the require f has the same functionality

# used to recall the meuse dataset
data(meuse)  

View(meuse) # the table will pop out showing all the data
head(meuse)

# Exercise: find the mean of all the values --< Solution: from past lecture we used the summary f to avoid to do it manually
summary(meuse) # it summarises all the UNIVARIANTs statistics of the observed dataset

# Ex 2: plot Zinc (y) against Cadmium (x) 
plot(cadmium, zinc) 
# --> Error in plot(cadmium, zinc) : oggetto "cadmium" non trovato // because I did not show R where to find the data

#Solution: use the $ to link the data
plot(meuse$cadmium, meuse$zinc) 

# To get the same result we can use the "attach f"
attach(meuse)
plot(cadmium, zinc) 
# I will get the same plot as the one made by using the $ option

# How to impress yr supervisor :D
# scatterplot matrixes
pairs(meuse)

# Ex 3: how to pair only certain elements of the dataset? 
pairs(~ cadmium + zinc, data = meuse, main = "Relation between Cadmium and Zinc")
