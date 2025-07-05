# **Esame telerilevamento geologico in R (09/07/2025)**
## Nuova Zelanda, La siccità della costa est nel 2020 e confonto prima e dopo 
Francesca Novelli

## Introduzione
L'area di interesse del progetto è la Nuova Zelanda, in particolare la costa est dell'isola Nord: lo scopo è quello di confrontare l'anno 2020, in cui l'area di interesse è stata colpita da una forte siccità, con gli anni del 2019,cioè l'anno pre-siccità, e del 2025, cioè lo stato attuale. 

## Raccolta Dati
I dati sono stati presi dal seguente sito: [Google Earth Engine](https://earthengine.google.com/)
Le immagini utilizzate sono una mediana del preiodo dal 1° al 31 maggio dei ripettivi anni (2019, 2020 e 2025). 
Il codice utilizzato per scaricare le immagini: [Cartella codice GEE](https://github.com/francescanovelli/Telerilevamento2025/blob/main/esame/GEE.js)



## Pacchetti utilizzati:
``` r
library(terra)
library(imageRy)
library(viridis)
```

