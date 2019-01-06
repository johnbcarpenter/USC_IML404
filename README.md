# IML 404 -- Tangible and Spatial Computing // USC Media Arts and Practice
_Tangible and Spatial Computing_ is an examination of existing and emergent media technologies, focusing on creative and critical tactics for empowering you to explore the full potentials of software and hardware in your work.  
  
we will explore extended human computer interaction, including new forms of haptic, sonic and other sense modalities, through physical computing and spatial interfaces. instruction will draw heavily from both our careers as artists, and our roles as designers at [oblong industries](http://www.oblong.com)—an existing business designed to imagine workspaces of the near future.  the projects will focus on opening up and reshaping the way we approach, think about, understand, and work with technology.  
  
we'll be working with this repository to store and share the code that we work with in class. the starting point for many of these examples is based on fantastic work by the [processing](http://www.processing.org/) and [arduino](http://www.arduino.cc/) communities -- please see the course notes + comments in the code for the appropriate credits.  
  
**Instructors: [John Carpenter](http://johnbcarpenter.com)**  
**[Pete Hawkes](https://vimeo.com/petehawkes)**  
office hours: monday 3-4pm, 7pm+ in the SCIL lobby / conference room _by appointment_  

[syllabus](https://github.com/johnbcarpenter/USC_IML404/tree/master/IML404_syllabus_SPRING2019.pdf)

## week 1 (syllabus, teacher intros + computer vision in processing)
- [syllabus](https://github.com/johnbcarpenter/USC_IML404/tree/master/IML404_syllabus_SPRING2019.pdf) 
- teacher intros
- computer vision in processing:

if it's been a little while since you've written code, consider reviewing Casey Reas and Ben Fry's great book [Make: Getting Started with Processing](http://shop.oreilly.com/product/0636920000570.do). If you've written code before, but are new to processing, please check out Daniel Shiffman's fantastic one hour tutorial / introduction to processing: [Hello Processing](http://hello.processing.org)

- [web cam example (processing documentation)](https://github.com/johnbcarpenter/USC_IML404/tree/master/RGB_CAMERA/Webcam)
- [face detection example (using OpenCV for processing)](https://github.com/johnbcarpenter/USC_IML404/tree/master/RGB_CAMERA/FaceDetection)
- [face contours (using OpenCV for processing)](https://github.com/johnbcarpenter/USC_IML404/tree/master/RGB_CAMERA/ContourUpdate)
- [pixel shift face contours (using OpenCV for processing)](https://github.com/johnbcarpenter/USC_IML404/tree/master/RGB_CAMERA/ContourUpdateDistort)
- [face differences (using OpenCV for processing)](https://github.com/johnbcarpenter/USC_IML404/tree/master/RGB_CAMERA/FaceDiff)
- [simple pixel sorting / distortion](https://github.com/johnbcarpenter/USC_IML404/tree/master/RGB_CAMERA/WebcamReordering_01)
- [optical flow (implementation by Shimodaira)](https://github.com/johnbcarpenter/USC_IML404/tree/master/RGB_CAMERA/OpticalFlow)
  
let's explore using optical flow with the RGB camera and agent-based systems...  
- [Shiffman flocking + Shimodaira optical flow](https://github.com/johnbcarpenter/USC_IML404/tree/master/AGENTS/Flocking_OpticalFlow)  
- [Shimodaira optical flow + boid emitting](https://github.com/johnbcarpenter/USC_IML404/tree/master/AGENTS/BoidEmit_OpticalFlow)  
  
if you're new to agent-based systems in processing, daniel shiffman has a great introduction to the agents here: [http://natureofcode.com/book/chapter-6-autonomous-agents/](http://natureofcode.com/book/chapter-6-autonomous-agents/) and even has a video for it [https://vimeo.com/63928274](https://vimeo.com/63928274), so please check them out if you'd like a more in depth look at how OOP (object oriented programming) work in processing.  

here are some links to the original flocking code by Shiffman (which are in turn adaptations of work done by [Craig Reynolds](https://www.red3d.com/cwr/papers/1987/boids.html)):  
- [Shiffman's flocking example](https://github.com/shiffman/The-Nature-of-Code-Examples/tree/master/chp06_agents/NOC_6_09_Flocking)  
- [Shiffman's flocking example + mouse following](https://github.com/shiffman/The-Nature-of-Code-Examples/tree/master/chp06_agents/NOC_6_09_FlockingMouse)  


