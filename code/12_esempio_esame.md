# Titolo presentazione 
## Raccolta Dati

I dati sono stati presi dal seguente sito:  [Earth Observatory site](https://earthobservatory.nasa.gov/)

Pacchetti usati:
``` r
library(terra)
library(imageRy)
library(viridis)
```

Inserisco dove tovare le immagini sul PC:
``` r
setwd("~C:/Users/User/OneDrive/Documenti/UNI/R")
dust = rast("dust.jpg)
plot(dust)
dust = flip(dust)
plot(dust)
```

L'immagine è la seguente:

![dustout](https://github.com/user-attachments/assets/c9e950e6-05ad-463c-89bc-b2d81a808b7d)

## Data Analisi

Date le immagini raccolte dal sito, possiamo calcolare il seguente indice: 
``` r
dustindex = dust[[1]]- dust[[3]]
plot(dustindex)
```

Esportare il grafico dell'indice, possiamo usare la funzione png():
``` r
png("fireindex.png")
plot(fireindex)
dev.off()
```

Il grafico dell'indice:

![dustindex](https://github.com/user-attachments/assets/1d99d740-0f43-4f7a-b50f-a0ddb78321fe)

## Correlazione tra le bande

Siccome le RGB sono composte da bande del visibile, mi aspetto che la correlazione sia alta
``` r
pairs(dust)
```
In questo modo faccio il grafico:

![pairsout](https://github.com/user-attachments/assets/c16c84dd-dc4f-42f9-be48-75a9d3b17a4e)

## Indice di visualizzazione con viridis
Visualizzo il grafico dell'inidce con un altra palette di viridis usando il deguente codice:
``` r
plot(dustindex, col=inferno(100))
```

L'immagine è questa:

![dustinferno](https://github.com/user-attachments/assets/f871cc40-afb8-4d0b-9ce0-b3d6bcb7ace0)
