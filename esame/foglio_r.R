# Mettere le immagini su R

library(terra)
library(imageRy)

# Inserisco la directory
setwd("C:/Users/User/OneDrive/Documenti/UNI/TELERILEVAMENTO")

# Apro un pannello multiframe
im.multiframe(1,3)

# importo i raster delle 3 immagini scaricate da GEE
Sentinel_NZ25 <- rast("NZ_NIR25.tif")
Sentinel_NZ25

Sentinel_NZ19 <- rast("NZ_NIR19.tif")
Sentinel_NZ19

Sentinel_NZ20 <- rast("NZ_NIR20.tif")
Sentinel_NZ20


# visualizzo le immagini in RGB 
plotRGB(Sentinel_NZ25, r = 1, g = 2, b = 3, stretch = "lin", main = "Sentinel (median), 2025")

plotRGB(Sentinel_NZ19, r = 1, g = 2, b = 3, stretch = "lin", main = "Sentinel (median), 2019")

plotRGB(Sentinel_NZ20, r = 1, g = 2, b = 3, stretch = "lin", main = "Sentinel (median), 2020")
