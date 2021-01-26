# Analysis of the Himalayans' Ice Cover over a perdiod of time

library(raster) # raster data i.e. images(pixels)
library(RStoolbox) #  for remote sensing
library(rgdal) # for .hdf files from MODIS
library(ncdf4) # for .nc files 
library(clorspace) # to choose a set palette from the package // # not req for now
library(MODISTools) # not req for now

setwd("D:/Utenti/Norma/Desktop/exam")

# Exercise one: raster the albedo for 15yr, crop the image, create a video

# Albedo - Directional Albedo 1km Global V1 - datset from Copernicus
# https://land.copernicus.vgt.vito.be/PDF/portal/Application.html#Browse;Root=511344;Collection=1000174;DoSearch=true;
# Time=NORMAL,NORMAL,1,JANUARY,2000,31,DECEMBER,2015;
# ROI=68.753799392097,22.705167173252,110.6990881459,44.954407294833

AL_Feb15 <- raster("c_gls_ALDH_201501240000_GLOBE_PROBAV_V1.5.1.nc")
AL_Feb14 <- raster("c_gls_ALDH_201401240000_GLOBE_VGT_V1.4.1.nc")
AL_Feb13 <- raster("c_gls_ALDH_201301240000_GLOBE_VGT_V1.4.1.nc")
AL_Feb12 <- raster("c_gls_ALDH_201201240000_GLOBE_VGT_V1.4.1.nc")
AL_Feb11 <- raster("c_gls_ALDH_201101240000_GLOBE_VGT_V1.4.1.nc")
AL_Feb10 <- raster("c_gls_ALDH_201001240000_GLOBE_VGT_V1.4.1.nc")
AL_Feb09 <- raster("c_gls_ALDH_200901240000_GLOBE_VGT_V1.4.1.nc")
AL_Feb08 <- raster("c_gls_ALDH_200801240000_GLOBE_VGT_V1.4.1.nc")
AL_Feb07 <- raster("c_gls_ALDH_200701240000_GLOBE_VGT_V1.4.1.nc")
AL_Feb06 <- raster("c_gls_ALDH_200601240000_GLOBE_VGT_V1.4.1.nc")
AL_Feb05 <- raster("c_gls_ALDH_200501240000_GLOBE_VGT_V1.4.1.nc")
AL_Feb04 <- raster("c_gls_ALDH_200401240000_GLOBE_VGT_V1.4.1.nc")
AL_Feb03 <- raster("c_gls_ALDH_200301240000_GLOBE_VGT_V1.4.1.nc")
AL_Feb02 <- raster("c_gls_ALDH_200201240000_GLOBE_VGT_V1.4.1.nc")
AL_Feb01 <- raster("c_gls_ALDH_200101240000_GLOBE_VGT_V1.4.1.nc")
AL_Feb00 <- raster("c_gls_ALDH_200001240000_GLOBE_VGT_V1.4.1.nc")

cl <-

# Now we crop the images to highlight the Himalayas: Try to crop a stack to save some time
ext <- c(-180, 180, 25, 84)  # xmin xmax ymin ymax, where x=long & y=lat
Coast_Crop <- crop(coastlines, ext) # Then we create a second argument which is the cropped following the coordinates in the argument "ext"
plot(Coast_Crop)

ALDH_15yr <- stack(AL_Feb15, AL_Feb14, AL_Feb13, AL_Feb12, AL_Feb11, AL_Feb10, AL_Feb09, AL_Feb08, AL_Feb07, AL_Feb06, AL_Feb05, AL_Feb04, AL_Feb03, AL_Feb02, AL_Feb01, AL_Feb00) 



# https://www.r-bloggers.com/2018/10/the-av-package-production-quality-video-in-r/
# Library to plot the video, check BYS

# Exercise two: Mosaic of glaciers and their differences over time

# This data set contains thickness change mosaics that include approximately 650 Himalayan glaciers between 1975 and 2000, and 1040 Himalayan glaciers between 2000 and 2016. 
# The data were derived from HEXAGON KH-9 and ASTER digital elevation models (DEMs), by fitting robust linear trends to time series of elevation pixels 
# over the glacier surfaces.
# National SNow & Ice data center - NASA
# https://nsidc.org/data/HMA_Glacier_dH_Mosaics/versions/1

Mosaic_Elv_00_16 <- raster("HMA_Glacier_dH_Mosaics_elevationTrend_2000-2016.tif")
Mosaic_Elv_75_00 <- raster("HMA_Glacier_dH_Mosaics_elevationTrend_1975-2000.tif")

cldif <-

Dif_Ice <- Mosaic_Elv_00_16 - Mosaic_Elv_75_00 # nn funziona


############

sessionInfo() # to get the session info to be given to the public
Sys.time() # to publish the time at which the script is done

# Full script info @JinJiyanAzadi - github account to the following link: .....
# Insert full data citation as per user guide
# Include link to data page to see full description
###############################################################################################################

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


# Boxplot
dev.off()
boxplot(EN, horizontal=T, axis=T, outline=F)
