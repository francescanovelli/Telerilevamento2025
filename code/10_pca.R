# i cosdice su R per l'analisi delle Componenti Principali (PCA)

library(imageRy)
library(terra)

im.list()

sent = im.import("sentinel.png")
sent = flip(sent)
plot(sent)

# Eliminiamo l'ultima immagine
sent = c(sent[[1]], sent[[2]], sent[[3]])
plot(sent)

# Band 1: NIR
# Band 2: red
# Band 3: green

sent_pca = im.pca(sent)
tot = 84.70884 + 53.88527 + 5.97431
84.70884 * 100 / tot # 58.59429, indica quanta variabilità spiega la prima componente principale
# Si capisce fin da subito che la prima componente principale è la più indicativa

sent_pca = im.pca(sent, n_samples=10000)

# Calcoliamo la deviazione standard
sd_pca = focal(sent_pca[[1]], w=c(3,3), fun="sd")
plot(sd_pca)
# L'immagine è molto simile a quella del NIR, ma in questo caso la banda è stata scelta in funzione di un'oggettività di base, data dal calcolo della PCA

# Osserviamo un grafico con tutte le correlazioni
pairs(sent)
# Fra la seconda (red) e la terza banda (green) c'è una correlazione altissima
# Il NIR ha invece una correlazione molto più bassa
