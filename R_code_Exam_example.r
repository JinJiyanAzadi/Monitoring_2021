# https://land.copernicus.vgt.vito.be/PDF/portal/Application.html

install.packages("ncdf4")

library(ncdf4) # the .nc format is the one related to the ESA data. This library will read these type of files
library(raster)

setwd("D:/Utenti/Norma/Desktop/lab")


t <- raster("c_gls_LST10-DC_202012210000_GLOBE_GEO_V1.2.1.nc")

plot(t) 

t1 <- raster("c_gls_LST10-DC_202010010000_GLOBE_GEO_V1.2.1.nc") 

plot(t1)

# difference in time
dif <- t1-t
plot(dif)
