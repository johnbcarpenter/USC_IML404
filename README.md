# USC_IML404
USC IML 404 class code (NOTE: NOT LIVE YET) (http://usc.oblong.com)

[syllabus](https://github.com/johnbcarpenter/USC_IML404/tree/master/IML404_syllabus_FALL2017.pdf)

this is a repository for storing code we work on in class. the starting point for much of this code is based on examples made by the processing community: please see comments in the code for the credits.

if you're brand new to processing, or it's been a little while since you've written code, check out daniel shiffman's fantastic one hour tutorial / introduction to processing: [Hello Processing](http://hello.processing.org)

## week 1

we'll start off the processing portion of the class with a very brief review of Casey Reas and Ben Fry's great book [Make: Getting Started with Processing](http://shop.oreilly.com/product/0636920000570.do). 

we'll end up at classes and arrays as much of our work in this class will depend on them:

- [bouncy ball class + array example](https://github.com/johnbcarpenter/USC_IML404/tree/master/AGENTS/bouncy_balls)

and then explore agent-based systems.  daniel shiffman has a great introduction to the topic here: [http://natureofcode.com/book/chapter-6-autonomous-agents/](http://natureofcode.com/book/chapter-6-autonomous-agents/) and even has a video for it [https://vimeo.com/63928274](https://vimeo.com/63928274), so please check them out if you'd like a more in depth look at how agent-based systems work. 

- [Shiffman's flocking example](https://github.com/shiffman/The-Nature-of-Code-Examples/tree/master/chp06_agents/NOC_6_09_Flocking)
- [Shiffman's flocking example Casey Reas style](https://github.com/johnbcarpenter/USC_IML404/tree/master/AGENTS/NOC_6_09_Flocking_Reas)

## week 2

ok, let's do some computer vision work... we'll start with the webcam in your computers to try out face detection and optical flow.  download the processing video and OpenCV libraries (`Sketch > Import Library... > Add Library...` search for "video" and install `Video | GStreamer-based...`, then search for OpenCV and install `OpenCV for Processing`).  now you can run the following examples: 

- [web cam example (processing documentation)](https://github.com/johnbcarpenter/USC_IML404/tree/master/RGB_CAMERA/Webcam)
- [face detection example (using OpenCV for processing)](https://github.com/johnbcarpenter/USC_IML404/tree/master/RGB_CAMERA/FaceDetection)
- [face contours (using OpenCV for processing)](https://github.com/johnbcarpenter/USC_IML404/tree/master/RGB_CAMERA/ContourUpdate)
- [pixel shift face contours (using OpenCV for processing)](https://github.com/johnbcarpenter/USC_IML404/tree/master/RGB_CAMERA/ContourUpdateDistort)
- [face differences (using OpenCV for processing)](https://github.com/johnbcarpenter/USC_IML404/tree/master/RGB_CAMERA/FaceDiff)

let's continue working with the RGB camera with optical flow

- [optical flow example](https://github.com/johnbcarpenter/USC_IML404/tree/master/RGB_CAMERA/OpticalFlow)

and we'll also explore using optical flow with agent-based systems with the RGB camera. 

- [Shiffman flocking + Shimodaira Optical Flow](https://github.com/johnbcarpenter/USC_IML404/tree/master/AGENTS/Flocking_OpticalFlow)
- [Shiffman flocking + Shimodaira Optical Flow + Boid Emitting](https://github.com/johnbcarpenter/USC_IML404/tree/master/AGENTS/BoidEmit_OpticalFlow)

## week 3

we'll explore the microsoft kinect as a way to generate 3D point clouds and depth images. daniel shiffman has a great introduction to the kinect here: [http://shiffman.net/p5/kinect/](http://shiffman.net/p5/kinect/), so please check it out if you'd like some additional information on working with the kinect.

to start off, download shiffman's Open Kinect Library (`Sketch > Import Library... > install Library...` search for "kinect" and add `Open Kinect for Processing`).  now in `File > Examples... > Contributed Libraries > OpenKinect for Processing > Kinect_v1` we'll look at 

- [Point Cloud (via shiffman on github)](https://github.com/shiffman/OpenKinect-for-Processing/tree/master/OpenKinect-Processing/examples/Kinect_v1/PointCloud)
- [Average Point Tracking (via shiffman on github)](https://github.com/shiffman/OpenKinect-for-Processing/tree/master/OpenKinect-Processing/examples/Kinect_v1/AveragePointTracking)
- [Depth Threshold (via shiffman on github)](https://github.com/shiffman/OpenKinect-for-Processing/tree/master/OpenKinect-Processing/examples/Kinect_v1/DepthThreshold)
- [Shiffman Depth Filtering + Shimodaira Optical Flow](https://github.com/johnbcarpenter/USC_IML404/tree/master/KINECT/DepthThresholdOpticalFlow)
- [Shiffman kinect v1 point cloud + an agent based system](https://github.com/johnbcarpenter/USC_IML404/tree/master/KINECT/PointCloud_AgentSystem)

## week 4 -- PROCESSING PROPOSAL DUE 

send a couple sentence email to pete and i outlining your processing project.  feel free to include an image or link(s) for reference to imagery, libraries, etc.

## week 5 -- PROCESSING PROJECT DUE / IN CLASS REVIEW 

use a RGB camera or a 3D sensor (the kinect) as an input device for your own art / design work. ideally, you'll upon our work in class with open cv, optical flow and/or agent–based systems, but feel free to discuss other sensors you can use with us (e.g. maybe you'd prefer to work with audio).

## week 6 -- DOCUMENTATION DUE BEFORE CLASS 09/26/2017.  PLEASE TURN IN A FOLDER WITH :

- your source code (zipped root folder with all assets)
- a txt document with your work's title and one or two sentences about the project 
- single representative photo / screen capture, 1920x1080px or 960x540px. if your had many iterations of your project that you liked, you optionally can turn in a folder with multiple images.
- 30s to 2m video documentation... ~720p. feel free to use screen capture (quicktime player... new screen recording) and / or camera footage (e.g. a camera pointed at you and the computer / projection screen). it's important to make sure you show someone interacting with your work via the camera / 3D sensor. keep in mind that most of the world will probably only see your work through documentation, so make it good! 
