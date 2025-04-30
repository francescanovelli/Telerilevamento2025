# Packages
library(terra)
library(imageRy)
library(cblindplot)

vinicunca = rast("vinicunca.jpg")
vinicunca = flip(vinicunca)
plot(vinicunca)

# Simuliamo la visione dei colori di un daltonico
im.multiframe(2,1)
im.plotRGB(vinicunca, r=1, g=2, b=3, title="Standard Vision")
im.plotRGB(vinicunca, r=2, g=1, b=3, title="Protanopia")

# Per risolvere il problema del daltonismo:
rainbow = rast("rainbow.jpg")
rainbow = flip(rainbow)
plot(rainbow)

# Con queste funzioni riesco a fare vedere l'immagine di prima a un daltonico
cblind.plot(rainbow, cvd="protanopia")

# Ci sono poi anche altre tipologie di problematiche
cblind.plot(rainbow, cvd="deuteranopia")
cblind.plot(rainbow, cvd="tritanopia")
