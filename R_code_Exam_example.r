# This is the real code used/modified during the lec of the 11.01.2021
# https://land.copernicus.vgt.vito.be/PDF/portal/Application.html
# Login and dowload the .nc filed of the images of the 10days circle - we used the one of the 10.01.2021 and the 01.10.2020

install.packages("ncdf4")

library(ncdf4) # the .nc format is the one related to the ESA data. This library will read these type of files
library(raster)
setwd("D:/Utenti/Norma/Desktop/lab")


tjan21 <- raster("c_gls_LST10-DC_202101010000_GLOBE_GEO_V1.2.1.nc")
t <- raster("c_gls_LST10-DC_202012210000_GLOBE_GEO_V1.2.1.nc")
plot(t) 

# Now we plot changing the palette

cltjan <- colorRampPalette(c('black','grey','light grey'))(100) 
plot(tjan, col=cltjan)

# Or

cltjan21 <- colorRampPalette(c('blue','yellow','red'))(100)
plot(tjan, col=cltjan)


toct20 <- raster("c_gls_LST10-DC_202010010000_GLOBE_GEO_V1.2.1.nc") 
plot(toct20)


dift <- tjan21 - toct20
cldif <- colorRampPalette(c('blue','white','red'))(100) #
plot(dift, col=cldif)


# difference in time between the two images
dif <- tjan21-toct20
plot(dif)

par(mfrow, c=
