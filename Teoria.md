Abbiamo la possibilità di usare più bande insieme. Questo avviene grazie ad uno schema, detto RGB, in cui ci sono tutti e tre i colori fondamentali. Ovvero rosso, 
verde e blu, che uniti insieme e quindi sovrapposti creano tutti i colori possibili. Le piante riflettono molto nel NIR, quindi il filtro del NIR cosrrisponderà 
alle piante. Quindi usando dei filtri NIR si verdranno molto bene e si distingue facilmente le diverse tipologie di vegetazione, dove le parti rosso chiaro sono 
le sommità delle piante, vediamo anche l'acqua. In base a dove metto il colore infrarosso vicino è quello che mi fa variare il colore dell'immagine, quindi le altre 
bande dove sono messe conta ben poco. Il suolo nudo in questi casi tende a diventare giallo.

Gli indici spettrali sono due o più bande montate insieme.

La riflettanza = rapporto della luce del sole che vienere riflessa e quella che viene assorbita. Se tutto vienre riflesso la riflettanza è uguale a 1 se invece viene
tutto assorbito allora la riflettanza è 0. Quindi il range della riflettanza va da 0 a 1. In un'immagine sarellitare creare un immagine in cui ogni pixel ha un numero 
diverso dal pixel vicino diventa ingestibile. Per ovviare questo problema noi facciamo diventare il numero decimale in numero intero. Si sfrutta così una componente 
del computer detto bit. Un bit è una singola info all'interno del computer, con un bit ho due info possibili o 0 o 1. Con due bit ho quindi 4 info possibili, con 3 
bit ho 8 combinazioni possibili... Quindi molte immagini sono fatte riscalate con 256 valori al posto di usare la virgola e quindi uso 8 bit. Questa è una risoluzione 
radiometrica 

# Indici spettrali #
DVI - indice di differenza vegetale
  >In un albero sano la pianta riflette moltissimo nell'infrarosso vicino, quindi il NIR è uguale, in un immagine a 8 bit, mentre la riflettanza nel red è pari a 0. 
   Il DVI è la differenza tra la riflettanza nel rosso cioè in questo caso 255-0=255.
  >In un albero stressato riflette di meno nel NIR e avrà un riflettanza pari solo a 100, mentre nel rosso la pianta non assorbirà più del tutto e quindi la riflettanza
   è pari al 30. In questo caso il DVI sarà 100-30=70.


# SISTEMI DI RIFERIMENTO #
La forma reale della terra non è una forma geometrica, è un Geoide, cioè una superficie equidistanziale, cioè dove la forza di gravità è sempre costante. La terra non 
è una sfera, la terra serebbe una sfera solo se la gravità fosse uguale in tutti i suoi punti. Non esistono delle concavità all'interno della Terra, la forma è sempre
convessa. 
Tralasciando la superficie topografica, la superficie del geoide non può essere usata per fare delle misure, perchè non è geometrica. Per questo viene approssimata ad 
un ellissoide, perchè per un movimento terrestre attorno all'asse c'è uno schiacciamento verso i poli che dà come forma finale non una sfera ma un ellissoide. 
Il problema è che le misure fatte sulla superficie dell'ellissoide non corrisponde in tutti i punti alla superficie del geoide: questo fenomento è detto oscillazione
ellissoidica. Il datum mi indica non solo l'ellissoide a cui sto facendo riferimento ma anche il suo posizionamento sulla Terra. In Europa l'ellissoide è ED50. Negli USA
utilizzano un altro ellissoide NAD27. I parametri dell'ellissoide sono i due semiassi quello maggiore e quello minore, a seconda dell'ellissoide che usiamo cambiano anche 
la latitudine e la longitudine a cui facciamo riferimento. 
La latitudine = si forma tra la normale al punto P e il piano che contiene l'equatore: l'unica superficie in cui la normale al punto P va al centro della sfera, ma la 
Terra non è una sfera è un ellissoide quindi la normale al punto P incontra l'equatore a un certo punto. La latitudine ha anche un ruolo biologico.
Anche le coordinate in gradi misurate sull'ellissoide non sono assolute ma necessitano di un datum. 
Nel 1984 viene lanciata una rete di satelliti, che governano il GPS internazionale. Questo viene integrato all'interno del datum WGS84, grazie a questa rete si risce a 
misurare tutta la terra dal satellite, in questo modo si può usare un unico datum.

PROIEZIONI, tra le più conosciute c'è quella di Mercatore. Prende la Terra e mette un cilindro tangente all'equatore, poi svolge il clindro. Tutte le zone vicino all'equatore 
saranno in scala 1:1, mentre più mi allontano più saranno distorte. In questo modo questa proiezione si può usare solo all'equatore. Si opta qundi per un'altra proiezione,
in cui il cilindro è tangente al meridiano di riferimento. In questo caso, c'è un altro probelma perchè man mano che ci allontaniamo dal meridiano di riferimento ci sono forti 
distorsioni. Per evitare questo probelma si cambia il meridiano di riferimento, ottendendo così un riferimento locale. Noto come UTM Sistema Traversale Universale di Mercatore. 
Ogni volta che si misura la distanza dal meridiano centrale in m come x, e la distanza con l'equatore in m come y. Per evitare le coordinate negative si da una falsa origine 
di 5000m, c'è anche per la y, ma in questo casono basta dire N o S. 
Per passare da un sistema all'altro con una trasformazione detta trasformazione a 6 parametri Molodensky Helmets:
    1. Traslazione sulla X
    2. Traslazione sulla Y
    3. Traslazione sulla Z
    4. Rotazione sulla X
    5. Rotazione sulla Y
    6. Rotazione sulla Z

EPSG sta per european petroleum survey group, per ogni singolo sistema di riferimento c'è un codice specifico. 

# Classificazione
Pixel che appartengono alla stessa classe sono molto vicini tra di loro in termini di riflettanza. Classifico l'immagine in base hai pixel in entrata così poi da avere tutta 
l'immagine classificata in base alle classi. 
 
