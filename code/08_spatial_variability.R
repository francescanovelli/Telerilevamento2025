# Codice R per calcolare la variabilità spaziale

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
