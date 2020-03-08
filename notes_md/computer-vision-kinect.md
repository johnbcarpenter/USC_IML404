# IML404 // Tangible + Spatial Computing // USC MA+P S19   

![flux 2.0](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/flux2-munich.gif)  
<sup>_^ flux 2.0 by johnbcarpenter, justin shrake + yves peitzner lab (2018) / photo: Wolfgang Stahl_</sup>

## computer vision in processing *using 3D sensors* 
3D sensors are a relatively new way for artists and designers to work with 3D data in their environment.  Prior to the release of the Kinect V1, I typically used RGB or infrared cameras to "watch" the environment. There are still some advantages to RGB/Infrared cameras: they're generally more straightforward + quick to set up, powered by USB, included w your laptop, and tends to work in all environmental conditions, but 3D sensors are getting smaller and easier to use (like the Kinect V1 + V2, leap motion, realsense).  The big difference is that the Kinect (and other 3D sensors) provide true 3D data capture from the environment. 

I really like working with the kinect for a couple of reasons: 1) you can depth filter your camera feed (you can only look for motion <= 10 feet out if you want -- say to remove background noise), and 2) you can work directly with 3D data scans of the environment/body.  We'll talk a little bit about how to use both of these techniques in class today; however, I'd encourage you to do some of your own research -- there are a lot of artists that have done some pretty incredible things with these sensors:

![onformative_unnamed-sound-sculpture](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/onformative_unnamed-sound-sculpture.gif)  
<sup>_^ [unnamed sound sculpture](https://vimeo.com/38874664) by onformative (2012)_</sup>

### inspiration
- _[house of cards by radiohead / aaron koblin + google (2008)](https://www.youtube.com/watch?v=8nTFjVm9sTQ)_
- _[fragile tension by depeche mode / memo akten (2009)](http://www.memo.tv/portfolio/depeche-mode-fragile-tension/)_
- _[ISAM live by amon tobin / Blasthaus, VSquared Labs, Vita Motus Design, Leviathan + (2011)](https://www.youtube.com/watch?v=WLrt7-kIgIM)_
- _[unnamed sound sculpture by onformative (2012)](https://vimeo.com/38874664)_
- _[unnamed sound sculpture documentation by onformative (2012)](https://vimeo.com/38850289)_
- _[Creative Applications Networks (CAN) Physics Tutorial by Amno Owed (2013)](https://vimeo.com/49516871)_
- _[Visions of America by refik anadol (2014)](www.refikanadol.com/works/visions-of-america-ameriques/)_
- _[momentum by schnellebuntebilder (2015)](https://vimeo.com/112193826)_
- _[(possibly NSFW for cartoon anatomy) EGO – Klaus Obermaier with Stefano D’Alessio & Martina Menegon (2015)](https://vimeo.com/119042339)_
- _[lagerstroemia by johnbcarpenter + justin shrake (2016)](http://johnbcarpenter.com/artworks/arboretum/index.html)_
- _[flux 2.0 by johnbcarpenter, justin shrake + yves peitzner lab (2018)](https://vimeo.com/265267071)_  

![dandelion clock](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/dandelion.gif)  
<sup>_^ dandelion clock by johnbcarpenter @ACME. los andeles (2011)_</sup>

## kinect V1
The Kinect V1 was developed for gaming on the Xbox360 and released in 2010. In ~Novemeber 2010 coders created and released an SDK + drivers for the kinect that allowed software developers to read the depth + RGB camera data.  One of the first videos I saw using the tech was Robert Hodgin's (_flight404_) [_body dismorphia + fat cat_ (2010](http://roberthodgin.com/portfolio/work/body-dysmorphia/): 

![robert hodgin fat cat](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/hodgin_fatcat.gif)  
<sup>^ [robert hodgin _fat cat / body dismorphia_ (Nov 2010)](https://vimeo.com/17075378)</sup>  

Another early devloper was Daniel Shiffman who adapted the OpenKinect SDK to Processing.  If you're working with a Kinect V1 (or V2), I would start by reading Shiffman's discussion [_Getting Started with Kinect and Processing_](https://shiffman.net/p5/kinect/). He also has a nice introduction to the Kinect and his library on [youtube](https://www.youtube.com/watch?v=QmVNgdapJJM) + you can take a look at the source code for the project on the [_OpenKinect for Processing_ library Github page](https://github.com/shiffman/OpenKinect-for-Processing).

Here's a quick [description of how the kinect works](http://www.depthbiomechanics.co.uk/?p=100) + a photo of the [IR dot pattern](https://www.engadget.com/2010/11/08/visualized-kinect-night-vision-lots-and-lots-and-lots-of-do/) it uses to calculate a depth image (the sensor generates a 3D picture of the space by looking at deformations in the IR grid pattern).

### kinect examples
In order to run these examples, you'll need to download the OpenKinect for Processing library (`Sketch > Import Library... > Add Library...` search for `"Open Kinect"` and install `Open Kinect for Processing`.  Please look through the examples that are installed with the library (see `documents/Processing/libraries/openkinect_processing/examples/Kinect_v1`). We'll be using this library for all of the Kinect V1 and V2 examples. _Note: we'll also be using the optical flow class that i adapted from [Hidetoshi Shimodaira's open processing sketch](https://www.openprocessing.org/sketch/10435/) HOWEVER, the class isn't exactly the same in this new set of examples: this optical flow class been optimized for working with depth data._  

- Kinect camera + optical flow
  - [kinect optical flow](https://github.com/johnbcarpenter/USC_IML404/tree/master/KINECT/DepthThresholdOpticalFlow)
  - [kinect optical flow + boid emit](https://github.com/johnbcarpenter/USC_IML404/tree/master/KINECT/BoidEmit_DepthThresholdOpticalFlow) 

- Kinect point clouds
  - [kinect point cloud + agents (a simplified unnamed sound sculpture)](https://github.com/johnbcarpenter/USC_IML404/tree/master/KINECT/PointCloud_AgentSystem)

---
Shiffman's _Getting Started with Kinect and Processing_ also mentions another kinect library SDK port called _SimpleOpenNI_. As far as I can tell, the original SimpleOpenNI only worked with Processing 1 and 2. However, last semester, one of the students in 288 (thanks jay!) found an updated version of the library: [SimpleOpenNI for Processing 3](https://github.com/totovr/SimpleOpenNI) by Antonio Vega.  The update looks pretty promising and even seems to have skeletal tracking working:

![skeletal tracking in processing 3](https://github.com/totovr/SimpleOpenNI/raw/master/Assets/Kinect_V2_Tracking.gif)  
<sup>skeletal tracking in processing 3 via Antonio Vega's port of [SimpleOpenNI](https://github.com/totovr/SimpleOpenNI)</sup>

## kinect V2
  
## intel realsense
library

## leap motion
library

## iPhone X/11 + the standard cyborg _capture_ iOS app
ply -> csv
shaders

