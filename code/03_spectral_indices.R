# codice per calcolare i codici spettrali in R

library(imageRy) 
library(terra)
library(viridis)

im.list()

mato1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")
# comando per capovolgere l'immagine
mato1992 <- flip(mato1992)
plot(mato1992)

im.plotRGB(mato1992, r=1, g=2, b=3) # tutta la vegetazione è rossa
im.plotRGB(mato1992, r=2, g=1, b=3) # tutta la vegetazione diventa rossa e il suolo nudo è rosa
im.plotRGB(mato1992, r=2, g=3, b=1) # tutta la vegetazione diventa blu e il suolo nudo è giallo, anche l'acqua è gialla perchè ha dentro molti soluti disciolti

