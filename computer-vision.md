# IML404 // Tangible + Spatial Computing // USC MA+P S19   

![oblong seismo](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/seismo-gesture.gif)  
^^^hantenna pipeline for gesture recognition at oblong industries (C++/g-speak)

this course assumes you have a basic understanding of programming and writing code (eg some experience in Processing, Arduino, Java, C#/Unity, C++, JavaScript or similar). if you'd like to brush up on the foundations for this course, consider reviewing Casey Reas and Ben Fry's introduction to programming [Make: Getting Started with Processing](http://shop.oreilly.com/product/0636920000570.do). if you've written code before, but are new to processing, check out Daniel Shiffman's fantastic one hour tutorial / introduction to processing: [Hello Processing](http://hello.processing.org) and the [processing website](http://processing.org).

## computer vision in processing
in short, in this sectino we're going to use your computer's RGB (web) camera to interact with a processing sketch (aka your computer).  daniel shiffman has a really nice discussion and introduction to computer vision [here](https://www.youtube.com/watch?v=h8tk0hmWB44).

the fantastic library that we'll be using for things like face tracking, brightest point tracking, and frame differencing is [OpenCV for Processing by Greg Borenstein](https://github.com/atduskgreg/opencv-processing).

and we'll also use an optical flow class that i adapted from an [open processing sketch](https://www.openprocessing.org/sketch/10435/) originally posted by [Hidetoshi Shimodaira](https://vimeo.com/12629933).

### RGB camera examples
in order to run these examples, you'll need to download the processing video and OpenCV libraries (`Sketch > Import Library... > Add Library...` search for "video" and install `Video | GStreamer-based...`, then search for OpenCV and install `OpenCV for Processing`).  now you can downlaod and run the following:

- [web cam example (processing documentation)](https://github.com/johnbcarpenter/USC_IML404/tree/master/RGB_CAMERA/Webcam)
- [face detection example (using OpenCV for processing)](https://github.com/johnbcarpenter/USC_IML404/tree/master/RGB_CAMERA/FaceDetection)
- [face contours (using OpenCV for processing)](https://github.com/johnbcarpenter/USC_IML404/tree/master/RGB_CAMERA/ContourUpdate)

![pixel shift / face diff](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/face-diff.png)

- [pixel shift face contours (using OpenCV for processing)](https://github.com/johnbcarpenter/USC_IML404/tree/master/RGB_CAMERA/ContourUpdateDistort)
- [face differences (using OpenCV for processing)](https://github.com/johnbcarpenter/USC_IML404/tree/master/RGB_CAMERA/FaceDiff)

![simple pixel sorting](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/pixel-sort.png)

- [simple pixel sorting / distortion](https://github.com/johnbcarpenter/USC_IML404/tree/master/RGB_CAMERA/WebcamReordering_01)
  
### RGB camera + optical flow

![optical flow](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/optical-flow.png)

- [optical flow (implementation by Shimodaira)](https://github.com/johnbcarpenter/USC_IML404/tree/master/RGB_CAMERA/OpticalFlow)

### RGB camera + optical flow + agent-based systems
- [Shiffman flocking + Shimodaira optical flow](https://github.com/johnbcarpenter/USC_IML404/tree/master/AGENTS/Flocking_OpticalFlow) 

![optical flow + boid emitting](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/boid-flow.png)

- [Shimodaira optical flow + boid emitting](https://github.com/johnbcarpenter/USC_IML404/tree/master/AGENTS/BoidEmit_OpticalFlow)  
  
## background notes on shiffman and agent-based systems (eg flocking)  
if you're new to agent-based systems, daniel shiffman has a great introduction to the agents in the [_nature of code_](http://natureofcode.com/book/chapter-6-autonomous-agents/) / [video](https://vimeo.com/63928274), so please check them out if you'd like a more in depth look at how they work in processing.  

here are some links to the original flocking code by Shiffman (which are in turn adaptations of work done by [Craig Reynolds](https://www.red3d.com/cwr/papers/1987/boids.html)):  
- [Shiffman's flocking example](https://github.com/shiffman/The-Nature-of-Code-Examples/tree/master/chp06_agents/NOC_6_09_Flocking)  
- [Shiffman's flocking example + mouse following](https://github.com/shiffman/The-Nature-of-Code-Examples/tree/master/chp06_agents/NOC_6_09_FlockingMouse)  
