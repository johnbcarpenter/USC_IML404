# IML404 // Datavis: loading CSVs, 3D transforms + sound

![](https://cdn.shopify.com/s/files/1/0721/3419/products/allstreets-for-web-003_1024x1024.jpg)  
<sup> ^ [All Streets Limited (2007/2011)](https://3rdfloor.fathom.info/products/all-streets) by Ben Fry and [Fathom Information Design](https://fathom.info)</sup>

Today we're going to go through a number of different ways to work with data in processing.  I got my introduction to working with data in Processing via [Ben Fry's](https://benfry.com) [*Visualizing Data*](https://benfry.com/writing/archives/3/)(O’Reilly, 2007) -- yes, the Ben Fry who started Processing with Casey Reas and still maintains it to this day -- thanks Ben! While Processing has changed since 2007 (e.g. new methods and classes), the ideas in this book, and his discussion and approach to working with data are an essential and foundational introduction to data visualization. Ben founded [Fathom Information Design](https://fathom.info), and I'd highly recommend taking a look at their work if you're interested in data visualization.

## loading CSVs using loadTable()
To start with, let's take a look at loading a CSV (comma-separated value -- a pretty standard, simple format for storing data) into processing. We'll use the data below (generated with [standard cyborg's iOS *capture* app](https://www.standardcyborg.com/products/), which has been exported to a PLY using the web interface and converted to CSV so that we can work with a file format native to processing):

[*loadTable()*](https://processing.org/reference/loadTable_.html) is a new method that we'll be using to read the CSV file values into a Table object in Processing.

![flamingo scan using standard cyborg's capture](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/FlamingoScan.png)  
<sup> ^ (jellycat cordy roy) flamingo scan using [standard cyborg's iOS *capture* app](https://www.standardcyborg.com/products/)</sup>

- [flamingo CSV data](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/DATA/FlamingoScan.zip)
- [STEP 1. getting the data into processing](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/DATA/FlamingoScan_LoadData)
- [STEP 2. using shaders to set the point sizes + working with the Spinner class](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/DATA/FlamingoScan_ShaderSpinner)

## 3D transformations

![Jer Thorpe Kepler](http://blog.blprnt.com/wp-content/uploads/2012/03/Kepler22_44_33.png)
<sup> ^ [Exo: A Visualization of Kepler’s Exoplanet Candidates](https://vimeo.com/41655330) by Jer Thorpe in collaboration with Oblong Industries</sup>

This is a trick I learned from the data artist [Jer Thorpe](https://www.jerthorp.com) and his work at the [Office for Creative Research](https://medium.com/@blprnt/doing-data-differently-the-office-for-creative-research-2426492e4671).  One of my favorite moves of Jer is when he reorganizes data -- and the views into that data -- in real-time. This gives the viewer a way to follow what's going on in the system -- and even if it's difficult to track all the shifts, the viewer inherently understands that they're looking at the same data from a new perspective. Unfortunately, I'm having trouble finding the specific work I'm thinking of where he shifts a map view of some data into a globe, but the [Okavango Data Viz](https://vimeo.com/124307636) is a good example of this technique, as is [Exo: A Visualization of Kepler’s Exoplanet Candidates](https://vimeo.com/41655330) (which is the inspiration for the Kepler example we'll look at later on).

![RECT2SPHERE](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/RECT2SPHERE.gif)  
<sup> ^ RECT2SPHERE class example </sup>

- [RECT2SPHERE class example](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/DATA/RECT2SPHERE)

Now let's use this technique (along with some of the other examples we've looked at: *pixels[], shaders, Spinner class*) to map the [Global Digital Elevation Model from METI of Japan + NASA](https://asterweb.jpl.nasa.gov/gdem.asp) to a sphere.

![GLOBAL_ELEV_DATA](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/GLOBAL_ELEV_DATA.png)  
<sup> ^ GLOBAL_ELEV_DATA class example </sup>

- [GLOBAL_ELEV_DATA class example](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/DATA/GLOBAL_ELEV_DATA)

## loading CSVs and transforming data
Inspired by [Exo: A Visualization of Kepler’s Exoplanet Candidates](https://vimeo.com/41655330) by Jer Thorpe, here's an example that explores some additional transformations on an updated dataset from Caltech.  We'll still get the data into Processing via a CSV + loadTable, and utilize shaders and the Spinner class; however, we'll also track a few additional dimensions of information to provide additional data for each point.

![kepler datavis](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/keplerDataVis.png)  
<sup> ^ kepler datavis using [caltech's exoplanet archive](https://exoplanetarchive.ipac.caltech.edu/cgi-bin/TblView/nph-tblView?app=ExoTbls&config=planets)</sup>

The original data can be downloaded from the [Kepler Exoplanet Archie at Caltech](https://exoplanetarchive.ipac.caltech.edu/cgi-bin/TblView/nph-tblView?app=ExoTbls&config=planets).

- [keplerDataVis](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/DATA/keplerDataVis)

## sound // Minim

- [sound + analyzed FFT spectrum spiral](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/SOUND/spiralFFT)


