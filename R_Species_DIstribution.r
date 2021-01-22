# 22.01.2021 - Last lap!

library(sdm)
library(rgdal) # geo data extraction library used in GRASS, this is the R version --> GDAL OSGeo website
library(raster)

# Import the species files
# system.file() f is used to catch a certain file from the libraries // .shp = "shape file" --> this is used when I do not donwload 
# the file but I work on it taking it from the library
file <- system.file("external/species.shp", package="sdm") 
species <- shapefile(file) # check the "readOGR" f()
species
plot(species, pch=17) # changing the corx to triangles using the "pch"
# now we plot separately the "absence / presence species"
species$Occurrence

# Make the subset now using the []
plot(species[species$Occurrence == 1,], col='blue', pch=17)
points(species[species$Occurrence == 0,], col='red', pch=17)

# We set the "path" 
path <- system.file("external", package="sdm")

# then we set the predictors
lst <- list.files(path=path,pattern='asc$',full.names = T) #
lst

# We create a stack of all the predictors
preds <- stack(lst)

# Plot the predictors
cl <- colorRampPalette(c('blue','orange','red','yellow')) (100)
plot(preds, col=cl)

plot(preds$elevation, col=cl, main='elevation')
points(species[species$Occurrence == 1,], pch=17)

plot(preds$temperature, col=cl, main='temperature')
points(species[species$Occurrence == 1,], pch=17)

plot(preds$vegetation, col=cl, main='vegetation')
points(species[species$Occurrence == 1,], pch=17)

datasdm <- sdmData(train=species, predictors=preds)
datasdm

# Now we build the model with the sdm f()
m1 <- sdm(Occurrence ~ elevation + precipitation + temperature + vegetation, data=datasdm, methods = "glm")  # method="gls" means generalised model

# make the raster output layer
p1 <- predict(m1, newdata=preds)
plot(p1, col=cl)
points(species[species$Occurrence == 1,], pch=17)

# Add the model to the previous stack to compare
s1 <- stack(preds, p1)
plot(s1, col=cl)

