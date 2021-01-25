# Analysis of the Himalayans' Ice Cover over a perdiod of time

library(raster) # raster data i.e. images(pixels)
library(RStoolbox) #  for remote sensing
library(rgdal) # coastlines
library(ncdf4) # when using .nc files // the .nc format is the one related to the ESA data. This library will read these types of files
library(clorspace) # to choose a set palette from the package

setwd("D:/Utenti/Norma/Desktop/exam")

ALDH_Jan20 <- raster("c_gls_ALDH_202001030000_GLOBE_PROBAV_V1.5.1.nc")
ALDH_Jan19 <- raster("c_gls_ALDH_201901030000_GLOBE_PROBAV_V1.5.1.nc")
ALDH_Jan18 <- raster("c_gls_ALDH_201801030000_GLOBE_PROBAV_V1.5.1.nc")
ALDH_Jan17 <- raster("c_gls_ALDH_201701030000_GLOBE_PROBAV_V1.5.1.nc")
ALDH_Jan16 <- raster("c_gls_ALDH_201512240000_GLOBE_PROBAV_V1.5.1.nc")
ALDH_Jan15 <- raster("c_gls_ALDH_201412240000_GLOBE_PROBAV_V1.5.1.nc")
ALDH_Jan14 <- raster("c_gls_ALDH_201312240000_GLOBE_VGT_V1.4.1.nc")
ALDH_Jan13 <- raster("c_gls_ALDH_201212240000_GLOBE_VGT_V1.4.1.nc")
ALDH_Jan12 <- raster("")
ALDH_Jan11 <- raster("c_gls_ALDH_201012240000_GLOBE_VGT_V1.4.1.nc")
ALDH_Jan10 <- raster("c_gls_ALDH_200912240000_GLOBE_VGT_V1.4.1.nc")


ALDH_10yr <- stack(ALDH_Jan20, ALDH_Jan19, ALDH_Jan18, ALDH_Jan17, ALDH_Jan16, ALDH_Jan15, ALDH_Jan14, ALDH_Jan13, ALDH_Jan12, ALDH_Jan11, ALDH_Jan10) 

# Now we crop the images to highlight the Himalayans 
#

ext <- c(-180, 180, 25, 84)  # xmin xmax ymin ymax, where x=long & y=lat
Coast_Crop <- crop(coastlines, ext) # Then we create a second argument which is the cropped following the coordinates in the argument "ext"
plot(Coast_Crop)



sessionInfo() # to get the session info to be given to the public
Sys.time() # to publish the time at which the script is done

# Full script info @JinJiyanAzadi - github account to the following link: .....
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
