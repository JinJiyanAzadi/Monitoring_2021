# Analysis of the Himalayans' Ice Cover over a perdiod of time

library(raster) # raster data i.e. images(pixels)
library(RStoolbox) #  for remote sensing
library(rgdal) # coastlines
library(ncdf4) # when using .nc files

setwd("D:/Utenti/Norma/Desktop/lab")

p224r63_2011 <- brick("c_gls_SCE_202101210000_NHEMI_VIIRS_V1.0.1.nc")


coastlines <- readOGR('ne_10m_coastline.shp')
# coastlines_simp <- gSimplify(coastlines, tol = 3, topologyPreserve = TRUE)

plot(coastlines, add = T)

cl <- colorRampPalette(c('lightblue','blues','white'))(100) # 
cl <- choose_palett(name from the list)


plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")

tjan21 <- raster("c_gls_SCE_202101210000_NHEMI_VIIRS_V1.0.1.nc")

copNDVI <- reclassify(copNDVI, cbind(253:255, NA)) 

ext <- c(0,20,35,55)  # xmin xmax ymin ymax // ext is a fixed argument, cannot change the name
copNDVI_Italy <- crop(copNDVI, ext)
plot(copNDVI_Italy, col=clymax) # I did this with the coastlines too

# https://www.r-bloggers.com/2018/10/the-av-package-production-quality-video-in-r/
# Library to plot the video, check BYS


difIce <-

EN <- stack(EN01,EN02,EN03,EN04,EN05,EN06,EN07,EN08,EN09,EN10,EN11,EN12,EN13) 

# Boxplot
dev.off()
boxplot(EN, horizontal=T, axis=T, outline=F)
