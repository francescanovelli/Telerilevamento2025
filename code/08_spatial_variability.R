# Codice R per calcolare la variabilità spaziale

library(terra)
library(imageRy)
library(viridis)
library(ggplot2)
library(patchwork)
install.packages("RStoolbox")
library(RStoolbox)

# Deviazione Standard 

media = (24+26+25) / 3
num = (24-media)^2 + (26-media)^2 + (25-media)^2
den = 3
varianza = num/den
stdev = sqrt(varianza) # Deviazione standard della popolazione
  # 0.8164966

sd(c(24 , 26, 25)) # Deviazione standard del campione
  # 1

sd(c(24 , 26, 25, 49)) 
  # 12.02775

#---------------------------------------------------------

im.list()

sent <- im.import("sentinel.png")
sent=flip(sent)
# banda 1 = NIR
# banda 2 = rosso
# banda 3 = verde

im.multiframe(1,3)
im.plotRGB(sent, r=1, g=2, b=3) # Plotto l'immagine di prima con il NIR al posto del rosso, in RGB
im.plotRGB(sent, r=2, g=1, b=3) # Plotto l'immagine di prima con il NIR al posto del verde, in RGB
im.plotRGB(sent, r=2, g=3, b=1) # Plotto l'immagine di prima con il NIR al posto del blu, in RGB
# le parti dove si mette in NIR è la vegetazione, la parte nera è l'acqua, il bianco è neve o nuvole

nir = sent[[1]]
plot(nir, col= inferno(100))

# focal() serve per le finestre che si muovono e la usaimo per calcolare la deviazione standard

sd3 = focal(nir, w=c(3,3), fun="sd")
plot(sd3) # la deviazione standard su un matrice 3x3, notiamo tutte le zone in cui c'è stata una variazione del NIR

im.multiframe(1,2)
im.plotRGB(sent, r=1, g=2, b=3) 
plot(sd3)

sd5 = focal(nir, w=c(5,5), fun="sd")
plot(sd5) # ho zone con più ampia variabilità perchè sto espandendo la finestra di calcolo

im.multiframe(1,2)
plot(sd3)
plot (sd5)

# per mettere due immagini accanto usando ggplot faccio, usando la library(patchwork)
p1 = im.ggplot(sd3)
p2 = im.ggplot (sd5)
p1 + p2

# Plotto l'originale NIR e la deviazione standard
p3= im.ggplot(nir)
p3 + p1

# Cosa fare in caso di immagini molto grandi
sent <- im.import("sentinel.png")
sent = flip(sent)

ncell(sent) * nlyr(sent) #794 * 798 = 2534448

sent_a = aggregate(sent, fact=2)
# La risoluzione diventa 2,2: ciò significa che aumento di 2 volte per lato, quindi il pixel è grande 4 volte l'originale
ncell(sent_a) * nlyr(sent_a) # 633612

sent_a5 = aggregate(sent, fact=5)
ncell(sent_a5) * nlyr(sent_a5) # 101760
# In questo caso ho fact=5, quindi diminuisco il numero di pixel di 25 volte 

# Make a multiframe and plot in RGB the three image
im.multiframe(1,3)
im.plotRGB(sent, r=1, g=2, b=3)
im.plotRGB(sent_a, r=1, g=2, b=3)
im.plotRGB(sent_a5, r=1, g=2, b=3)

# Calculating standard deviation
nir_a = sent_a[[1]]
sd3_a = focal(nir_a, w=c(3,3), fun="sd")
dev.off()
plot(sd3_a)

# Calculate the standard deviation for the factor 5 image
nir_a5 = sent_a5[[1]]
sd3_a5 = focal(nir_a5, w=c(3,3), fun="sd")
plot(sd3_a5)

sd5_a5 = focal(nir_a5, w=c(5,5), fun="sd")
plot(sd5_a5)

im.multiframe(2,2)
plot(sd3)
plot(sd3_a)
plot(sd3_a5)
plot(sd5_a5)

p1 = im.ggplot(sd3)
p2 = im.ggplot(sd3_a)
p3 = im.ggplot(sd3_a5)
p4 = im.ggplot(sd5_a5)
p1 + p2 + p3 + p4

# Varianza

nir = sent[[1]]
var3 = sd3^2
plot(var3)

sd5 = focal(nir_a, w=c(5,5), fun="sd")
var5 = sd5^2
plot(var5)
