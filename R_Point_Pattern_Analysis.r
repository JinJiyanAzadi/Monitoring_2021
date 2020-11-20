#(20.11.2020)

# Point Spatial analysis (via spatstat package)

install.packages("spatstat")
library(spatstat)

attach(covid)

# After "enter" the below message might appear

# The following objects are masked from covid (pos = 6)
# cases, cat, country, lat, lon

# Use the below sctript:
# if you do not use attach(covid) write as per below:
# covids <- ppp(covid$lon, covid$lat, c(-180,180), c(-90,90))Friend Requests

covids <- ppp(lon, lat, c(-180,180), c(-90,90))
covids
# After enter the answer from R will be:
# Planar point pattern: 152 points
# window: rectangle = [-180, 180] x [-90, 90] units

d <-density(covids)
plot(d)
points(covids)

