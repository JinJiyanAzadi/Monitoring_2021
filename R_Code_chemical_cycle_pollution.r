# 20.01.2021
# Set the working directory first
setwd("D:/Utenti/Norma/Desktop/lab")
library(raster)
cl <- colorRampPalette(c('red','orange','yellow'))(100)

# Now we built the multifucntion
par(mfrow=c(1,2))
# Now we start plotting all the images using the colour palette we built
plot(EN01, col=cl)
plot(EN13, col=cl)

# Now we will create the difference between the two images to analyse the differences

dev.off() # to se the latest graph, the one below
difno2 <- EN01 - EN13
cldif <- colorRampPalette(c('blue','black','yellow'))(100) # 
plot(difno2, col=cldif)

# https://www.r-bloggers.com/2018/10/the-av-package-production-quality-video-in-r/
# Library to plot the video, check BYS

# Plot all the frames all the pics
plot(EN01, col=cl)
plot(EN02, col=cl)
plot(EN03, col=cl)
plot(EN04, col=cl)
plot(EN05, col=cl)
plot(EN06, col=cl)
plot(EN07, col=cl)
plot(EN08, col=cl)
plot(EN09, col=cl)
plot(EN10, col=cl)
plot(EN11, col=cl)
plot(EN12, col=cl)
plot(EN13, col=cl)

# Now we create a stack named EN to analyse the images reklated to its time frame
EN <- stack(EN01,EN02,EN03,EN04,EN05,EN06,EN07,EN08,EN09,EN10,EN11,EN12,EN13) # the stack f() helps me to link and plot all my images together iso using the par f()
plot(EN, col=cl) # the output will be same as above where we plotted them individually
# the difference is in the simplicity of stacking and plot all of them in only two lines of code
dev.off()
plotRGB(EN, red=EN13, green=EN07, blue=EN01, stretch="Lin")

# Boxplot
dev.off()
boxplot(EN, horizontal=T, axis=T, outline=F)
# My variation adding labels in the axis
boxplot(EN, horizontal=T, axis=T, outline=F, xlab="NO2 levels", ylab="Period") # col=red in case I also wish to add coloured boxes

