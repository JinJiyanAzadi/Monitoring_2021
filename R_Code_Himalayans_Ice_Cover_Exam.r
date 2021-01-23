# Analysis of the Himalayans' Ice Cover over a perdiod of time

library(raster) # raster data i.e. images(pixels)
library(RStoolbox) #  for remote sensing
library(rgdal) # coastlines
library(ncdf4) # when using .nc files // the .nc format is the one related to the ESA data. This library will read these types of files

setwd("D:/Utenti/Norma/Desktop/lab")

IC_Jan21 <- brick("c_gls_SCE_202101210000_NHEMI_VIIRS_V1.0.1.nc")
IC_Jan21 # to see the carachteristics of the data
plot(IC_Jan21) # we are not happy with the colours so we will change it but forst we add the coastlines

# Adding the coastlines
coastlines <- readOGR('ne_10m_coastline.shp')
# coastlines_simp <- gSimplify(coastlines, tol = 3, topologyPreserve = TRUE)

# We crop the coastlines to match our image
# To do so we take the extent of the image then we crop it with the exact extent using the "ext" fixed argument
ext <- c(-180, 180, 25, 84)  # xmin xmax ymin ymax // ext is a fixed argument, we cannot change the name

# Then we create a second argument which is the cropped following the coordinates in the argument "ext"
Coast_Crop <- crop(coastlines, ext) 
plot(coastlines, add = T) # the argument "add=T" is needed to add the coastlines on top of my current image

cl <- colorRampPalette(c('lightblue','blues','white'))(100) # 
cl <- choose_palett(name from the list)


plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")

tjan21 <- raster("c_gls_SCE_202101210000_NHEMI_VIIRS_V1.0.1.nc")

copNDVI <- reclassify(copNDVI, cbind(253:255, NA)) 


# https://www.r-bloggers.com/2018/10/the-av-package-production-quality-video-in-r/
# Library to plot the video, check BYS


difIce <-

EN <- stack(EN01,EN02,EN03,EN04,EN05,EN06,EN07,EN08,EN09,EN10,EN11,EN12,EN13) 

# Boxplot
dev.off()
boxplot(EN, horizontal=T, axis=T, outline=F)
