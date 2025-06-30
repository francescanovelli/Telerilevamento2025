# Importo le immagini su R 

# Apro pacchetti di R 
library(terra) # Manipola dati geografici (spaziali) in formato "raster" e "vettore"
library(imageRy) # Pacchetto per la visualizzazione di immagini raster su R
library(viridis) # Cambia la palette di colori sulle immagini raster

# Inserisco la directory
setwd("C:/Users/User/OneDrive/Documenti/UNI/TELERILEVAMENTO")

# Importo i raster delle 3 immagini scaricate da GEE
Sentinel_NZ19 <- rast("NZ_NIR19.tif")
Sentinel_NZ19
Sentinel_NZ20 <- rast("NZ_NIR20.tif")
Sentinel_NZ20
Sentinel_NZ25 <- rast("NZ_NIR25.tif")
Sentinel_NZ25

# visualizzo le immagini in RGB 
im.multiframe(1,3) # Apro un pannello multiframe per poter inserire le tre immagini insieme
plotRGB(Sentinel_NZ19, r=1, g=2, b=3, stretch= "lin", main= "Sentilenl-2, Mag. 2019")
plotRGB(Sentinel_NZ20, r=1, g=2, b=3, stretch= "lin", main= "Sentilenl-2, Mag. 2020")
plotRGB(Sentinel_NZ25, r=1, g=2, b=3, stretch= "lin", main= "Sentilenl-2, Mag. 2025")

# visualizzo le immagini con la banda del NIR al posto della banda del verde
im.multiframe(1,3)
im.plotRGB(Sentinel_NZ19, r=1, g=4, b=2)
im.plotRGB(Sentinel_NZ20, r=1, g=4, b=2)
im.plotRGB(Sentinel_NZ25, r=1, g=4, b=2)

