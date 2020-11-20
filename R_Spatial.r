#Happy Friday! (13.11.2020)

library(sp)
head(meuse)

coordinates(meuse) = ~x+y # to say to R that we want to look at the data via coordinates 
plot(meuse)

#spplot is used to plot elements spread in space 
spplot(meuse, "zinc") # plot the zinc
spplot(meuse, "zinc", main = "Concentration of Zinc") # give it a title

# Do the same for copper
spplot(meuse, "copper", main = "Concentration of Copper")

# Compare the plots for Zinc and Copper
spplot(meuse, c("zinc", "copper"), main = "Concentrattion of Zinc and Copper")

# Use of the "bubble" function i.e. creating bubbles on graphs proportional to the magnitude of the values of the variables
bubble(meuse, "zinc")
bubble(meuse, "lead", col = "red")

# (16.11.2020) 

install.packages("ggplot2")
library(ggplot2)

# Let's build a set of ecological data frame to work on: today we choose biofuels + oxydative enzymes 

biofuels <- c(120, 200, 350, 570, 750) # arrays of values
oxydative <- c(1200, 1300, 21000, 34000, 50000)

# now, to built the data frame with the two variables, called d
d <- data.frame(biofuels, oxydative)

# Now, let's use the ggplot function to plot our created dataframe d --> check the variables of the ggplot f --> "aes" ahestetic 
ggplot(d, aes(x = biofuels, y = oxydative)) # this is to "set the plot", we open an empty window with the data to be plotted

# Now we add the geom_points() leaving no arguments within brackets, just to say to R that we are going to use it
ggplot(d, aes(x = biofuels, y = oxydative)) + geom_point()

# We act now within the geom_point function
ggplot(d, aes(x = biofuels, y = oxydative)) + geom_point(size = 5, col = "red")

# use lines now iso points: the funcion will be geom_line --> the idea is to show the "trend" of the data
ggplot(d, aes(x = biofuels, y = oxydative)) + geom_line(size = 5, col = "red")

# We can also "mix and match" with the geom_ functions:
ggplot(d, aes(x = biofuels, y = oxydative)) + geom_line() + geom_point(size = 5, col = "red")

# Using the polygon f
ggplot(d, aes(x = biofuels, y = oxydative)) + geom_polygon()
ggplot(d, aes(x = biofuels, y = oxydative)) + geom_line() + geom_point(size = 5, col = "red") + geom_polygon()

# Playing around with the "aes" 
ggplot(d, aes(x = biofuels, y = oxydative)) + geom_line(size = 3, colour = "red") + geom_point(size = 5, col = "blue") + geom_polygon(fill = "purple", size = 1)

# Import data into R from an external source: first, create a new directory called "lab" then we set the directory
setwd("path/lab")

# Fow Windows users
setwd("C:/lab/") # could be D: E: etc...

# For Mac users
setwd("/Users/Yourname/lab/")

# Linux
setwd("~/lab/")

# The Windows input above did not work for me so I had to use the getwd() to see my path in the laptotp" so after 
# that I managed to smoothly follow the next steps of the code to get to the first graph of the covid data.


# (20.11.2020)

getwd() # get the directory window
[1] "D:/Utenti/Norma/Desktop/lab"
setwd("D:/Utenti/Norma/Desktop/lab") # set the directory window

# Before going ahead I have installed the "spatsat package"
library(spatstat)

# import data: head=T means that there is a column header
covid <- read.table("covid_agg.csv", head=T) # T=TRUE as the dataset starts from row 2 with "head=T" we are telling to R thata data start from second row. 
#If we siad F, then the data would start from first row.

head(covid)
summary(covid)
names(covid) # to see the names of the coordinates of the dataframe
# x=log and y=lat

# Making the plot of all data
ggplot(covid, aes(x = lon, y = lat)) + geom_point()

# Plotting changing the size accordingly to the number of cases
ggplot(covid, aes(x = lon, y = lat, size = cases)) + geom_point()

