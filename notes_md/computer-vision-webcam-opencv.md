# IML404 // Computer Vision: Webcam + OpenCV

![oblong seismo](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/seismo-gesture.gif)  
<sup>^ hantenna pipeline for gesture recognition at oblong industries (C++/g-speak)</sup>

this course assumes you have a basic understanding of programming and writing code (eg some experience in Processing, Arduino, Java, C#/Unity, C++, JavaScript or similar). if you'd like to brush up on the foundations for this course, consider reviewing Casey Reas and Ben Fry's introduction to programming [Make: Getting Started with Processing](http://shop.oreilly.com/product/0636920000570.do). if you've written code before, but are new to processing, check out daniel shiffman's fantastic one hour tutorial / introduction to processing: [Hello Processing](http://hello.processing.org) and the [processing website](http://processing.org).

## computer vision in processing
we won't be using a visual pipeline quite as sophisticated as the one above, but we're going to use your computer's RGB (web) camera and a computer vision library to interact with your computer via a processing sketch.  daniel shiffman has a really nice discussion and introduction to computer vision [here](https://www.youtube.com/watch?v=h8tk0hmWB44).

the fantastic library that we'll be using for things like face tracking, brightest point tracking, and frame differencing is [OpenCV for Processing by Greg Borenstein](https://github.com/atduskgreg/opencv-processing), and we'll also use an optical flow class that i adapted from an [open processing sketch](https://www.openprocessing.org/sketch/10435/) by [Hidetoshi Shimodaira](https://vimeo.com/12629933).

### RGB camera examples
in order to run these examples, you'll need to download the processing video library (`Sketch > Import Library... > Add Library...` search for "video" and install `Video | GStreamer-based...`.  now you should be able to run the following example:

- [web cam example (processing documentation)](https://github.com/johnbcarpenter/USC_IML404/tree/master/RGB_CAMERA/Webcam)
- [image filters (processing documentation)](https://www.processing.org/reference/filter_.html)

### [OpenCV for Processing by Greg Borenstein](https://github.com/atduskgreg/opencv-processing)
~~in order to run these examples, you'll need to download the OpenCV library (`Sketch > Import Library... > Add Library...`  search for OpenCV and install `OpenCV for Processing`).
- after the library installs, you can find the examples in: `Documents/Processing/libraries/opencv_processing/examples`
- [webcam face detection example (using OpenCV for processing)](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/RGB_CAMERA/FaceDetection)
- [webcam face contour lines with mouse input -> noise (using OpenCV for processing)](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/RGB_CAMERA/ContourUpdateDistort)

![face diff](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/national-reas.png)  ~~
Unfortunately this doesn't run with the latest version of processing, and the last time the repo was updated was 9+ years ago... (so it's probably not coming back).  This is still a nice example...
<sup>^[_the day i die_ by the national (youtube link)](https://www.youtube.com/watch?v=GwZvip416NU) //
the video by casey reas uses a similar effect to the FaceDiff sketch</sup>

- [face differences w keypress (using OpenCV for processing)](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/RGB_CAMERA/FaceDiff)

## shiffman on computer vision
- [shiffman intro to CV (youtube)](https://www.youtube.com/watch?v=h8tk0hmWB44)
- [shiffman on blob detection / color tracking (youtube)](https://www.youtube.com/watch?v=ce-2l2wRqO8) // [code (github)](https://github.com/CodingTrain/website/tree/3640cedf9f696402fafe51dae4de998a1ab3ef17/Tutorials/Processing/11_video)

## past student work

![ghostly shapes (spring 2017)](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/ghostly-shapes-spring17.gif)  
<sup>^ _ghostly shapes_ (spring 2017) by mark vrahas // [full youtube documentation](https://www.youtube.com/watch?v=6qYEf4AhuUI)</sup>

![sylivie howton (spring 2019)](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/sylvie-howton-obfuscator-2019.gif)  
<sup>^ _obfuscator_ (spring 2019) by sylivie howton</sup>

![eumin lee (spring 2019)](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/eumin-lee-iridescence-2019.gif)  
<sup>^ _iridescence_ (spring 2019) by eumin lee</sup>

![neon dancer (spring 2017)](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/neon-dancer-spring17.gif)  
<sup>^ _neon dancer_ (spring 2017) by grant lee // [full vimeo documentation](https://vimeo.com/207423025)</sup>
