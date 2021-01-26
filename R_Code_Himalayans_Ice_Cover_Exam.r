# Analysis of the Himalayans' Ice Cover over a perdiod of time

library(raster) # raster data i.e. images(pixels)
library(RStoolbox) #  for remote sensing
library(rgdal) # coastlines
library(ncdf4) # when using .nc files // the .nc format is the one related to the ESA data. This library will read these types of files
library(clorspace) # to choose a set palette from the package

setwd("D:/Utenti/Norma/Desktop/exam")

AL_Feb15 <- raster("")
AL_Feb14 <- raster("")
AL_Feb13 <- raster("")
AL_Feb12 <- raster("")
AL_Feb11 <- raster("")
AL_Feb10 <- raster("")
AL_Feb09 <- raster("")
AL_Feb08 <- raster("")
AL_Feb07 <- raster("")
AL_Feb06 <- raster("")
AL_Feb05 <- raster("")
AL_Feb04 <- raster("")
AL_Feb03 <- raster("")
AL_Feb02 <- raster("")
AL_Feb01 <- raster("")
AL_Feb00 <- raster("")


ALDH_15yr <- stack(AL_Feb15, AL_Feb14, AL_Feb13, AL_Feb12, AL_Feb11, AL_Feb10, AL_Feb09, AL_Feb08, AL_Feb07, AL_Feb06, AL_Feb05, AL_Feb04, AL_Feb03, AL_Feb02, AL_Feb01, AL_Feb00) 

# Now we crop the images to highlight the Himalayans 
#

ext <- c(-180, 180, 25, 84)  # xmin xmax ymin ymax, where x=long & y=lat
Coast_Crop <- crop(coastlines, ext) # Then we create a second argument which is the cropped following the coordinates in the argument "ext"
plot(Coast_Crop)



sessionInfo() # to get the session info to be given to the public
Sys.time() # to publish the time at which the script is done

# Full script info @JinJiyanAzadi - github account to the following link: .....
# Insert full data citation as per user guide
# Include link to data page to see full description
###############################################################################################################

plot(IC_Jan21) # we are not happy with the colours so we will change it but forst we add the coastlines

# Adding the coastlines // before plot the image then the coastline , like this it should keep the proportion without cropping
coastlines <- readOGR('ne_10m_coastline.shp')
# coastlines_simp <- gSimplify(coastlines, tol = 3, topologyPreserve = TRUE)

# We crop the coastlines to match our image
# To do so we take the extent of the image then we crop it with the exact extent using the "ext" fixed argument
ext <- c(-180, 180, 25, 84)  # xmin xmax ymin ymax, where x=long & y=lat // ext is a fixed argument, we cannot change the name

# Then we create a second argument which is the cropped following the coordinates in the argument "ext"
Coast_Crop <- crop(coastlines, ext) 
plot(Coast_Crop, add = T) # the argument "add=T" is needed to add the coastlines on top of my current image

cl <- colorRampPalette(c('white', 'gray', 'darkgrey','lightblue','blue','purple'))(100) # 
cl <- choose_palette(name from the list)


plotRGB(Ic_Jan21_R, r=4, g=3, b=2, stretch="Lin")

IC_Jan21_R <- brick("c_gls_SCE_202101210000_NHEMI_VIIRS_V1.0.1.nc") # when I need to add up the wave bands

IC_Jan21_R <- reclassify(IC_Jan21, cbind(253:255, NA)) 

library(MODISTools) # not req


# https://www.r-bloggers.com/2018/10/the-av-package-production-quality-video-in-r/
# Library to plot the video, check BYS


difIce <-

EN <- stack(EN01,EN02,EN03,EN04,EN05,EN06,EN07,EN08,EN09,EN10,EN11,EN12,EN13) # done  

# Boxplot
dev.off()
boxplot(EN, horizontal=T, axis=T, outline=F)
