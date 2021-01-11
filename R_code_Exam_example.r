# This is the real code used/modified during the lec of the 11.01.2021
# https://land.copernicus.vgt.vito.be/PDF/portal/Application.html
# Login and dowload the .nc files of the images of the 10days circle - we used the one of the 10.01.2021 and the 01.10.2020

install.packages("ncdf4")

library(ncdf4) # the .nc format is the one related to the ESA data. This library will read these types of files
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

# Now we plot the differences in T° during the two periods examined

dift <- tjan21 - toct20
cldif <- colorRampPalette(c('blue','white','red'))(100) #
plot(dift, col=cldif, main="T° dif Jan21 vs Oct20")


# To plot them together
par(mfrow=c(2,1))
plot(tjan21, cl=cltjan21, main="T° Jan21")
plot(toct20, cl=cltjan21, main="T° Oct20")


