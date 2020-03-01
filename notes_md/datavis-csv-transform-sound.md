# IML404 // Datavis: loading CSVs, 3D transforms + sound

Today we're going to go through a number of different ways to work with data in processing.  To start with, let's take a look at loading a CSV (comma-separated value -- a pretty standard, simple format for storing data) into processing. We'll use the data below (generated with [standard cyborg's iOS *capture* app](https://www.standardcyborg.com/products/), which has been exported to a PLY using the web interface and converted to CSV so that we can work with a file format native to processing):

![flamingo scan using standard cyborg's capture](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/FlamingoScan.png)  
<sup> ^ (jellycat cordy roy) flamingo scan using [standard cyborg's iOS *capture* app](https://www.standardcyborg.com/products/)</sup>

## loading CSVs using loadTable()
[*loadTable()*](https://processing.org/reference/loadTable_.html) is a new method that we'll be using to read the CSV file values into a Table object in Processing.

- [flamingo CSV data](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/DATA/FlamingoScan.zip)
- [STEP 1. getting the data into processing](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/DATA/FlamingoScan_LoadData)
- [STEP 2. using shaders to set the point sizes + working with the Spinner class](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/DATA/FlamingoScan_ShaderSpinner)

## 3D transformations

- rectangle <-> sphere

here's an example utilizing the above transformations that builds on the loadTable CSV example (it also reads in data from a CSV file and utilizes shaders and the Spinner class); however, it also works with additional dimensions of information for each point.

The kepler data is... WIP // [kepler exoplanet data downloaded from caltech](https://exoplanetarchive.ipac.caltech.edu/cgi-bin/TblView/nph-tblView?app=ExoTbls&config=planets)

![kepler datavis](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/keplerDataVis.png)  
<sup> ^ kepler datavis using [caltech's exoplanet archive](https://exoplanetarchive.ipac.caltech.edu/cgi-bin/TblView/nph-tblView?app=ExoTbls&config=planets)</sup>

- [keplerDataVis](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/DATA/keplerDataVis)

## sound // Minim

