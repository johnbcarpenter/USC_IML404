# IML404 // Tangible + Spatial Computing // USC MA+P S19   

![dandelion clock](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/dandelion.gif)  
_^ dandelion clock by johnbcarpenter @ACME. los andeles (2011)_

## computer vision in processing using a 3D sensor (part 2)
we're going to be using [OpenKinect for Processing by Daniel Shiffman](https://github.com/shiffman/OpenKinect-for-Processing), and we'll also be using the optical flow class that i adapted from [Hidetoshi Shimodaira's open processing sketch](https://www.openprocessing.org/sketch/10435/) again -- please note, the class isn't exactly the same in this new set of examples -- this optical flow class been optimized for working with depth data.  

daniel shiffman has a nice introduction to the kinect and his library on [youtube](https://www.youtube.com/watch?v=QmVNgdapJJM).  i really like working with the kinect for a couple of reasons: 1) you can depth filter your camera feed (you can only look for motion <= 10 feet out if you want), and 2) you can work directly with 3D data scans of the environment/body.  we'll talk a little bit about how to use both of these techniques in class today.

![flux 2.0](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/flux2-munich.gif)  
_^ flux 2.0 by johnbcarpenter, justin shrake + yves peitzner lab (2018) / photo: Wolfgang Stahl_

### kinect examples
in order to run these examples, you'll need to download the OpenKinect for Processing library (`Sketch > Import Library... > Add Library...` search for "kinect" and install `Open Kinect for Processing`.  Please look through the examples that are installed with the library (see `documents/Processing/libraries/openkinect_processing/examples/Kinect_v1`)

### inspiration
![onformative_unnamed-sound-sculpture](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/onformative_unnamed-sound-sculpture.gif)  
_^ [unnamed sound sculpture](https://vimeo.com/38874664) by onformative (2012)_

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

### Kinect camera + optical flow
- [kinect optical flow](https://github.com/johnbcarpenter/USC_IML404/tree/master/KINECT/DepthThresholdOpticalFlow)
- [kinect optical flow + boid emit](https://github.com/johnbcarpenter/USC_IML404/tree/master/KINECT/BoidEmit_DepthThresholdOpticalFlow) 

### Kinect point clouds
- [kinect point cloud + agents (a simplified unnamed sound sculpture)](https://github.com/johnbcarpenter/USC_IML404/tree/master/KINECT/PointCloud_AgentSystem)

