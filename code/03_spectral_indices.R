# codice per calcolare i codici spettrali in R

library(imageRy) 
library(terra)
library(viridis)

im.list()

mato1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")
# comando per capovolgere l'immagine
mato1992 <- flip(mato1992)
plot(mato1992)

# cambio i colori 
im.plotRGB(mato1992, r=1, g=2, b=3) # tutta la vegetazione è rossa
im.plotRGB(mato1992, r=2, g=1, b=3) # tutta la vegetazione diventa rossa e il suolo nudo è rosa
im.plotRGB(mato1992, r=2, g=3, b=1) # tutta la vegetazione diventa blu e il suolo nudo è giallo, anche l'acqua è gialla perchè ha dentro molti soluti disciolti

mato2006 <- im.import("matogrosso_ast_2006209_lrg")
mato2006 <- flip(mato2006)
plot(mato2006)

# metto a confronto le immagini dei due anni diversi
im.multiframe(1,2)
im.plotRGB(mato1992, r=1, g=2, b=3)
im.plotRGB(mato2006, r=1, g=2, b=3)

# Creo un multiframe con tutti i colori e con gli anni 2006 e 1992
im.multiframe(3,2)
#NIR sul rosso
im.plotRGB(mato1992, r=1, g=2, b=3)
im.plotRGB(mato2006, r=1, g=2, b=3)

# NIR sul verde
im.plotRGB(mato1992, r=2, g=1, b=3)
im.plotRGB(mato2006, r=2, g=1, b=3)

#NIR sul blu
im.plotRGB(mato1992, r=3, g=2, b=1)
im.plotRGB(mato2006, r=3, g=2, b=1)

# plot solo mato2006, uso la parentesi quadra per selezionare solo un layer
plot(mato2006[[1]])

plot(mato2006[[1]], col=mako(100)) # per cambiare colore

# per calcolare il DVI
dvi1992 = mato1992[[1]] - mato1992[[2]] # NIR - rosso
plot(dvi1992, col= mako(100))

dvi2006 = mato2006[[1]] - mato2006[[2]] # NIR - rosso
plot(dvi2006, col= mako(100)) 

# immagini con diversi livelli di risoluzione radiometrica

# DVI 8 bit: range (0-255)          
# max: NIR - rosso = 255-0 = 255
# min: rosso - NIR = 0-255 = -255

# DVI 4 bit: range (0-15)
# max: NIR - rosso = 15-0 = 15
# min: rosso - NIR = 0-15 = -15

# NDVI 8 bit: range (0-255)
# max: (NIR - rosso) / (NIR + rosso) = (255-0) / (255+0) = 1
# min: (rosso - NIR) / (rosso + NIR) = (0-255) / (0+255) = -1

# NDVI 4 bit: range (0-15)
# max: (NIR - rosso) / (NIR + rosso) = (15-0) / (15+0) = 1
# min: (rosso - NIR) / (rosso + NIR) = (0-15) / (0+15) = -1

ndvi1992 = (mato1992[[1]] - mato1992[[2]]) / (mato1992[[1]] + mato1992[[2]])
plot (ndvi1992)
ndvi2006 = (mato2006[[1]] - mato2006[[2]]) / (mato2006[[1]] + mato2006[[2]])
plot (ndvi2006)
