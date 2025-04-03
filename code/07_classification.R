# i codici di R per classificare le immagini

library(terra)
library(imageRy)
library(ggplot2)
library(patchwork)

im.list()

mato1992 = im.import("matogrosso_l5_1992219_lrg.jpg")
mato1992 = flip(mato1992)
plot(mato1992)

mato2006 = im.import("matogrosso_ast_2006209_lrg.jpg")
mato2006 = flip(mato2006)
plot(mato2006)

mato1992c = im.classify(mato1992, num_clusters=2)
# classe 1 - Antropica
# classe 2 - Foresta

mato2006c = im.classify(mato2006, num_clusters=2)
# classe 1 - Foresta
# classe 2 - Antropica

# le classi come colore vengono assegate in maniera randomica

# si possono calcolare le frequenze nell'immagine, cioè il numero di volte che quella classe compare nel pixel
f1992 = freq(mato1992c)
f1992

# calcoliamo una proporzione
tot1992 = ncell(mato1992c) # calcolo il tot. dei pixel
prop1992 = f1992/tot1992
  # 16.9% per la classe 1
  # 83.1% per la classe 2

# per l'immagine del 2006 le percentuali sono 
  # 54.7% per la classe 1
  # 45.3% per la classe 2

# Creiamo una tabella
class = c("Antropico","Foresta")
y1992 = c(17, 83)
y2006 = c(55, 45)
tab = data.frame(class, y1992, y2006)

# Creiamo un grafico, usando la library di ggplot2
p1 = ggplot(tab, aes(x=class, y=y1992, color=class)) + 
  geom_bar(stat="identity", fill="white") +
  ylim(c(0,100)) + coord_flip()

p2 = ggplot(tab, aes(x=class, y=y2006, color=class)) + 
  geom_bar(stat="identity", fill="white") +
  ylim(c(0,100)) + coord_flip()

p1/p2

# Solar Orbiter #

solar = im.import("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
solarc = im.classify(solar, num_clusters=3)
# classe 1 = alta
# classe 2 = media
# classe 3 = bassa

solarcs = subst(solarc, c(1, 2, 3), c("c3_alta", "c2_media", "c1_bassa"))

im.multiframe(2,1)
plot(solar)
plot(solarc)

solarp = freq(solarcs)$count *100 / ncell(solarcs)
# [1] 37.33349 41.44658 21.21993

# dataframe
class = c("c1_bassa","c2_media","c3_alta")
perc = c(37.3, 41.5, 21.2)
tabsol= data.frame(class, perc)

ggplot(tabsol, aes(x=class, y=perc, fill=class, color=class) + 
  geom_bar(stat="identity") +
  ylim(c(0,50)) + coord_flip()





