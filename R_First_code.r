# Write what you wish!

primates <- c(3, 5, 9, 15, 40) #set of individuals observed, this is an array of data
primate enter

#new set
crabs <- c(100, 70, 30, 10, 5)

# first plot in R
plot(primates, crabs)      # this is the function to plot the data
#change the color of the plot
plot(primates, crabs, col="red")

plot(primates, crabs, col="red", pch=19)  # change the point carachter pch - see the list from internet each point has a code numebr

#add new argument - carachter exageration cex
plot(primates, crabs, col="red", pch=19, cex=2)
plot(primates, crabs, col="red", pch=19, cex=6)

#add a title
plot(primates, crabs, col="red", pch=19, cex=6, main="My first ecological graph in R!")

#create a dataframe - table 
ecoset <- data.frame(primates, crabs)

# let's ask an ecological question: what's the mean of my data set?
#mean numb of individuals per site
(3+5+9+15+40)/5 # average primates per site

#eaier way using the summary function of the dataframe
summary(ecoset)
