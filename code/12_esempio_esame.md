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
fires = rast("fires.jpg")
plot(fires)
fires = flip(fires)
plot(fires)
```

L'immagine è la seguente:

![fires](https://github.com/user-attachments/assets/e0f07ba3-8883-4b8b-b9e8-8e1a2049f296)

## Data Analisi

Date le immagini raccolte dal sito, possiamo calcolare il seguente indice: 
``` r
fireindex = fires[[1]] - fires[[2]]
plot(fireindex)
```

Esportare il grafico dell'indice, possiamo usare la funzione png():
``` r
png("fireindex.png")
plot(fireindex)
dev.off()
```

Il grafico dell'indice:

![fireindex](https://github.com/user-attachments/assets/0690737f-e49b-4b94-9178-29ad76804765)

## Correlazione tra le bande

Siccome le RGB sono composte da bande del visibile, mi aspetto che la correlazione sia alta
``` r
pairs(fires)
```
In questo modo faccio il grafico:
# ERROREEEEEEEEEEEEE

## Indice di visualizzazione con viridis
Visualizzo il grafico dell'inidce con un altra palette di viridis usando il deguente codice:
``` r
plot(fireindex, col=inferno(100))
```

L'immagine è questa:

![inferno](https://github.com/user-attachments/assets/9bab43f4-5374-4e4d-9115-25a1c234fea6)



