# IML404 // Datavis: loading CSVs, 3D transforms + sound

Today we're going to go through a number of different ways to work with data in processing.  To start with, let's take a look at loading a CSV (comma-separated value -- a pretty standard, simple format for storing data) into processing. We'll use the data below (generated with [standard cyborg's iOS *capture* app](https://www.standardcyborg.com/products/), which has been exported to a PLY using the web interface and converted to CSV so that we can work with a file format native to processing):

![flamingo scan using standard cyborg's iOS app capture](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/FlamingoScan.png)
<sup> ^ flamingo scan using [standard cyborg's iOS *capture* app](https://www.standardcyborg.com/products/)</sup>

## loading CSVs using loadTable()
We've been working with the RGB camera for optical flow, but we can also do some interesting things with the *pixels[]* we're capturing.  To start off, please review Shiffman's discussion of [*Images and Pixels*](https://processing.org/tutorials/pixels/) on the Processing website.


