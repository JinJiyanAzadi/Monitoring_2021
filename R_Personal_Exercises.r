# Code suggested by the prof to create a density map with the points' size resembling the nu,ber of cases. I changed the previous palette colours:

> cl <- colorRampPalette(c('lightpink2','lightsalmon','tomato1','red3','maroon'))(100)
> plot(density_map, col = cl)
> plot(coastlines, add = T)
> plot(Spoints, cex=Spoints$cases/10000, add=T)
# Warning message:
# In plot.sf(Spoints, cex = Spoints$cases/10000, add = T) :
# ignoring all but the first attribute
