# 29.11.2020
# Exercise based upon data given by our classmate Leo on Venice's lagoon

leo <- read.table("dati_zabotti.csv", head=T, sep=",")

attach(leo)

leo_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))

marks(leo_ppp) <- chlh
chlh_map <- Smooth(leo_ppp)
plot(chlh_map)

marks(leo_ppp) <- t
t_map <- Smooth(leo_ppp)
plot(t_map)
points(leo_ppp)

par(mfrow=c(1,2))
plot(chlh_map)
points(leo_ppp)

plot(t_map)
points(leo_ppp)


# Exercise: do the same for chlorophyll in the sediment (chls)

library(spatstat)

setwd("D:/Utenti/Norma/Desktop/lab")

leo <- read.table("dati_zabotti.csv, head = T, sep = ",")

attach(leo)

leo_ppp <- ppp(x, y, c(2300000, 2325000), c(5005000, 5045000))

marks(leo_ppp) <- chls
chls_map <- Smooth(leo_ppp)
plot(chls_map)

marks(leo_ppp) <- t
t_map <- Smooth(leo_ppp)
plot(t_map)
points(leo_ppp)

par(mfrow=c(1,2))
plot(chls_map)
points(leo_ppp)

plot(t_map)
points(leo_ppp)
