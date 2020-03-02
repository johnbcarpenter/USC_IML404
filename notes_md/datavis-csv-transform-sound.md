# IML404 // Datavis: loading CSVs, 3D transforms + sound

![](https://cdn.shopify.com/s/files/1/0721/3419/products/allstreets-for-web-003_1024x1024.jpg)  
<sup> ^ [*All Streets* Limited (2007/2011)](https://3rdfloor.fathom.info/products/all-streets) by [Ben Fry](https://benfry.com) and [Fathom Information Design](https://fathom.info)</sup>

Today we're going to go through a number of different ways to work with information in processing.  I got my introduction to working with data via Ben Fry's book [*Visualizing Data*](https://benfry.com/writing/archives/3/) (O’Reilly, 2007) -- yes, the [Ben Fry](https://benfry.com) who started Processing with Casey Reas and still maintains it to this day -- thanks Ben! While Processing has changed since 2007 (e.g. new methods and classes for working with tables), the ideas in this book and the  approach to datavisualization are an essential introduction to the field. Ben founded [Fathom Information Design](https://fathom.info) in 2010, and I'd highly recommend taking a look at their work.

In any case, I love the above visualization because the data reveals additional dimensions of data that aren't in the dataset: *mountains and other geography, lakes and oceans, cities...*

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

One of my favorite tricks of the data artist [Jer Thorpe](https://www.jerthorp.com) is when he reorganizes data -- and the views into that data -- in real-time to generate additional perspectives into the information. This animated transition (or state change) gives viewers a way to follow changes in the system -- and even if it's difficult to track all the shifts -- the viewer inherently understands that they're looking at the same data from a new perspective. I'm having trouble finding the specific global datavis work that I'm thinking of (where he shifts a map view of some data into a globe), but the [Okavango Data Viz](https://vimeo.com/124307636) is a good example of this *reorganization/shifting perspective* technique, as is [Exo: A Visualization of Kepler’s Exoplanet Candidates](https://vimeo.com/41655330) (which is the inspiration for the Kepler example we'll look at later on). 

![RECT2SPHERE](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/RECT2SPHERE.gif)  
<sup> ^ RECT2SPHERE class example </sup>

- [RECT2SPHERE class example](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/3D_SHADERS/RECT2SPHERE)

Now let's use this technique (along with some of the other examples we've looked at (*pixels[], shaders, Spinner class*) to map the [Global Digital Elevation Model from METI of Japan + NASA](https://asterweb.jpl.nasa.gov/gdem.asp) to a sphere.

![GLOBAL_ELEV_DATA](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/GLOBAL_ELEV_DATA.gif)  
<sup> ^ GLOBAL_ELEV_DATA class example </sup>

- [GLOBAL_ELEV_DATA class example](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/DATA/GLOBAL_ELEV_DATA)

## loading CSVs and transforming data
Inspired by [Exo: A Visualization of Kepler’s Exoplanet Candidates](https://vimeo.com/41655330) by Jer Thorpe, here's an example that explores some additional transformations on an updated dataset from Caltech.  We'll still get the data into Processing via a CSV + loadTable, and utilize shaders and the Spinner class; however, we'll also track a few additional dimensions of information to provide additional data for each point.

![kepler datavis](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/keplerDataVis.png)  
<sup> ^ kepler datavis using [caltech's exoplanet archive](https://exoplanetarchive.ipac.caltech.edu/cgi-bin/TblView/nph-tblView?app=ExoTbls&config=planets)</sup>

The original data can be downloaded from the [Kepler Exoplanet Archie at Caltech](https://exoplanetarchive.ipac.caltech.edu/cgi-bin/TblView/nph-tblView?app=ExoTbls&config=planets).

- [keplerDataVis](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/DATA/keplerDataVis)

## sound // Minim
![solar by robert hodgin](https://farm5.static.flickr.com/4026/4247502776_5510ed7000_o.jpg)  
<sup> ^ [*Solar* (2008)](https://vimeo.com/658158) by [Robert Hodgin](http://roberthodgin.com) aka [flight404](https://vimeo.com/flight404)</sup>

I think that anyone interested in real-time sound visualization should start by taking a look at [Robert Hodgin's](http://roberthodgin.com) work [*Solar* (2008)](https://vimeo.com/658158) and [Magnetosphere (2007+)](https://vimeo.com/8581392). These works led to Robert + the Barbarian Group reimagining the [iTunes song visualizer](http://roberthodgin.com/portfolio/work/magnetosphere/) in 2008.

Moving to processing, R. Luke DuBois and Wilm Thoben wrote the [*Sound* tutorial](https://processing.org/tutorials/sound/) on Processing.org. Please read through this discussion -- it's a pretty impressive + comprehensive walk through of the history of technology and sound -- and make sure to read through *Example 5, 6: Audio analysis*...

> In addition to the classes used for generating and manipulating audio streams, Sound provides two classes for audio analysis: a Fast Fourier Transformation (FFT) and an amplitude follower. The FFT class analyzes an audio stream and fills an array with bins (samples in the frequency domain) of the positive side of the audio spectrum up to half the sample rate. This allows us to use different frequency bands of a particular sound to trigger events or visualize them in the draw() loop.
     
Daniel Shiffman also has a video on the Coding Train that discusses [*Sound Visualization: Frequency Analysis with FFT*](https://www.youtube.com/watch?v=2O3nm0Nvbi4) that's a good resource. We'll primarily be using the [FFT class](https://processing.org/reference/libraries/sound/FFT.html) in this example...

![spiralFFT](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/spiralFFT.png)  
<sup> ^ spiralFFT class example </sup>

- [sound + analyzed FFT spectrum spiral](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/SOUND/spiralFFT)


