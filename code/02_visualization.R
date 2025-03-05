# code for visualizing satellite data

library(terra)
library(imageRy)

# lista dei file
im.list()

# importare i dati
im.import()
b2 <- im.import("sentinel.dolomites.b2.tif")

# per far cambiare i colori alla foto uso la funzione 
colorRampPalette()
cl <- colorRampPalette(c("black","dark grey", "light grey"))(100)

# in questo modo coloro la mia immagine con altri colori
plot(b2, col=cl)

