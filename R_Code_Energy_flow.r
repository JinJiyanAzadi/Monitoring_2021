# 15.01.2021

library(rasterdiv)
library(raster)

# We will load the data CopNDVI --> Copernicus NDVI
data(copNDVI)
plot(copNDVI)
copNDVI <- reclassify(copNDVI, cbind(253:255, NA)) --> NA= not assigned // (253:255)to remove the blue and brown and rename the graph again to override the previous data
plot(copNDVI)

# to do the level plot we need
install.packages("rasterVis")
levelplot(copNDVI) --> I need to update R to be compatible with levelplot() f


# Using the yellow colour in the minim band
clymin <- colorRampPalette(c('yellow','red','blue'))(100) #
plot(copNDVI, col=clymin)

# Now we move the yellow in the middle values of the band --> medium part
clymed <- colorRampPalette(c('red','yellow','blue'))(100) # 
plot(copNDVI, col=clymed)

# Yellow in the higher band
clymax <- colorRampPalette(c('red','blue','yellow'))(100) #
plot(copNDVI, col=clymax
     
# Now we plot the medium and high yellow maps to see the difference 
par(mfrow=c(1,2))
clymed <- colorRampPalette(c('red','yellow','blue'))(100) # not good map
plot(copNDVI, col=clymed)
clymax <- colorRampPalette(c('blue','red','yellow'))(100) # best map
plot(copNDVI, col=clymax)


# How to crop the image from the wider data 
ext <- c(0,20,35,55)  # xmin xmax ymin ymax // ext is a fixed argument, cannot change the name
copNDVI_Italy <- crop(copNDVI, ext)
plot(copNDVI_Italy, col=clymax)
     
# 18.01.2021
# We have saved the two images "defo" in the lab forlder
library(raster)
library(RStoolbox)
