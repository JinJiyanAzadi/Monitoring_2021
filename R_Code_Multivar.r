# 18.12.2020 
# R_Code_Multivar.r

library(vegan)
setwd("D:/Utenti/Norma/Desktop/lab")
load("biomes_multivar.RData")
ls() # to see the list of the items in the data --> the biome of each plot

# plot the species matrix --> we can figure out the biomes we are observing based on the species that we have 
head(biomes)

# We will do now the "Correspondence analysis" --> the higher the value of the CA the lower the correlation between species // using "decorana"
multivar <- decorana(biomes)
plot(multivar)

# biomes names in the graph: 
head(biomes_types)
attach(biomes_types)
ordiellipse(multivar, type, col=c("black","red","green","blue"), kind = "ehull", lwd=3) # "kind" is the shape we want to assign to the biomes and "ehull" means ellipse

# assign names to the ellipses 
ordispider(multivar, type, col=c("black","red","green","blue"), label = T)
biomes_types # to see the whole list of biomes types 

# compile the imagines
pdf("multivar.pdf")
plot(multivar)
ordiellipse(multivar, type, col=c("black","red","green","blue"), kind = "ehull", lwd=3)
ordispider(multivar, type, col=c("black","red","green","blue"), label = T)
dev.off()

