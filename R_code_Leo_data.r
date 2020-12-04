# 29.11.2020
# Exercise based upon data given by our classmate Leo on Venice's lagoon

leo <- read.table("dati_zabotti.csv", head=T, sep=",")
attach(leo)
leo_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))
marks(leo_ppp) <- chlh
chlh_map <- Smooth(leo_ppp)
plot(chlh_map)

marks(leo_ppp) <- t
t_map <- Smooth(leo_ppp)
plot(t_map)
points(leo_ppp)

par(mfrow=c(1,2))
plot(chlh_map)
points(leo_ppp)

plot(t_map)
points(leo_ppp)


# Exercise: do the same for chlorophyll in the sediment (chls)

library(spatstat)

setwd("D:/Utenti/Norma/Desktop/lab")

leo <- read.table("dati_zabotti.csv, head = T, sep = ",")

attach(leo)

leo_ppp <- ppp(x, y, c(2300000, 2325000), c(5005000, 5045000))

marks(leo_ppp) <- chls
chls_map <- Smooth(leo_ppp)
plot(chls_map)

marks(leo_ppp) <- t
t_map <- Smooth(leo_ppp)
plot(t_map)
points(leo_ppp)

par(mfrow=c(1,2))
plot(chls_map)
points(leo_ppp)

plot(t_map)
points(leo_ppp)

# Map all four of them with better resolution for the points

par(mfrow=c(2,2))
plot(chlh_map)
points(leo_ppp, col = "red", lwd = 2)

plot(t_map)
points(leo_ppp, col = "red", lwd = 2)

plot(chls_map)
points(leo_ppp, col = "red", lwd = 2)

plot(t_map)
points(leo_ppp, col = "red", lwd = 2)

# Changes during the class 30.11.2020

library(spatstat)
setwd("D:/Utenti/Norma/Desktop/lab")
leo <- read.table("dati_zabotti.csv, head = T, sep = ",")
attach(leo)
leo_ppp <- ppp(x, y, c(2300000, 2325000), c(5005000, 5045000))
plot(leo_ppp)
density_map <- density(leo_ppp)
plot(density_map)
points(leo_ppp)


# 04.12.2020 -- in classe
# Interpolation (linear)
# First we upload the saved .RData worksheet

setwd("D:/Utenti/Norma/Desktop/lab")
load("point_pattern_analysis.RData")
list()

# next, explain to R the variable we are going to use
library(spatstat) # as the marks f is in this package
attach(leo)
leo_ppp <- ppp(x, y, c(2300000, 2325000), c(5005000, 5045000))
marks(leo_ppp) <- chls

# first, we change the collour palette to avoid too much blue
cl <- colorRampPalette(c('yellow','orange','red','green'))(100) 
plot(chlh_map, col=cl)
chls_map <- Smooth(leo_ppp)
points(leo_ppp)

setwd("D:/Utenti/Norma/Desktop/lab")
leo_ppp <- ppp(x, y, c(2300000, 2325000), c(5005000, 5045000))
attach(leo)
plot(leo_ppp)
density_map <- density(leo_ppp)
plot(density_map)
cl <- colorRampPalette(c('yellow','orange','red','green'))(100) # to change the palatte
plot(density_map, col = cl)
points(leo_ppp)

# map the chls now (see my code above) 

marks(leo_ppp) <- chls
chls_map <- Smooth(leo_ppp)
plot(chls_map, col = cl)
points(leo_ppp)

