# codice R per generare funzioni

# nome <- fucntion(argomenti) {
  funzione
  return(z)
  }

somma <- function(x, y) {
  z = x+y
  return(z)
  }

differenza <- function(x,y) {
  z = x-y
  return(z)
  }

mf <- function(nrow,ncol) {
  par(mfrow=c(nrow,ncol))
  }

# Usiamo la funzione condizionale if() ed else if()
positivo <- function(x) {
  if(x>0) {
    print("Questo è un numero positivo, non lo sai?")
    }
  else if(x<0) {
    print("Questo è un numero negativo, studia!")
    }
  else {
    print("Lo zero non è nè positivo nè negativo, da sempre")
    }
  }
# Usiamo la funzione else, che è senza argomenti, al posto di if else() per indicare tutti gli altri casi
# Quindi, per la seconda condizione non posso usarlo perchè comprenderebbe anche lo zero
# Per la terza condizione, invece, sì perchè non ci sono ulteriori casi

flipint <- function(im) {
  x = flip(im)
  plot(im)
  }
