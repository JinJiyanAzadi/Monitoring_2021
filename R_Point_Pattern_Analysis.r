#(20.11.2020)

# Point Spatial analysis (via spatstat package)

install.packages("spatstat")
library(spatstat)

getwd()
setwd()
covid <- read.table("covid_agg.csv", header = T)
covid

attach(covid) # all the variables will be recalled from the dataset without issues

# After "enter" the below message might appear

# The following objects are masked from covid (pos = 6)
# cases, cat, country, lat, lon

# Use the below sctript:
# if you do not use attach(covid) write as per below:
# covids <- ppp(covid$lon, covid$lat, c(-180,180), c(-90,90))Friend Requests

# PPP = Planar Point Pattern --> 
# x, y, ranges --> to establish the range of my data 
covid_planar <- ppp(lon, lat, c(-180, 180), c(-90, 90))
covid
# After enter the answer from R will be:
# Planar point pattern: 152 points
# window: rectangle = [-180, 180] x [-90, 90] units

density_map <- density(covid_planar)
plot(density_map)
points(covid_planar)

# How to change the colour of the map
cl <- colorRampPalette(c('yellow','orange','red'))(100) 
plot(density_map, col = cl)
points(covid_planar)

# To overlap the countries on a map, we need to use a new library --> gdal / OSGeo association 
install.packages("rgdal")

# For Linux users additional steps OUTSIDE R:
# sudo apt-get update
# sudo apt-get install libgdal-dev libproj-dev


