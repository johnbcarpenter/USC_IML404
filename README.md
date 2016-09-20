# USC_IML404
USC IML 404 class code (http://usc.oblong.com)

this is a repository for storing code we work on in class. the starting point for much of this code is based on examples made by the processing community: please see comments in the code for the credits.

## week 4

week 4 we'll use the webcam in your computers to try out face detection and optical flow.  to start off, download the processing video and OpenCV libraries (`Sketch > Import Library... > Add Library...` search for "video" and install `Video | GStreamer-based...`, then search for OpenCV and install `OpenCV for Processing`).  now you can run the following examples: 

- [web cam example (processing documentation)](https://github.com/johnbcarpenter/USC_IML404/tree/master/20160913_week4/Webcam)
- [face detection example (using OpenCV for processing)](https://github.com/johnbcarpenter/USC_IML404/tree/master/20160913_week4/FaceDetection)
- [optical flow example](https://github.com/johnbcarpenter/USC_IML404/tree/master/20160913_week4/OpticalFlow)

## week 5

week 5 we'll explore the microsoft kinect as a way to generate 3D point clouds and depth images. daniel shiffman has a great introduction to the kinect here: [http://shiffman.net/p5/kinect/](http://shiffman.net/p5/kinect/), so please check it out if you'd like some additional information on working with the kinect.

to start off, download shiffman's Open Kinect Library (`Sketch > Import Library... > install Library...` search for "kinect" and add `Open Kinect for Processing`).  now in `File > Examples... > Contributed Libraries > OpenKinect for Processing > Kinect_v1` we'll look at 

- [Point Cloud (via shiffman on github)](https://github.com/shiffman/OpenKinect-for-Processing/tree/master/OpenKinect-Processing/examples/Kinect_v1/PointCloud)
- [Average Point Tracking (via shiffman on github)](https://github.com/shiffman/OpenKinect-for-Processing/tree/master/OpenKinect-Processing/examples/Kinect_v1/AveragePointTracking)
- [Depth Threshold (via shiffman on github)](https://github.com/shiffman/OpenKinect-for-Processing/tree/master/OpenKinect-Processing/examples/Kinect_v1/DepthThreshold)