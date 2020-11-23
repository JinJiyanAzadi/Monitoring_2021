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
cl <- colorRampPalette(c('blue', 'yellow','orange','red', 'magenta'))(100) 
plot(density_map, col = cl)  # Plot the map using the inputs set in "cl"
points(covid_planar)

# To overlap the countries on a map, we need to use a new library --> gdal / OSGeo association 
install.packages("rgdal")

# For Linux users additional steps OUTSIDE R:
# sudo apt-get update
# sudo apt-get install libgdal-dev libproj-dev

# (23.11.2020)

library(regdal) #OsGeo website
setwd()

covid <- read.table("covid_agg.csv", header = T)
covid

attach(covid) # to set the data that we are going to usr in the next linecode without the need to use $ to recall the coloumns

covid_planar <- ppp(lon, lat, c(-180, 180), c(-90, 90))
covid

density_map <- density(covid_planar)
plot(density_map)
points(covid_planar)

cl <- colorRampPalette(c('blue', 'yellow','orange','red', 'magenta'))(100) 
plot(density_map, col = cl)  # Plot the map using the inputs set in "cl"
points(covid_planar)

# Now we map the coastline, first we need to dowload in the lab folder the 3 files .shp .dbf .shx -> these are files structures,
# the first is "shape file", .dbf is the table representeing the point in teh shape file; .shx is the one connecting .shp + .dbf
# Each point is given coord x,y so we have now a "vector", connecting the dots, you get the lines, connecting the line, you get the polygons 

# readOGR -> a type of vecture structure / check definition

coastlines <- readOGR('ne_10m_coastline.shp')

# Let's replot now the density map adding the coastlines we just integrated

plot(coastlines, add = TURE) # T= the coastlines map to be on top of the previous map, if otherwise, I will only see the coastlines map

# now we change the points, we switch to the filled points to be more visible -> check again the point character table, we will use the point 19
coastlines <- readOGR('ne_10m_coastline.shp')
plot(density_map, col = cl)
points(covid_planar, pch = 19)
plot(coastlines, add = TRUE)


