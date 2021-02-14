# MONITORING ECOSYSTEM CHANGES AND FUNCTIONING - UNIBO 2020/2021 - Prof. Duccio Rocchini / Student: Norma Brunetto
# Exam 19.02.2021 

# Object: Analysis of the Himalayans' albedo and land surface temperature over a perdiod covering 2000-2015 --> to see the effects of climate changes and its impacts

# Assuming that I already have installed all the packages needed, using the input "install.packages("name of the package")" 

# I recall the needed libraries as per below:

library(raster) # raster data i.e. images(pixels)
library(RStoolbox) #  for remote sensing
library(rgdal) # for .hdf files from MODIS 
library(gdalUtils) # used to open the.hdf files dowloaded from MODIS Earth-NASA website + I had to install the "OSge 4w" software
library(ncdf4) # for .nc files 
library(colorspace) # to choose a set palette from the package # not req for now
library(MODISTools) # not req for now
library(dplyr) # data cleaning and analysis - used for the time sereries
library(tseries) # used for the time series analysis
library(forecast) # used for the forecast after computing the time series


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



# Set the coordinates for the cropping, to highlight the HinduKush–Karakoram–Himalaya (HKH) areas as the raster image is at a global scale
ext <- c(68,96,26,38) # xmin xmax ymin ymax, where x=long & y=lat


# Create the cropped image for each observed year // I preferred to raster individually in case I needed the single image for an individual  analysis later on
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

# Stack the images together to do a boxplot to get the annual mean value
ALDH_15yr_c <- stack(AL_Feb00_c, AL_Feb01_c, AL_Feb02_c,  AL_Feb03_c, AL_Feb04_c, AL_Feb05_c, AL_Feb06_c, AL_Feb07_c, AL_Feb08_c, AL_Feb09_c, AL_Feb10_c,  AL_Feb11_c,  AL_Feb12_c, AL_Feb13_c, AL_Feb14_c, AL_Feb15_c)
    
# Boxplot
dev.off()
boxplot(ALDH_15yr_c, horizontal=F, axis=T, outline=F, col="royalblue", main="Mean Annual_Feb Albedo variation", xlab=" Period 2000-2015")
# Need to fix the labeling


# Set the colours palette for the plotting   
cl <- colorRampPalette(c('white','lightblue','midnightblue', 'tan2', 'yellow','orangered4'))(100) 


# Plot the images in two rounds to allow showing the label on each image 
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


##############################################

# Prepare the ground for the time series and forecast based on the albedo details, we extrapolate the min/max albedo values from the stack ALDH_15yr_c

> ALDH_15yr_c
#class      : RasterStack 
#dimensions : 1344, 3136, 4214784, 16  (nrow, ncol, ncell, nlayers)
#resolution : 0.008928571, 0.008928571  (x, y)
#extent     : 67.99554, 95.99554, 26.00446, 38.00446  (xmin, xmax, ymin, ymax)
#crs        : +proj=longlat +ellps=WGS84 +no_defs 
#names      : Broadband//spectrum.1, Broadband//spectrum.2, Broadband//spectrum.3, Broadband//spectrum.4, Broadband//spectrum.5, Broadband//spectrum.6, Broadband//spectrum.7, Broadband//spectrum.8, Broadband//spectrum.9, Broadband//pectrum.10, Broadband//pectrum.11, Broadband//pectrum.12, Broadband//pectrum.13, Broadband//pectrum.14, Broadband//pectrum.15, ... 
min values :                0.0199,                0.0213,                0.0220,                0.0218,                0.0228,                0.0208,                0.0217,                0.0227,                0.0221,                0.0210,                0.0199,                0.0203,                0.0240,                0.0192,                0.0200, ... 
max values :                0.7790,                0.7733,                0.7796,                0.7038,                0.7673,                0.7616,                0.7731,                0.7619,                0.7771,                0.7760,                0.7735,                0.7830,                0.7782,                0.7794,                0.7786, ... 

# Assign the min/max albedo values to two different variables called "min_values" & "max_values" respectivelly 
min_values <- c(0.0199, 0.0213, 0.0220, 0.0218, 0.0228, 0.0208, 0.0217, 0.0227, 0.0221, 0.0210, 0.0199,0.0203,0.0240, 0.0192,0.0200)
max_values<- c(0.7790, 0.7733, 0.7796, 0.7038, 0.7673,  0.7616, 0.7731, 0.7619, 0.7771, 0.7760, 0.7735, 0.7830, 0.7782, 0.7794, 0.7786)

# Combine the values together before creating the dat frame. 
# Note: If the values are not combined before, the time series will result into two different graphs (prior the decomposition), one for the min and one for the max.
data <- (c(min_values, max_values))

# Create a data frame with these values 
df <- data.frame(min_values, max_values)
df
   min_values max_values
1      0.0199     0.7790
2      0.0213     0.7733
3      0.0220     0.7796
4      0.0218     0.7038
5      0.0228     0.7673
6      0.0208     0.7616
7      0.0217     0.7731
8      0.0227     0.7619
9      0.0221     0.7771
10     0.0210     0.7760
11     0.0199     0.7735
12     0.0203     0.7830
13     0.0240     0.7782
14     0.0192     0.7794
15     0.0200     0.7786
> 
#################################################

sessionInfo() # to get the session info to be given to the public
Sys.time() # to publish the time at which the script is done

# Full script info @JinJiyanAzadi - github account to the following link: .....
# Insert full data citation as per user guide
# Include link to data page to see full description
###############################################################################################################




