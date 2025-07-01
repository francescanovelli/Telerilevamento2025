# Importo le immagini su R 

# Apro pacchetti di R 
library(terra) # Manipola dati geografici (spaziali) in formato "raster" e "vettore"
library(imageRy) # Pacchetto per la visualizzazione di immagini raster su R
library(viridis) # Cambia la palette di colori sulle immagini raster
library(ggplot2)
library(patchwork)

# Inserisco la directory
setwd("C:/Users/User/OneDrive/Documenti/UNI/TELERILEVAMENTO")

# Importo i raster delle 3 immagini con l'area più grande scaricata da GEE
Area_19 <- rast("Area19.tif")
Area_20 <- rast("Area20.tif")
Area_25 <- rast("Area25.tif")

# visualizzo le immagini in RGB 
im.multiframe(1,3) # Apro un pannello multiframe per poter inserire le tre immagini insieme
plotRGB(Area_19, r=1, g=2, b=3, stretch= "lin", main= "Sentilenl-2, Mag. 2019")
plotRGB(Area_20, r=1, g=2, b=3, stretch= "lin", main= "Sentilenl-2, Mag. 2020")
plotRGB(Area_25, r=1, g=2, b=3, stretch= "lin", main= "Sentilenl-2, Mag. 2025")

# Importo i raster delle 3 immagini sull'area interessata dalla siccità scaricate da GEE
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

# Calcolo NDVI, e creo un immagine con tutti e 3 gli NDVI   
ndvi19= im.ndvi(Sentinel_NZ19, 4, 1)
ndvi20= im.ndvi(Sentinel_NZ20, 4, 1)
ndvi25= im.ndvi(Sentinel_NZ25, 4, 1)

im.multiframe(1,3)
plot(ndvi19, col=viridis(100), main= "NDVI, 2019")
plot(ndvi20, col=viridis(100), main= "NDVI, 2020")
plot(ndvi25, col=viridis(100), main= "NDVI, 2025")

# Calcolo la differenza tra NDVI dell'anno 2020 con quello dell'anno 2025
ndvidif= ndvi20 - ndvi25
plot(ndvidif, col=viridis(100), main="Differenza NDVI '20-'25")

# Classificazione
cl19= im.classify(Sentinel_NZ19, num_clusters=2)
cl20= im.classify(Sentinel_NZ20, num_clusters=2)
cl25= im.classify(Sentinel_NZ25, num_clusters=2)

# calcolo le frequenze, cioè il numero di volte che quella classe compare nel pixel
f19 = freq(cl19)
f19
f20 = freq(cl20)
f20
f25 = freq(cl25)
f25

# calcoliamo le proporzione
tot19 = ncell(cl19) 
prop19 = f19/tot19
tot20 = ncell(cl20) 
prop20 = f20/tot20
tot25 = ncell(cl25) 
prop25 = f20/tot25


