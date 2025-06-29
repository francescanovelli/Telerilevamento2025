# Mettere le immagini su R

library(terra)
library(imageRy)

setwd("C:/Users/User/OneDrive/Documenti/UNI/TELERILEVAMENTO")

im.multiframe(1,3)

# import raster
Sentinel_NZ25 <- rast("NZ_median_2025.tif")
Sentinel_NZ25

# visualize RGB (check the order of the bands)
plotRGB(Sentinel_NZ25, r = 1, g = 2, b = 3, stretch = "lin", main = "Sentinel (median), 2025")

Sentinel_NZ19 <- rast("NZ_median_2019.tif")
Sentinel_NZ19
Sentinel_NZ20 <- rast("NZ_median_2020.tif")
Sentinel_NZ20

plotRGB(Sentinel_NZ19, r = 1, g = 2, b = 3, stretch = "lin", main = "Sentinel (median), 2019")
plotRGB(Sentinel_NZ20, r = 1, g = 2, b = 3, stretch = "lin", main = "Sentinel (median), 2020")
