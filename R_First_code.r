# Welcome all to the dark side! <3

primates <- c(3, 5, 9, 15, 40) # set of individuals observed, this is an array of data
primate (enter)

# new set
crabs <- c(100, 70, 30, 10, 5)

# first plot in R
plot(primates, crabs) # this is the function to plot the data

# change the color of the plot
plot(primates, crabs, col="red")

# change the point character pch - each pch has a code number to be imputed(find it on the manual or internet)
plot(primates, crabs, col="red", pch=19)  

# add a new argument: character exageration "cex"
plot(primates, crabs, col="red", pch=19, cex=2) # example with cex=2
plot(primates, crabs, col="red", pch=19, cex=6) # example with cex=6

# add a title to my plot
plot(primates, crabs, col="red", pch=19, cex=6, main="My first ecological graph in R!")

# create a dataframe i.e. a table containing my data 
ecoset <- data.frame(primates, crabs)

# let's ask an ecological question: what's the mean of my data set?
# for example mean numb of individuals per site?
(3+5+9+15+40)/5 # average primates per site

# eaier way is using the summary function of the dataframe
summary(ecoset)
