# IML404 // Tangible + Spatial Computing // USC MA+P S19   
## computer vision in processing
this course assumes you have a basic understanding of programming and writing code (eg some experience in Processing, Arduino, Java, C#/Unity, C++, JavaScript or similar). if you'd like to brush up on the foundations for this course, consider reviewing Casey Reas and Ben Fry's introduction to programming [Make: Getting Started with Processing](http://shop.oreilly.com/product/0636920000570.do). if you've written code before, but are new to processing, check out Daniel Shiffman's fantastic one hour tutorial / introduction to processing: [Hello Processing](http://hello.processing.org) and the [processing website](http://processing.org).

### RGB camera examples
in order to run these examples, you'll need to download the processing video and OpenCV libraries (`Sketch > Import Library... > Add Library...` search for "video" and install `Video | GStreamer-based...`, then search for OpenCV and install `OpenCV for Processing`).  now you can downlaod and run the following:

- [web cam example (processing documentation)](https://github.com/johnbcarpenter/USC_IML404/tree/master/RGB_CAMERA/Webcam)
- [face detection example (using OpenCV for processing)](https://github.com/johnbcarpenter/USC_IML404/tree/master/RGB_CAMERA/FaceDetection)
- [face contours (using OpenCV for processing)](https://github.com/johnbcarpenter/USC_IML404/tree/master/RGB_CAMERA/ContourUpdate)
- [pixel shift face contours (using OpenCV for processing)](https://github.com/johnbcarpenter/USC_IML404/tree/master/RGB_CAMERA/ContourUpdateDistort)
- [face differences (using OpenCV for processing)](https://github.com/johnbcarpenter/USC_IML404/tree/master/RGB_CAMERA/FaceDiff)
- [simple pixel sorting / distortion](https://github.com/johnbcarpenter/USC_IML404/tree/master/RGB_CAMERA/WebcamReordering_01)
  
### RGB camera + optical flow
- [optical flow (implementation by Shimodaira)](https://github.com/johnbcarpenter/USC_IML404/tree/master/RGB_CAMERA/OpticalFlow)

### RGB camera + optical flow + agent-based systems
- [Shiffman flocking + Shimodaira optical flow](https://github.com/johnbcarpenter/USC_IML404/tree/master/AGENTS/Flocking_OpticalFlow)  
- [Shimodaira optical flow + boid emitting](https://github.com/johnbcarpenter/USC_IML404/tree/master/AGENTS/BoidEmit_OpticalFlow)  
  
## background notes on shiffman and agent-based systems (eg flocking)  
if you're new to agent-based systems, daniel shiffman has a great introduction to the agents in the [_nature of code_](http://natureofcode.com/book/chapter-6-autonomous-agents/) / [video](https://vimeo.com/63928274), so please check them out if you'd like a more in depth look at how they work in processing.  

here are some links to the original flocking code by Shiffman (which are in turn adaptations of work done by [Craig Reynolds](https://www.red3d.com/cwr/papers/1987/boids.html)):  
- [Shiffman's flocking example](https://github.com/shiffman/The-Nature-of-Code-Examples/tree/master/chp06_agents/NOC_6_09_Flocking)  
- [Shiffman's flocking example + mouse following](https://github.com/shiffman/The-Nature-of-Code-Examples/tree/master/chp06_agents/NOC_6_09_FlockingMouse)  
