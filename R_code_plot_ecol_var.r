# Go Biden!
# R code for plotting ecological relationships among several ecological variables (06.11.2020)

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

# LECTURE 2  on Ecological Variable  (09.11.2020)
# 
install.packages("sp")
library(sp)
data(meuse)
pairs(meuse)
head(meuse)

# cadmium copper lead zinc
# pairs with soil variables
# from coloumn 3 to coloumn 6, below we find two different ways of getting the same outcome
pairs(meuse[, 3:6]) # we use the comma, to add  new argument --> include all the rows and use ONLY coloumn from 3 to 6
# R is counting from 1 while other languages count from zero 0 --> So , how to solve the issue of the coloum counting?
# let's use the names of the coloumn:
pairs(~ cadmium, copper, lead, zinc, data = meuse) # in R the tilde means "equal" // difference within "tilde" and "equal"

# Ex. change the colour of the points
pairs(~ cadmium + copper + lead + zinc, data=meuse, col = 'red')

# Change the colour of each triangle by using the par() f

# Ex. change the shape of filled points . We want triangles so use code 17
pairs(~ cadmium + copper + lead + zinc, data=meuse, col = 'red', pch = 17)
# Ex. increase the size of the triangles
pairs(~ cadmium + copper + lead + zinc, data=meuse, col = 'red', pch = 17, cex = 3)


