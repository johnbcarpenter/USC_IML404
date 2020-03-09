# IML404 // Tangible + Spatial Computing // USC MA+P S19   

![flux 2.0](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/flux2-munich.gif)  
<sup>_^ flux 2.0 by johnbcarpenter, justin shrake + yves peitzner lab (2018) / photo: Wolfgang Stahl_</sup>

## computer vision in processing *using 3D sensors* 
3D sensors are a relatively new way for artists and designers to work with 3D data in their environment.  Prior to the release of the Kinect V1, I typically used RGB or infrared cameras to _sense_ the environment. There are still some advantages to RGB/Infrared cameras: _they generally offer more visual detail and are more straightforward + quick to set up (powered by USB and/or included w your laptop), and tends to work in all environmental conditions_, but 3D sensors are getting smaller and easier to use all the time (like the [Kinect Azure (V3)](https://github.com/johnbcarpenter/USC_IML404/blob/master/notes_md/computer-vision-kinect.md#kinect-azure), [leap motion](https://github.com/johnbcarpenter/USC_IML404/blob/master/notes_md/computer-vision-kinect.md#leap-motion), and [realsense](https://github.com/johnbcarpenter/USC_IML404/blob/master/notes_md/computer-vision-kinect.md#intel-realsense)).  The big difference between the two is that 3D sensors provide true 3D data capture from the environment, while RGB camera sensors tend to provide more visual detail (e.g. color) -- though there's some really interesting opportunities to look at both types of capture at the same time. 

I really like working with the kinect for a couple of reasons: 1) you can depth filter your camera feed (you can only look for motion <= 10 feet out if you want -- say to remove background noise), and 2) you can work directly with 3D data scans of the environment/body.  Additionally, some of the more recent 3D sensor SDK provide the user with real-time skeletal and hand tracking data.  We'll talk about some examples in class today; however, I'd encourage you to do some of your own research -- there are a lot of artists that have done some pretty incredible things with these sensors:

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

## kinect V1 (2010)
<p float="left">
  <img src="https://3er1viui9wo30pkxh1v2nh4w-wpengine.netdna-ssl.com/wp-content/uploads/2011/01/01-06Kinect_sm45C98477_Page.jpg" height="200" />
  <img src="https://o.aolcdn.com/images/dims?thumbnail=640%2C&quality=80&image_uri=http%3A%2F%2Fwww.blogcdn.com%2Fwww.engadget.com%2Fmedia%2F2010%2F11%2F101108-nightvision-01.jpg&client=amp-blogside-v2&signature=e6995e13185fd2580918f405113002bfb8d8ca8a" height="200" /> 
</p>   
<sup>^ Microsoft Kinect V1 (2010) + a photo of the <a href="https://www.engadget.com/2010/11/08/visualized-kinect-night-vision-lots-and-lots-and-lots-of-do/">IR dot pattern</a> by Joseph L. Flatley (via engadget).  The sensor uses this grid calculate a depth image via the deformations of the IR pattern. </sup>  

The Kinect V1 was developed for gaming on the Xbox360 and released in 2010. By ~November 2010 developers released an SDK + drivers for the kinect that allowed software developers to connect the sensors to their computers and read the depth + RGB camera data.  One of the first videos I saw using the tech was Robert Hodgin's (_flight404_) [_body dismorphia / fat cat_ (2010)](http://roberthodgin.com/portfolio/work/body-dysmorphia/): 

![robert hodgin fat cat](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/hodgin_fatcat.gif)  
<sup>^ [robert hodgin _fat cat / body dismorphia_ (Nov 2010)](https://vimeo.com/17075378)</sup>  

Another early adaptor was Daniel Shiffman who ported the OpenKinect SDK to Processing (🙌 [@shiffman](https://github.com/shiffman)).  If you're working with a Kinect V1 (or V2), I would start by reading Shiffman's discussion [_Getting Started with Kinect and Processing_](https://shiffman.net/p5/kinect/). He also has a nice introduction to the Kinect and his library on [youtube](https://www.youtube.com/watch?v=QmVNgdapJJM) + you can take a look at the source code for the project on the [_OpenKinect for Processing_ library Github page](https://github.com/shiffman/OpenKinect-for-Processing).

### kinect examples
In order to run these examples, you'll need to download the OpenKinect for Processing library (`Sketch > Import Library... > Add Library...` search for `"Open Kinect"` and install `Open Kinect for Processing`).  Please look through the examples that are installed with the library (see `documents/Processing/libraries/openkinect_processing/examples/Kinect_v1`). We'll be using this library for all of the Kinect V1 and V2 examples. _Note: we'll also be using the optical flow class that i adapted from [Hidetoshi Shimodaira's open processing sketch](https://www.openprocessing.org/sketch/10435/) HOWEVER, the class isn't exactly the same in this new set of examples: this optical flow class been optimized for working with depth data._  

- Kinect camera + optical flow
  - [kinect optical flow](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/KINECT/DepthThresholdOpticalFlow)
  - [kinect optical flow + boid emit](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/KINECT/BoidEmit_DepthThresholdOpticalFlow) 

- Kinect point clouds
  - [kinect point cloud + agents (a simplified unnamed sound sculpture)](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/KINECT/PointCloud_AgentSystem)

---
Shiffman's _Getting Started with Kinect and Processing_ also mentions another kinect library SDK port called _SimpleOpenNI_. As far as I can tell, the original SimpleOpenNI only worked with Processing 1 and 2. However, last semester, one of the students in 288 (thanks jay!) found an updated version of the library: [SimpleOpenNI for Processing 3](https://github.com/totovr/SimpleOpenNI) by Antonio Vega.  The update looks pretty promising and even seems to have skeletal tracking working:

![skeletal tracking in processing 3](https://github.com/totovr/SimpleOpenNI/raw/master/Assets/Kinect_V2_Tracking.gif)  
<sup>skeletal tracking in processing 3 via Antonio Vega's port of [SimpleOpenNI](https://github.com/totovr/SimpleOpenNI)</sup>

## leap motion (2013)
![leap motion](https://www.ultraleap.com/LMC/new/lmc_03.jpg)  
<sup>^ [Leap Motion controller](https://www.ultraleap.com/product/leap-motion-controller/)</sup>

The Kinect V1 sensor inspired a number of other 3D sensors.  In 2013, Leap Motion (now Ultraleap) released a 3D sensor that could be placed on your desktop to read 3D hand gestures.  It's a pretty cool little device that (unlike the other 3D sensors we're looking at) uses stereo cameras to identify hand poses. Darius Morawiec (aka [nok](https://github.com/nok)) has ported the [Leap Motion for Processing](https://github.com/nok/leap-motion-processing), which can be installed via the supported libraries: (`Sketch > Import Library... > Add Library...` search for `"Leap"` and install `Leap Motion for Processing`).

Note: you must also be running the [Leap Motion Software](https://developer.leapmotion.com/setup/desktop) on your computer.

## kinect V2 (2014)
![kinect v2 (xbox one)](https://lh3.googleusercontent.com/proxy/Bqk19JO_BAjkRPT6iBZovdH5u-iBYuAiRoiLJwyvGhzdmJ-TrnpYNi4LinUMC86a9UM06oka0o2uT4VONuqnp31c_OmEF8bXJc04LbOSjnmDqkufyiAk0qhNutYV7_C3_ZTeGfhgheJq7watd6jtaUQve1TkEkOwa6CdVRcou-8AHXuJug)  
<sup>^ kinect v2 (xbox one)</sup>

In 2014, Microsoft released a new version of the Kinect that utilizes time-of-flight (_ToF_ = how long it takes for emitted light from the camera to travel to an object in the environment and back to a sensor in the camera) to calculate depth. It also has a much higher sensing resolution of 1920x1080px (vs the original 640x480px).

My Kinect V1 examples still need to be ported to the V2.  Shiffman + Thomas Sanchez's _OpenKinect for Processing_ library also works with the Kinect V2, so all that _should_ need to change in the code examples is: 

`import org.openkinect.freenect.*;` --> `[remove line]`  
`import org.openkinect.processing.*;` --> `import org.openkinect.processing.*;`  

`Kinect kinect;` --> `Kinect2 kinect2;`  
`kinect = new Kinect(this);` --> `kinect2 = new Kinect2(this);`  
`kinect2.initDepth();` --> `kinect2.initDepth();`
`                    ` --> `kinect2.initDevice();`

`kinect.width` --> `kinect2.depthWidth`
`kinect.height` --> `kinect2.depthHeight`
  
## kinect azure (2019)
![kinect azure (v3)](https://azurecomcdn.azureedge.net/cvt-33e25af8f7bf9bbdddccd99f7064830e91d5c0fbb67840a325b850e6bf267127/images/page/services/azure-kinect-dk/whats-inside.jpg)  
<sup>^ kinect azure (v3). From the tech spces: _1) 1-MP depth sensor with wide and narrow field-of-view (FOV) options that help you optimize for your application, 2) 7-microphone array for far-field speech and sound capture, 3) 12-MP RGB video camera for an additional color stream that’s aligned to the depth stream, 4) Accelerometer and gyroscope (IMU) for sensor orientation and spatial tracking, 5) External sync pins to easily synchronize sensor streams from multiple Kinect devices_</sup>

The latest iteration of the Microsoft Kinect is the Azure.  I haven't gotten my hands on one yet, but it looks pretty incredible... [Azure Kinect DK (released 2019)](https://azure.microsoft.com/en-us/services/kinect-dk/)
  
## intel realsense (2019)
![intel realsense](https://www.intel.com/content/dam/www/public/us/en/images/product/16x9/d435-realsense-camera-16x9.png.rendition.intel.web.480.270.png)   
<sup>^ [Intel RealSense Depth Camera](https://www.intelrealsense.com/stereo-depth/)</sup>

There's a really exciting new line of small, USB-powered 3D sensors from Intel called the RealSense.  Florian Bruggisser (aka [cansik](https://github.com/cansik)) has ported the [RealSense SDK to Processing](https://github.com/cansik/realsense-processing), which can be installed via the supported libraries: (`Sketch > Import Library... > Add Library...` search for `"RealSense"` and install `Intel RealSense for Processing`).

## iPhone X (2017) + the standard cyborg _capture_ iOS app (2018)
![apple iphonex 3d sensor](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/apple_iphoneX_3Dsensor.png)  
<sup> ^ apple iPhone X 3D sensor for faceID, custom emojis, instagram filters...</sup>

3D sensors are becoming more and more ubiquitous -- if you have an iPhone X or 11, it has a front facing 3D sensor that Apple uses for FaceID, personalized emojis, instagram filters, portraits, etc. The developer kit allows access to the 3D data, and few companies have created applications that can generate point clouds of objects using the sensor.  I've been working with [standard cyborg's _capture_ iOS app](https://apps.apple.com/us/app/capture-3d-scan-anything/id1444183458) and have been really happy with it: it's free for basic use, does a really great job producing a single model from the multiple scan angles (optionally at different resolutions in the settings), and they have really great web integration so you can transfer your scans to the cloud and download them as PLY files.

Last class, the [flamingo example](https://github.com/johnbcarpenter/USC_IML404/blob/master/notes_md/datavis-csv-transform-sound.md#loading-csvs-using-loadtable) data file was generated using the app:

![flamingo scan using standard cyborg's capture](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/FlamingoScan.png)  
<sup> ^ (jellycat cordy roy) flamingo scan using [standard cyborg's iOS *capture* app](https://www.standardcyborg.com/products/)</sup>

In class today, we're going to: 
- install [standard cyborg's _capture_ iOS app](https://apps.apple.com/us/app/capture-3d-scan-anything/id1444183458)
- generate a 3D model using the iPhone 3D sensor
- save the model to the cloud and download a ply 
- convert the ply -> csv
- apply shaders to the point cloud


