# IML404 // Datavis Intro: Pixels[] + Sound

I think it's common for people to think of data visualization as turning excel spreadsheets into charts and graphs (and we'll works with a few .csv files next week), but there's quite a bit of data available in some of the examples we've already worked with.  For example, in the first week of class we visualized optical flow vectors as lines with the line color and orientation  driven my the underlying algorithm (even the density of the lines is determined by the grid resolution).

![optical flow screen capture](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/optical-flow.png)  
<sup> ^ [optical flow class discussion](https://github.com/johnbcarpenter/USC_IML404/blob/master/notes_md/computer-vision-opticalflow.md)</sup>

Let's start off by building on the [CODE/PROCESSING/AGENTS/Flocking_OpticalFlow](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/AGENTS/Flocking_OpticalFlow) example to reveal how fast each boid is travelling.  An easy way to do this is to vary the triangle size based on each boid's velocity (the larger it is, the faster it's going).

![optical flow + agent speed screen capture](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/Flocking_OpticalFlow_AgentSpeed.png)  
<sup> ^ optical flow + agent speed</sup>  
- [OPTICAL FLOW + AGENT SPEED SIZE CLASS EXAMPLE](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/DATA/Flocking_OpticalFlow_AgentSpeed)  

## pixels[]
We've been working with the RGB camera for optical flow, but we can also do some interesting things with the *pixels[]* we're capturing.  To start off, please review Shiffman's discussion of [*Images and Pixels*](https://processing.org/tutorials/pixels/) on the Processing website. 

![shiffman image 2D to 3D](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/processing_org_2Dto3D_shiffman.png)  
<sup>^ [*Example: 2D image mapped to 3D* from the Processing website + *Learning Processing* by Daniel Shiffman](http://learningprocessing.com/examples/chp15/example-15-15-explode3D)</sup>

Let's take the above idea and apply it to your web camera:

![3DPixelFlowers](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/3DPixelFlowers.png)  
<sup> ^ 3DPixelFlowers: web cam video with brightness determinging the 3D pixel position </sup>  
- [RGB CAMERA BRIGHTNESS --> 3D](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/DATA/Webcam3DPixels)

## additional examples
Generate a random color for every hue, and replace that color in the captured pixels[], and offset of the hue index of the captured pixel every 1 second:

![simple pixel sorting](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/pixel-sort.png)  
<sup>^ [simple pixel sorting / distortion](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/DATA/WebcamReordering_01)</sup>

## sound
Discussion needs to be written up, but some starting examples are [here](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/SOUND)
