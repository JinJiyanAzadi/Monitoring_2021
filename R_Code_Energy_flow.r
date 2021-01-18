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
setwd("D:/Utenti/Norma/Desktop/lab")
defor1 <- brick("defor1_.jpg") #defor1_.png if errors come out: "defor1_.png" as the file was actually saved as .png

plotRGB(defor1, 1,2,3, stretch="Lin") # RGB to recap is the way how tech items reflect the colours so the colours bands // the "stretch" is to amplify the colours 
# or plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")

#
defor2 <- brick("defor2_.png")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")
par(mfrow=c(2,1))
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")

defor1

# compute the DVI for the first period
dvi1 <- defor1$defor1_.1 - defor1$defor1_.2 # connecting the colours band of the same image and subtract them to get the DVI
 
dev.off() # to cancel the things done before
plot(dvi1)

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi1, col=cl)

dvi2 <- defor2$defor2_.1 - defor2$defor2_.2
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi2, col=cl)

par(mfrow=c(2,1)) # multiframe to compare the data over time
plot(dvi1, col=cl, main="DVI before the cut")
plot(dvi2, col=cl, main="DVI after the cut")
# The higher the level of yellow the lower the capability of doing photosynthesis 

# Difference in biomass - DVI - before/after the cut so DVI1-DVI2
difdvi <- dvi1 - dvi2
dev.off()
plot(difdvi)

cldif <- colorRampPalette(c('blue','white','red'))(100) 
plot(difdvi, col=cldif)
plot(difdvi, col=cldif, main="Amount of energy lost!") # the amount of energy=biomass we lost cutting the forest to make space for the agriculture

# Plotting now the histogram we can represent the amount of biomass loss, as the positive values are more then the negative, it means 
# that in the subtractions of the DVIs we have a great loss of biomass
hist(difdvi, col="red")

# Final par for comparison:
# defor1
# defor2
# dvi1
# dvi2
# difdvi
# histogtame
#The titles will drop off, but using the ggplot() we can re-add them
par(mfrow=c(3,2))
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")
plot(dvi1, col=cl, main="biomass before cut")
plot(dvi2, col=cl, main="biomass after cut")
plot(difdvi, col=cldif, main="amount of energy lost!")
hist(difdvi, col="red")

