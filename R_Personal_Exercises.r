# Code suggested by the prof to create a density map with the points' size resembling the number of cases. I changed the previous palette colours

# original code by the prof
library(sf)
Spoints <- st_as_sf(covid, coords = c("lon", "lat"))

plot(density_map)
# plot(Spoints, cex=Spoints$cases, add=T)
plot(Spoints, cex=Spoints$cases/10000, add=T)

# My changes
cl <- colorRampPalette(c('lightpink2','lightsalmon','tomato1','red3','maroon'))(100)
plot(density_map, col = cl)
plot(coastlines, add = T)
plot(Spoints, cex=Spoints$cases/10000, add=T)
# Warning message:
# In plot.sf(Spoints, cex = Spoints$cases/10000, add = T) :
# ignoring all but the first attribute

# In order to increase the thikness of the circles' line use the "lwd" arg and to unify the colour, use the "col" arg:
plot(Spoints, cex=Spoints$cases/10000, col = 'purple3', lwd = 3, add=T)

# Complete code:

# 0-library(spatstat)
# 1-Read the table
# 2-Chck with head() if all data are ok + attach() + ppp planar
# 3-Interpolation - via marks() to explain the data that you use, in this case the "cases" coloumn
#


library(sf)
library(spatstat)
library(rgdal)
setwd("D:/Utenti/Norma/Desktop/lab")
covid <- read.table("covid_agg.csv", header = T)
head(covid)
attach(covid) 
coastlines <- readOGR('ne_10m_coastline.shp')
Spoints <- st_as_sf(covid, coords = c("lon", "lat"))
marks(covid_planar) <- cases  # interpolation
cases_map <- Smooth(covid_planar) # interpolation
cl <- colorRampPalette(c('lightpink2','lightsalmon','tomato1','red3','maroon'))(100) 
density_map <- density(covid_planar)
plot(density_map)
plot(cases_map, col = cl)
plot(coastlines, add = T)
plot(Spoints, cex=Spoints$cases/10000, col = 'purple3', lwd = 3, add=T)
