# MONITORING ECOSYSTEM CHANGES AND FUNCTIONING - UNIBO 2020/2021 - Prof. Duccio Rocchini / Student: Norma Brunetto
# Exam 19.02.2021 

# Object: Analysis of the Himalayans' albedo and land surface temperature over a period covering 2000-2015 --> to see the effects of climate changes and its impacts

# Assuming that I already have installed all the packages needed, using the input "install.packages("name of the package")" 
# I recall the needed libraries as per below:

library(raster) # raster data i.e. images(pixels)
library(RStoolbox) #  for remote sensing
library(rgdal) # for .hdf files from MODIS 
library(gdalUtils) # used to open the.hdf files dowloaded from MODIS Earth-NASA website + I had to install the "OSge 4w" software
library(ncdf4) # for .nc files 
library(dplyr) # data cleaning and analysis - used for the time sereries
library(tseries) # used for the time series analysis
library(forecast) # used for the forecast after computing the time series
library(av) # for the video making


setwd("D:/Utenti/Norma/Desktop/exam") # setting the working directory. To know exactly the "location" of the working directory use the input "getwd".

# Raster the albedo data for the 15yr period 2000-2015 --> end of cyclicity on the 05th of February of each year
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

# Stack the images together
ALDH_15yr_c <- stack(AL_Feb00_c, AL_Feb01_c, AL_Feb02_c,  AL_Feb03_c, AL_Feb04_c, AL_Feb05_c, AL_Feb06_c, AL_Feb07_c, AL_Feb08_c, AL_Feb09_c, AL_Feb10_c,  AL_Feb11_c,  AL_Feb12_c, AL_Feb13_c, AL_Feb14_c, AL_Feb15_c)
    

# Set the colours palette for the plotting   
cl <- colorRampPalette(c('white','lightblue','midnightblue', 'tan2', 'yellow','orangered4'))(100) 


# Plot the images in two rounds to allow showing the label on each image 
png("AL_00_07.png") # to export and save the images in .png format, into the directory folder
par(mfrow=c(3,4)) 
plot(AL_Feb00_c, main="AL_Feb_00", col=cl)
plot(AL_Feb01_c, main="AL_Feb_01", col=cl)
plot(AL_Feb02_c, main="AL_Feb_02", col=cl)
plot(AL_Feb03_c, main="AL_Feb_03", col=cl)
plot(AL_Feb04_c, main="AL_Feb_04", col=cl)
plot(AL_Feb05_c, main="AL_Feb_05", col=cl)
plot(AL_Feb06_c, main="AL_Feb_06", col=cl)
plot(AL_Feb07_c, main="AL_Feb_07", col=cl)
dev.off()

png("AL_08_15.png") # to export and save the images in .png format, into the directory folder
par(mfrow=c(3,4)) 
plot(AL_Feb08_c, main="AL_Feb_08", col=cl)
plot(AL_Feb09_c, main="AL_Feb_09", col=cl)
plot(AL_Feb10_c, main="AL_Feb_10", col=cl)
plot(AL_Feb11_c, main="AL_Feb_11", col=cl)
plot(AL_Feb12_c, main="AL_Feb_12", col=cl)
plot(AL_Feb13_c, main="AL_Feb_13", col=cl)
plot(AL_Feb14_c, main="AL_Feb_14", col=cl)
plot(AL_Feb15_c, main="AL_Feb_15", col=cl)
dev.off()

# To create a video from the albedo png files:
# Step 1 - create a list of the files .nc
ALDH_list <- list.files(pattern="c_gls")
list_ALDH_ras <- lapply(ALDH_list, raster)

# step 2 - crop and raster them into the ras_list
ext <- c(68,96,26,38) 
ras_list_ALDH <- list()
for(i in list_ALDH_ras){ras_list_ALDH <- append(ras_list, crop(i, ext))} # the "for" is used to create a "loop" in order to apply the same f to differnt objects

# step 3 - plot png via the loop and save them progressively 
index <- 1 
for(i in ras_list){file_name <- paste("ALDH_Feb", index, ".png", sep="")
png(file=file_name)
plot(i, col=cl)
dev.off()
index <- index+1}

# step 4 - make the video from the frames, which is saved then on the directory folder
au_png <- sprintf("ALDH_Feb%01d.png", 1:15)
av_encode_video(au_png, "ALDH_Feb_Period_2000_2015.mp4", framerate =1)
browseURL('ALDH_Feb_Period_2000_2015.mp4') # reproduce the video


# Prepare the ground for the time series and forecast based on the albedo details, by extrapolating the min/max albedo values from the stack ALDH_15yr_c

> ALDH_15yr_c
#class      : RasterStack 
#dimensions : 1344, 3136, 4214784, 16  (nrow, ncol, ncell, nlayers)
#resolution : 0.008928571, 0.008928571  (x, y)
#extent     : 67.99554, 95.99554, 26.00446, 38.00446  (xmin, xmax, ymin, ymax)
#crs        : +proj=longlat +ellps=WGS84 +no_defs 
#names      : Broadband//spectrum.1, Broadband//spectrum.2, Broadband//spectrum.3, Broadband//spectrum.4, Broadband//spectrum.5, Broadband//spectrum.6, Broadband//spectrum.7, Broadband//spectrum.8, Broadband//spectrum.9, Broadband//pectrum.10, Broadband//pectrum.11, Broadband//pectrum.12, Broadband//pectrum.13, Broadband//pectrum.14, Broadband//pectrum.15, ... 
min values :                0.0199,                0.0213,                0.0220,                0.0218,                0.0228,                0.0208,                0.0217,                0.0227,                0.0221,                0.0210,                0.0199,                0.0203,                0.0240,                0.0192,                0.0200, ... 
max values :                0.7790,                0.7733,                0.7796,                0.7038,                0.7673,                0.7616,                0.7731,                0.7619,                0.7771,                0.7760,                0.7735,                0.7830,                0.7782,                0.7794,                0.7786, ... 

# Assign the min/max albedo values to two different variables called "min_values" & "max_values" respectively 
min_values <- c(0.0199, 0.0213, 0.0220, 0.0218, 0.0228, 0.0208, 0.0217, 0.0227, 0.0221, 0.0210, 0.0199,0.0203,0.0240, 0.0192,0.0200)
max_values<- c(0.7790, 0.7733, 0.7796, 0.7038, 0.7673,  0.7616, 0.7731, 0.7619, 0.7771, 0.7760, 0.7735, 0.7830, 0.7782, 0.7794, 0.7786)

# Combine the values together before creating the data frame. 
# Note: If the values are not combined before, the time series will result into two different graphs, one for the min and one for the max values, rather then combine all data in one.
data <- (c(min_values, max_values))

# Create a data frame with these values 
df <- data.frame(data)
df
> df
     data
1  0.0199
2  0.0213
3  0.0220
4  0.0218
5  0.0228
6  0.0208
7  0.0217
8  0.0227
9  0.0221
10 0.0210
11 0.0199
12 0.0203
13 0.0240
14 0.0192
15 0.0200
16 0.7790
17 0.7733
18 0.7796
19 0.7038
20 0.7673
21 0.7616
22 0.7731
23 0.7619
24 0.7771
25 0.7760
26 0.7735
27 0.7830
28 0.7782
29 0.7794
30 0.7786


# Create the time series based on the data stored in df, using the argument ts()
ts1_H <- ts(df, start = 2000, end = 2015, frequency = 12) # the freq=12 means 1 measurement/set each year

# Plot the decomposition of the time series which will give combination of level, trend, seasonality, and noise components. 
plot(decompose(ts1_H))

# Create the forecast using the Arima model= Autoregressive integrated moving average -->
# fitted to time series data either to better understand the data or to predict future points in the series (forecasting).

arimamodel <- auto.arima(ts1_H, stationary = F, seasonal = T) # auto.arima fits the best ARIMA model to univariate time series -->
# the latter refers to a time series that consists of single (scalar) observations recorded sequentially over equal time increments.

plot(forecast(arimamodel, h= 60)) # h arg is the number of months we want the forecast for --> h=60 means next 5 years

# Now I will work on the Land SUrface Temperature data in order to see the trend of the T° in the same period 2000-2015.
# Data have been taken from the Earth Data NASA website, full link below:
# https://search.earthdata.nasa.gov/search/granules?p=C194001235-LPDAAC_ECS&pg[0][qt]=2015-02-05T00%3A00%3A00.000Z%2C2015-02-05T23%3A59%3A59.999Z&pg[0][gsk]=-start_date&q=C194001235-LPDAAC_ECS&sb[0]=66.65625%2C26.31298%2C105.46875%2C41.92893&m=0!0!0!1!0!0%2C2&tl=1597489104!4!!
# From the MODIS/Terra Land Surface Temperature/Emissivity Monthly L3 Global 0.05Deg CMG V006 --> Data from February of each year as per the albedo above.
# The data are in .hdf format and instructions on the extrapolation/conversion into .tif of data have been put in a separated script.


# Get the info from the .hdf file of year 2000 --> it might take a while to run
gdalinfo("MOD11C3.A2000032.061.2020048181639.hdf")

# Get the list of the subsets from the above dataset
sds00 <- get_subdatasets("MOD11C3.A2000032.061.2020048181639.hdf")
sds00

# In this case we need only teh data in the first subset so we convert into .tif only the first line of the subset
gdal_translate(sds00[1], dst_dataset = "LST_Day_Feb_2000.tif")

# Raster the converted .tif file
rastT2000 <- raster("LST_Day_Feb_2000.tif")

# The above description applies to the below data, repeated for the remaining years from 2001 to 2015

# 2001
gdalinfo("MOD11C3.A2001032.061.2020086140543.hdf")
sds01 <- get_subdatasets("MOD11C3.A2001032.061.2020086140543.hdf")
sds01
gdal_translate(sds01[1], dst_dataset = "LST_Day_Feb_2001.tif")
rastT2001 <- raster("LST_Day_Feb_2001.tif")

# 2002
gdalinfo("MOD11C3.A2002032.061.2020111051753.hdf")
sds02 <- get_subdatasets("MOD11C3.A2002032.061.2020111051753.hdf")
sds02
gdal_translate(sds02[1], dst_dataset = "LST_Day_Feb_2002.tif")
rastT2002 <- raster("LST_Day_Feb_2002.tif")

# 2003
gdalinfo("MOD11C3.A2003032.061.2020149224244.hdf")
sds03 <- get_subdatasets("MOD11C3.A2003032.061.2020149224244.hdf")
sds03
gdal_translate(sds03[1], dst_dataset = "LST_Day_Feb_2003.tif")
rastT2003 <- raster("LST_Day_Feb_2003.tif")

# 2004
gdalinfo("MOD11C3.A2004032.061.2020168161927.hdf")
sds04 <- get_subdatasets("MOD11C3.A2004032.061.2020168161927.hdf")
sds04
gdal_translate(sds04[1], dst_dataset = "LST_Day_Feb_2004.tif")
rastT2004 <- raster("LST_Day_Feb_2004.tif")

# 2005
gdalinfo("MOD11C3.A2005032.061.2020230201750.hdf")
sds05 <- get_subdatasets("MOD11C3.A2005032.061.2020230201750.hdf")
sds05
gdal_translate(sds05[1], dst_dataset = "LST_Day_Feb_2005.tif")
rastT2005 <- raster("LST_Day_Feb_2005.tif")

# 2006
gdalinfo("MOD11C3.A2006032.061.2020273005831.hdf")
sds06 <- get_subdatasets("MOD11C3.A2006032.061.2020273005831.hdf")
sds06
gdal_translate(sds06[1], dst_dataset = "LST_Day_Feb_2006.tif")
rastT2006 <- raster("LST_Day_Feb_2006.tif")

# 2007
gdalinfo("MOD11C3.A2007032.006.2015311055620.hdf")
sds07 <- get_subdatasets("MOD11C3.A2007032.006.2015311055620.hdf")
sds07
gdal_translate(sds07[1], dst_dataset = "LST_Day_Feb_2007.tif")
rastT2007 <- raster("LST_Day_Feb_2007.tif")

# 2008
gdalinfo("MOD11C3.A2008032.006.2015343142031.hdf")
sds08 <- get_subdatasets("MOD11C3.A2008032.006.2015343142031.hdf")
sds08
gdal_translate(sds08[1], dst_dataset = "LST_Day_Feb_2008.tif")
rastT2008 <- raster("LST_Day_Feb_2008.tif")

# 2009
gdalinfo("MOD11C3.A2009032.006.2016007161930.hdf")
sds09 <- get_subdatasets("MOD11C3.A2009032.006.2016007161930.hdf")
sds09
gdal_translate(sds09[1], dst_dataset = "LST_Day_Feb_2009.tif")
rastT2009 <- raster("LST_Day_Feb_2009.tif")

# 2010
gdalinfo("MOD11C3.A2010032.006.2016035025659.hdf")
sds10 <- get_subdatasets("MOD11C3.A2010032.006.2016035025659.hdf")
sds10
gdal_translate(sds10[1], dst_dataset = "LST_Day_Feb_2010.tif")
rastT2010 <- raster("LST_Day_Feb_2010.tif")

# 2011
gdalinfo("MOD11C3.A2011032.006.2016053232552.hdf")
sds11 <- get_subdatasets("MOD11C3.A2011032.006.2016053232552.hdf")
sds11
gdal_translate(sds11[1], dst_dataset = "LST_Day_Feb_2011.tif")
rastT2011 <- raster("LST_Day_Feb_2011.tif")

# 2012
gdalinfo("MOD11C3.A2012032.006.2016105152522.hdf")
sds12 <- get_subdatasets("MOD11C3.A2012032.006.2016105152522.hdf")
sds12
gdal_translate(sds12[1], dst_dataset = "LST_Day_Feb_2012.tif")
rastT2012 <- raster("LST_Day_Feb_2012.tif")

# 2013
gdalinfo("MOD11C3.A2013032.006.2016156075039.hdf")
sds13 <- get_subdatasets("MOD11C3.A2013032.006.2016156075039.hdf")
sds13
gdal_translate(sds13[1], dst_dataset = "LST_Day_Feb_2013.tif")
rastT2013 <- raster("LST_Day_Feb_2013.tif")

# 2014
gdalinfo("MOD11C3.A2014032.006.2016198015912.hdf")
sds14 <- get_subdatasets("MOD11C3.A2014032.006.2016198015912.hdf")
sds14
gdal_translate(sds14[1], dst_dataset = "LST_Day_Feb_2014.tif")
rastT2014 <- raster("LST_Day_Feb_2014.tif")

# 2015
gdalinfo("MOD11C3.A2015032.006.2016223171450.hdf")
sds15 <- get_subdatasets("MOD11C3.A2015032.006.2016223171450.hdf")
sds15
gdal_translate(sds15[1], dst_dataset = "LST_Day_Feb_2015.tif")
rastT2015 <- raster("LST_Day_Feb_2015.tif")

# Stack all the converted .tif files 
T_15yr <- stack(rastT2000, rastT2001, rastT2002, rastT2003, rastT2004, rastT2005, rastT2006, rastT2007, rastT2008, rastT2009, rastT2010, rastT2011, rastT2012, rastT2013, rastT2014, rastT2015)
class(T_15yr) # to double check the class of T_15yr and make sure it is a raster stack

# Set again the cropping coordinates 
ext <- c(68,96,26,38) # xmin xmax ymin ymax, where x=long & y=lat

# CReate a cropped version of the previous stack
T_15yr_c <- crop(T_15yr, ext)

# Create e colour palette for the T° graphs in order to highlight tha T° variations among the years
clT <- colorRampPalette(c('midnightblue','lightblue','yellow',"tan2"))(100)

# Plot and save the cropped stack 
png("T_15yr_c.png") # to save the graphs in the folder
plot(T_15yr_c, col=clT) # to plot the T° in the period 2000-2015
dev.off() # to close the graph. Note: sometimes after using dev.off, later on R won't show any graph, it is enough to repeat the input dev.off twice and it will go back to normal


# Step 1 - reate a list of the files .nc
T_list <- list.files(pattern="LST_Day") # I had to use the .TIF format as the original .hdf format was not recogn
list_T_ras <- lapply(T_list, raster)

# step 2 - crop and raster them into the ras_list
ext <- c(68,96,26,38)
ras_list_T <- list()
for(i in list_T_ras){ras_list_T <- append(ras_list_T, crop(i, ext))}

# step 3 - plot png via the loop
index <- 1
for(i in ras_list_T){file_name <- paste("T_Feb", index, ".png", sep="")
png(file=file_name)
plot(i, col=clT)
dev.off()
index <- index+1}

# step 4 - make the video
au_png <- sprintf("T_Feb%01d.png", 0:15)
av_encode_video(au_png, "T_Feb_Period_2000_2015.mp4", framerate =1)
browseURL('T_Feb_Period_2000_2015.mp4')


# Plot and save the boxplot to see the T° variation during the observed period
png("LST_Monthly_Feb T° variation_Period 2000-2015.png")
boxplot(T_15yr_c, horizontal=F, axis=T, outline=F, col="salmon", main="LST_Monthly_Feb T° variation", xlab=" Period 2000-2015", ylab= "Temperature", xaxt = 'n')
dev.off()

# Plot and save the boxplot of the albedo 
png("ALDH_15yr_c.png")
boxplot(ALDH_15yr_c, horizontal=F, axis=T, outline=F, col="royalblue", main="Mean Annual_Feb Albedo variation", xlab=" Period 2000-2015", ylab= "Albedo", xaxt = 'n')
dev.off()

# Plot them together for a better comparison
par(mfrow=c(2,1))
boxplot(T_15yr_c, horizontal=F, axis=T, outline=F, col="salmon", main="LST_Monthly_Feb T° variation", xlab=" Period 2000-2015", xaxt = 'n')
boxplot(ALDH_15yr_c, horizontal=F, axis=T, outline=F, col="royalblue", main="Mean Annual_Feb Albedo variation", xlab=" Period 2000-2015", xaxt = 'n')


#################################################
# Final remark--> Pls note that the colours palettes have been chosen taking into consideration two factors related also to "Human Factor": 
# 1- the human eye is particularly responsive to the yellow colour;
# 2- I have avoided using the red and green colours as these are not distinguished by those people affected by daltonism.
#################################################

sessionInfo() # to get the session info
Sys.time() # to publish the time at which the script is done

# Full script info @JinJiyanAzadi - github account to the following link: https://github.com/JinJiyanAzadi/Monitoring_2021/edit/main/R_Code_Himalayans_Ice_Cover_Exam.r
###############################################################################################################

# Thank you for the attention.




