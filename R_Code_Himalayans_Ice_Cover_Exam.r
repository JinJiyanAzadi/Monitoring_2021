# Analysis of the Himalayans' Ice Cover over a perdiod of time

library(raster) # raster data i.e. images(pixels)
library(RStoolbox) #  for remote sensing
library(rgdal) # for .hdf files from MODIS + I had to install the "OSge 4w" software
library(ncdf4) # for .nc files 
library(colorspace) # to choose a set palette from the package
library(MODISTools) # not req for now
library(gdalUtils)
library(dplyr) # data cleaning and analysis 

setwd("D:/Utenti/Norma/Desktop/exam")

# Raster the albedo for 15yr period 2000-2015

# Albedo - Directional Albedo 1km Global V1 - datset from Copernicus, link below:
# https://land.copernicus.vgt.vito.be/PDF/portal/Application.html#Browse;Root=511344;Collection=1000174;DoSearch=true;Time=NORMAL,NORMAL,1,JANUARY,2000,31,DECEMBER,2015;ROI=68.753799392097,22.705167173252,110.6990881459,44.954407294833

AL_Feb00 <- raster("c_gls_ALDH_200001240000_GLOBE_VGT_V1.4.1.nc")
AL_Feb01 <- raster("c_gls_ALDH_200101240000_GLOBE_VGT_V1.4.1.nc")
AL_Feb02 <- raster("c_gls_ALDH_200201240000_GLOBE_VGT_V1.4.1.nc")
AL_Feb03 <- raster("c_gls_ALDH_200301240000_GLOBE_VGT_V1.4.1.nc")
AL_Feb04 <- raster("c_gls_ALDH_200401240000_GLOBE_VGT_V1.4.1.nc")
AL_Feb05 <- raster("c_gls_ALDH_200501240000_GLOBE_VGT_V1.4.1.nc")
AL_Feb06 <- raster("c_gls_ALDH_200601240000_GLOBE_VGT_V1.4.1.nc")
AL_Feb07 <- raster("c_gls_ALDH_200701240000_GLOBE_VGT_V1.4.1.nc")
AL_Feb08 <- raster("c_gls_ALDH_200801240000_GLOBE_VGT_V1.4.1.nc")
AL_Feb09 <- raster("c_gls_ALDH_200901240000_GLOBE_VGT_V1.4.1.nc")
AL_Feb10 <- raster("c_gls_ALDH_201001240000_GLOBE_VGT_V1.4.1.nc")
AL_Feb11 <- raster("c_gls_ALDH_201101240000_GLOBE_VGT_V1.4.1.nc")
AL_Feb12 <- raster("c_gls_ALDH_201201240000_GLOBE_VGT_V1.4.1.nc")
AL_Feb13 <- raster("c_gls_ALDH_201301240000_GLOBE_VGT_V1.4.1.nc")
AL_Feb14 <- raster("c_gls_ALDH_201401240000_GLOBE_VGT_V1.4.1.nc")
AL_Feb15 <- raster("c_gls_ALDH_201501240000_GLOBE_PROBAV_V1.5.1.nc")



# We set the coordinates for the cropping, to highlight the HinduKush–Karakoram–Himalaya (HKH) areas as the raster image is at a global scale
ext <- c(68,96,26,38) # xmin xmax ymin ymax, where x=long & y=lat


# We create the cropped image for each observed year
AL_Feb00_c <- crop(AL_Feb00, ext)
AL_Feb01_c <- crop(AL_Feb01, ext)
AL_Feb02_c <- crop(AL_Feb02, ext)
AL_Feb03_c <- crop(AL_Feb03, ext)
AL_Feb04_c <- crop(AL_Feb04, ext)
AL_Feb05_c <- crop(AL_Feb05, ext)
AL_Feb06_c <- crop(AL_Feb06, ext)
AL_Feb07_c <- crop(AL_Feb07, ext)
AL_Feb08_c <- crop(AL_Feb08, ext)
AL_Feb09_c <- crop(AL_Feb09, ext)
AL_Feb10_c <- crop(AL_Feb10, ext)
AL_Feb11_c <- crop(AL_Feb11, ext)
AL_Feb12_c <- crop(AL_Feb12, ext)
AL_Feb13_c <- crop(AL_Feb13, ext)
AL_Feb14_c <- crop(AL_Feb14, ext)
AL_Feb15_c <- crop(AL_Feb15, ext)

# We stack the images together to do a boxplot to get the annual mean value
ALDH_15yr_c <- stack(AL_Feb00_c, AL_Feb01_c, AL_Feb02_c,  AL_Feb03_c, AL_Feb04_c, AL_Feb05_c, AL_Feb06_c, AL_Feb07_c, AL_Feb08_c, AL_Feb09_c, AL_Feb10_c,  AL_Feb11_c,  AL_Feb12_c, AL_Feb13_c, AL_Feb14_c, AL_Feb15_c)
    
# Boxplot
dev.off()
boxplot(ALDH_15yr_c, horizontal=F, axis=T, outline=F, col="royalblue", main="Mean Annual_Feb Albedo variation", xlab=" Period 2000-2015")
# Need to fix the labeling

#Try the line variation among the most diverse year 


# We set the colours palette for the plotting   
cl <- colorRampPalette(c('white','lightblue','midnightblue', 'tan2', 'yellow','orangered4'))(100) # preferito --> MIGLIORE


# We plot the images in two rounds to allow showing the label on each image 
par(mfrow=c(3,4)) 
plot(AL_Feb00_c, main="Feb_00", col=cl)
plot(AL_Feb01_c, main="Feb_01", col=cl)
plot(AL_Feb02_c, main="Feb_02", col=cl)
plot(AL_Feb03_c, main="Feb_03", col=cl)
plot(AL_Feb04_c, main="Feb_04", col=cl)
plot(AL_Feb05_c, main="Feb_05", col=cl)
plot(AL_Feb06_c, main="Feb_06", col=cl)
plot(AL_Feb07_c, main="Feb_07", col=cl)

par(mfrow=c(3,4)) 
plot(AL_Feb08_c, main="Feb_08", col=cl)
plot(AL_Feb09_c, main="Feb_09", col=cl)
plot(AL_Feb10_c, main="Feb_10", col=cl)
plot(AL_Feb11_c, main="Feb_11", col=cl)
plot(AL_Feb12_c, main="Feb_12", col=cl)
plot(AL_Feb13_c, main="Feb_13", col=cl)
plot(AL_Feb14_c, main="Feb_14", col=cl)
plot(AL_Feb15_c, main="Feb_15", col=cl)
    

-----------------
cldif <- colorRampPalette(c('orangered4', 'blue', 'yellow', 'red', 'brown'))(100)
dif <- AL_Feb00_c - AL_Feb15


pal <- choose_palette(#Advanced-Sequential-Multi-hue-la quarte da dx + reverse colours)
pal(50)
[1] "#1D0B14" "#320B20" "#3E0D26" "#48102B" "#51142F" "#5A1733" "#621B36" "#6A1F39" "#72233C" "#79283D" "#812C3F" "#883040" "#8F3540" "#963A41"
[15] "#9C3E40" "#A3433F" "#A9483E" "#AF4D3C" "#B55239" "#BB5735" "#C05C30" "#C6622A" "#CB6721" "#D06D13" "#D47200" "#D77800" "#D97F00" "#DB860F"
[29] "#DC8C1B" "#DE9226" "#DF992F" "#E19F38" "#E2A540" "#E3AB48" "#E5B151" "#E6B759" "#E7BC61" "#E8C269" "#EAC871" "#EBCD79" "#ECD381" "#EDD889"
[43] "#EFDD91" "#F0E399" "#F2E8A1" "#F4EDA9" "#F5F2B1" "#F7F7B9" "#FAFCC1" "#FCFFC9"

plot(ALDH_15yr_c, col=pal(50))


cl <- colorRampPalette(c('orangered4', 'salmon3', 'yellow', 'lightblue', 'royalblue1'))(100) # preferito







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


