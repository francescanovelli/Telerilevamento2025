# Reporting multitemporal analysis in R

Per importare un immagine bisogna:

``` r 
im.list() # make a list
gr = im.import("greenland") # to import the image
```

Poi possiamo anche calcorare i diversi valori delle immagini
``` r 
grdif = gr[[4]] - gr[[1]]
```

This will create the following output images:

<img src="../Pics/output.jpeg" width=50% />

> Note 1: If you want to put .pdf files you can rely on stackoverflow

> Note 2: Information about Copernicus program can be found at: https://www.copernicus.eu/it

> Here are the [Sentinel data used](https://dataspace.copernicus.eu/explore-data/data-collections/sentinel-data)
