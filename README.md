# USC_IML404
USC IML 404 class code (http://usc.oblong.com)

this is a repository for storing code we work on in class. the starting point for much of this code is based on examples made by the processing community: please see comments in the code for the credits.

## week 4

we'll start off the processing portion of the class with a general review of code via Casey Reas and Ben Fry's great book [Make: Getting Started with Processing](http://shop.oreilly.com/product/0636920000570.do)

if you're still feeling a bit uneasy about the fundamentals of processing, check out daniel shiffman's fantastic one hour tutorial / introduction to processing: [Hello Processing](http://hello.processing.org)

ok, let's do some computer vision work... we'll start with the webcam in your computers to try out face detection and optical flow.  download the processing video and OpenCV libraries (`Sketch > Import Library... > Add Library...` search for "video" and install `Video | GStreamer-based...`, then search for OpenCV and install `OpenCV for Processing`).  now you can run the following examples: 

- [web cam example (processing documentation)](https://github.com/johnbcarpenter/USC_IML404/tree/master/20160913_week4/Webcam)
- [face detection example (using OpenCV for processing)](https://github.com/johnbcarpenter/USC_IML404/tree/master/20160913_week4/FaceDetection)
- [face contours (using OpenCV for processing)](https://github.com/johnbcarpenter/USC_IML404/tree/master/20160913_week4/ContourUpdate)
- [face differences (using OpenCV for processing)](https://github.com/johnbcarpenter/USC_IML404/tree/master/20160913_week4/FaceDiff)
- [optical flow example](https://github.com/johnbcarpenter/USC_IML404/tree/master/20160913_week4/OpticalFlow)

## week 5

week 5 we'll explore the microsoft kinect as a way to generate 3D point clouds and depth images. daniel shiffman has a great introduction to the kinect here: [http://shiffman.net/p5/kinect/](http://shiffman.net/p5/kinect/), so please check it out if you'd like some additional information on working with the kinect.

to start off, download shiffman's Open Kinect Library (`Sketch > Import Library... > install Library...` search for "kinect" and add `Open Kinect for Processing`).  now in `File > Examples... > Contributed Libraries > OpenKinect for Processing > Kinect_v1` we'll look at 

- [Point Cloud (via shiffman on github)](https://github.com/shiffman/OpenKinect-for-Processing/tree/master/OpenKinect-Processing/examples/Kinect_v1/PointCloud)
- [Average Point Tracking (via shiffman on github)](https://github.com/shiffman/OpenKinect-for-Processing/tree/master/OpenKinect-Processing/examples/Kinect_v1/AveragePointTracking)
- [Depth Threshold (via shiffman on github)](https://github.com/shiffman/OpenKinect-for-Processing/tree/master/OpenKinect-Processing/examples/Kinect_v1/DepthThreshold)
- [Shiffman Depth Filtering + Shimodaira Optical Flow](https://github.com/johnbcarpenter/USC_IML404/tree/master/20160920_week5/DepthThresholdOpticalFlow)

if there's time, we'll run through Casey Reas and Ben Fry's discussion of arrays and classes in [Make: Getting Started with Processing](http://shop.oreilly.com/product/0636920000570.do) to prep for weeks 6.
- [bouncy ball class + array example](https://github.com/johnbcarpenter/USC_IML404/tree/master/20160920_week5/bouncy_balls)

## week 6

week 6 we'll explore using agent-based systems with the RGB camera and the kinect. again, daniel shiffman has a great introduction to agent-based systems here: [http://natureofcode.com/book/chapter-6-autonomous-agents/](http://natureofcode.com/book/chapter-6-autonomous-agents/) and even has a video for it [https://vimeo.com/63928274](https://vimeo.com/63928274), so please check them out if you'd like a more in depth look at how agent-based systems work. i'll do a short intro in class as well.

- [Shiffman's flocking example](https://github.com/shiffman/The-Nature-of-Code-Examples/tree/master/chp06_agents/NOC_6_09_Flocking)
- [Shiffman's flocking example Casey Reas style](https://github.com/johnbcarpenter/USC_IML404/tree/master/20160927_week6/NOC_6_09_Flocking_Reas)
- [Shiffman flocking + Shimodaira Optical Flow](https://github.com/johnbcarpenter/USC_IML404/tree/master/20160927_week6/Flocking_OpticalFlow)
- [Shiffman flocking + Shimodaira Optical Flow + Boid Emitting](https://github.com/johnbcarpenter/USC_IML404/tree/master/20160927_week6/BoidEmit_OpticalFlow)
- [Shiffman kinect v1 point cloud + an agent based system](https://github.com/johnbcarpenter/USC_IML404/tree/master/20160927_week6/PointCloud_AgentSystem)

## week 7 -- PROCESSING PROJECT DUE (02/27/2017)

### use a RGB camera or a 3D sensor (the kinect) as an input device for your own art / design work. it's not a requirement, but consider using open cv, optical flow and/or agent–based systems work we covered in class.

PLEASE TURN IN A FOLDER WITH :
- your source code (zipped root folder with all assets)
- a txt document with your work's title and one or two sentences about the project 
- single representative photo / screen capture, 1920x1080px or 960x540px (or if your piece was process based = you ran a bunch of variations of you code to find the perfect version, you can (should) turn in a folder with multiple images)
- 30s to 2m video documentation... ~720p. feel free to use screen capture (quicktime player... new screen recording) and / or camera footage (eg a camera pointed at you and the computer / projection screen). it's important to make sure you show someone interacting with your work via the camera / 3D sensor. keep in mind that most of the world will probably only see your work through documentation, so make it good! 
