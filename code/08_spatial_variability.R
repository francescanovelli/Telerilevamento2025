# Codice R per calcolare la variabilità spaziale

library(terra)
library(imageRy)

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






