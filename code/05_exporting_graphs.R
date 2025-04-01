# Per esportare immagini e grafici da R

# Esportare dati da R a GitHub
# Selezioniamo la cartella di lavoro
setwd("C/\Users/ser/OneDrive/Documenti/UNI/R")

# Per vedere la cartella selezionata
getwd()

# Creiamo un file PDF con la funzione pdf()
pdf("output.pdf") # Creiamo il file
plot(grdif) # Plottiamo il grafico all'interno del file
dev.off() # Alla fine devo chiudere il file altrimenti il PDF non viene creato

# Creiamo un file immagine con la funzione jpeg()
jpeg("output.jpeg")
plot(grdif)
dev.off()
