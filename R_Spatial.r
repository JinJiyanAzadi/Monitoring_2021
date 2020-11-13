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


