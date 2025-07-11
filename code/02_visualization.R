# code for visualizing satellite data

library(terra)
library(imageRy)
install.packages("viridis")
library(viridis)

# lista dei file
im.list()

# importare i dati
im.import()
b2 <- im.import("sentinel.dolomites.b2.tif")  # blu

# per far cambiare i colori alla foto uso la funzione 
colorRampPalette()
cl <- colorRampPalette(c("black","dark grey", "light grey"))(100)

# in questo modo coloro la mia immagine con altri colori
plot(b2, col=cl)

# si possono avere più bande
b3 <- im.import("sentinel.dolomites.b3.tif") # verde 
b4 <- im.import("sentinel.dolomites.b4.tif") # rosso
b8 <- im.import("sentinel.dolomites.b8.tif") # infrarosso vicino

# creo un immagine con 4 bande al suo interno 
sent <- c(b2, b3, b4, b8)

# per mettere tutte le bande insieme uso queste funzioni
par(mfrow=c(1,4))
im.multiframe(x,y) 

# per importare diverse bande insieme
sentdol <- im.import("sentinel.dolomites")
pairs(sentdol)

# per dare nomi alle foto
names(sent)<-c("b2-blu", "b3-verde", "b4-rosso", "b8Nir")

# per cancellare i grafici
dev.off()

# viridis, per cambiare i colori 
plot(sentdol, col=viridis(100))

# creo un immagine con i colori naturali 
im.plotRGB(sentdol, r=3, g=2, b=1)

# colori falsi, quindi aggiungo anche l'infrarosso vicino
im.plotRGB(sentdol, r=4, g=3, b=2)
