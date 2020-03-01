# IML404 // Datavis: loading CSVs, 3D transforms + sound

Today we're going to go through a number of different ways to work with data in processing.  To start with, let's take a look at loading a CSV (comma-separated value -- a pretty standard, simple format for storing data) into processing. We'll use the data below (generated with [standard cyborg's iOS *capture* app](https://www.standardcyborg.com/products/), which has been exported to a PLY using the web interface and converted to CSV so that we can work with a file format native to processing):

ben fry // fathom
image 

## loading CSVs using loadTable()
[*loadTable()*](https://processing.org/reference/loadTable_.html) is a new method that we'll be using to read the CSV file values into a Table object in Processing.

![flamingo scan using standard cyborg's capture](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/FlamingoScan.png)  
<sup> ^ (jellycat cordy roy) flamingo scan using [standard cyborg's iOS *capture* app](https://www.standardcyborg.com/products/)</sup>

- [flamingo CSV data](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/DATA/FlamingoScan.zip)
- [STEP 1. getting the data into processing](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/DATA/FlamingoScan_LoadData)
- [STEP 2. using shaders to set the point sizes + working with the Spinner class](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/DATA/FlamingoScan_ShaderSpinner)

## 3D transformations

- rectangle <-> sphere

- moon data

## loading CSVs and transforming data
Here's an example that applies the above transformations to some stellar data from caltech.  We'll still get the data into Processing via a CSV + loadTable, and utilize shaders and the Spinner class; however, we'll also track a few additional dimensions of information to provide additional data for each point.

jer thorpe // Jer Thorp: Data Artist // https://www.jerthorp.com
OCR office for creative research

The kepler data is... WIP // [kepler exoplanet data downloaded from caltech](https://exoplanetarchive.ipac.caltech.edu/cgi-bin/TblView/nph-tblView?app=ExoTbls&config=planets)

![kepler datavis](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/keplerDataVis.png)  
<sup> ^ kepler datavis using [caltech's exoplanet archive](https://exoplanetarchive.ipac.caltech.edu/cgi-bin/TblView/nph-tblView?app=ExoTbls&config=planets)</sup>

- [keplerDataVis](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/DATA/keplerDataVis)

## sound // Minim

