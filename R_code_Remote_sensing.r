# 08.01.2021
# R code for remote sensing analysis to monitor ecosystem changes in space and time
install.packages(c("raster", "RStoolbox")) # raster data are based on images i.e. pixels + RStoolbox is used for remote sensing data analysis 

# Now as usual we set the wd
setwd("D:/Utenti/Norma/Desktop/lab")
# After unwipping the folder, we start connecting the data to R
# The function "brick()" is the equivalent of "read.table()", but now we use the "brick" as we are working with raster data(pixels --> .grd extension)
p224r63_2011 <- brick("p224r63_2011_masked.grd")
p224r63_2011 # to check the rasetr brick data details
plot(p224r63_2011)

# Let's plot changing the cplours
cl <- colorRampPalette(c('black','grey','light grey'))(100) # 
plot(p224r63_2011, col=cl)

# Let"'s plot them again but using a different palette for each band and linking them with the "par() f"

par(mfrow=c(2,2))
clb <- colorRampPalette(c('dark blue','blue','light blue'))(100) # 
plot(p224r63_2011$B1_sre, col=clb) # the $ is used to link the data of 2011 to the B1 band 

clg <- colorRampPalette(c('dark green','green','light green'))(100) # 
plot(p224r63_2011$B2_sre, col=clg)

clr <- colorRampPalette(c('dark red','red','pink'))(100) # 
plot(p224r63_2011$B3_sre, col=clr)

cln <- colorRampPalette(c('red','orange','yellow'))(100) # 
plot(p224r63_2011$B4_sre, col=cln)

# Now, let's plot as our eyes would see it so from B1 to B3 --> RGB colours(the same as TVs) // B1 = B + B2 = G + B3 = R --> we use the "plotRGB() f"
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin") # first I set the image, then I assigne the colours to the band so "r=3" means Red= band 3 etc...

# Now I want to shift by one band and I will use B4 which human eye cannot see, we just need to slide by one 
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")

# Now let's keep sliding
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")

# Now we combine all of them together
par(mfrow=c(2,2))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")

