library(terra)
library(imageRy)
library(viridis)

im.list()

# immagini della concentrazione di NO2 nel nord Italia
# nell'immagine c'è anche una legenda che ci fa capire in che parte dell'anno siamo
# si vede un grande macchia rossa nella pianura padana
EN01 <- im.import("EN_01.png")
EN01 <- flip(EN01)
plot(EN01)

EN13 <- im.import("EN_13.png")
EN13<- flip(EN13)
plot(EN13)

im.multiframe(1,2)
plot(EN01)
plot(EN13)

# Entrambi le immagini sono in RGB
# differenza tra le due immagini, scegliendo solo il primo livello di entrambe le immagini
difEN = EN01[[1]] - EN13[[1]]
 plot(difEN, col=mako(100))

#--------------------------------------------------------#
Scioglimento del ghiaccio in Groenlandia

gr= im.import("greenland")

grdif=gr[[4]]-gr[[1]] # 2015-2000
plot(grdif)
# Tutte le parti gialle sono quelle che nel 2015 mostrano un aumento di temperatura maggiore rispetto alle temperature del 2000

# Ridgeline plots: frequenza dei dati per anno
im.ridgeline(gr, scale=1)
# Il parametro di scala (scale=) dice quando può essere grande ogni picco; scale=1 evita sovrapposizioni
# Si può cambiare colore con l'argomento palette=
im.ridgeline(gr, scale=2, palette="inferno")

# Importare il NDVI da Sentinel
ndvi=im.import("Sentinel2")

# Cambiare nomi (if all the names are the same, the fuction plots only one ridgeline plot)
# sources: Sentinel2_NDVI_2020-02-21.tif  
#          Sentinel2_NDVI_2020-05-21.tif  
#          Sentinel2_NDVI_2020-08-01.tif  
#          Sentinel2_NDVI_2020-11-27.tif 
names(ndvi)=c("02_Feb","05_Mag","08_Ago","11_Nov")

im.ridgeline(ndvi, scale=2, palette="mako")

pairs(ndvi)

plot(ndvi[[1]], ndvi[[2]], xlim=c(-0.3, 0.9), ylim=c(-0.3, 0.9)) # Comparing  February and May data
# Aggiungo una linea dove y=x (May=y, Feb=x), con la funzione abline()
# y = a + bx, a=0, b=1
abline(0,1, col="red") # May data are above the red line: this means that they are greater than February data

im.multiframe(1,3)
plot(ndvi[[1]])
plot(ndvi[[2]])
plot(ndvi[[1]], ndvi[[2]], xlim=c(-0.3, 0.9), ylim=c(-0.3, 0.9))
abline(0,1, col="red")


