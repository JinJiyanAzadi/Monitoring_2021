# https://land.copernicus.vgt.vito.be/PDF/portal/Application.html

library(ncdf4)
library(raster)

t <- raster("c_gls_LST10-DC_202012210000_GLOBE_GEO_V1.2.1.nc")

plot(t) 

t1 <- raster("c_gls_LST10-DC_202010010000_GLOBE_GEO_V1.2.1.nc") 

plot(t1)

# difference in time
dif <- t1-t
plot(dif)
