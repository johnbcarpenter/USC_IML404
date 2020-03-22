# IML404 // Tangible + Spatial Computing // USC MA+P S19   

![teachable machine](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/ML_TM2.png)  
<sup>^ Google's Teachable Machine 2 </sup>

## google creative lab's teachable machine 2 
I learned about Google Creative Lab's _Teachable Machine 2_ from an awesome Daniel Shiffman tutorial where he demo's _image_ and _sound classification_, so that's probably the best place to go for a background and walkthrough of some of the ideas we'll cover today: [Coding Train: Teachable Machine](https://thecodingtrain.com/TeachableMachine/index.html)

For this class, we're going to train an image classification model with teachable machine 2, and then use the model with a Processing or P5JS sketch.

The first thing to do is visit [Google's Teachable Machine 2 site](https://teachablemachine.withgoogle.com), where we'll _gather_, _train_, and _export_ an image classification model for our use with Processing.
- using Chrome, open [https://teachablemachine.withgoogle.com](https://teachablemachine.withgoogle.com)
- click "Get Started"
- select "Image Project"

Name Classes and Create a set of Image Samples 
- gather a couple interesting distinct visuals to train your system with (eg a stuffed animal, guitar)
- rename _Class 1_ to something more descriptive for 1 of your items (eg _guitar_)
![teachable machine](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/ML_TM2_step02.png)  
- select "Webcam", allow “teachablemachine.withgoogle.com” to use your camera, and _Hold to record_ a variety of perspectives on your object
- repeat the previous two steps for another object (eg _unicorn_)
![teachable machine](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/ML_TM2_step03.png)  
- click on _+ Add a class_ and add a _default_ class
![teachable machine](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/ML_TM2_step04.png)  

Training
- click on _Train model_ (make sure to leave the window open, don't switch tabs while training!)
![teachable machine](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/ML_TM2_step05.png)  

Preview
- test the image classifier model
![teachable machine](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/ML_TM2_step06.png)  

Export the model
- click on _Export Model_ for use with our Processing sketch
- select _Tensorflow.js_, _Upload (shareable link)_ and click _Upload model_ Note: the original images don't get uploaded, just the model (aka the algorithm)
- copy your _sharable link_ (don't close the export window yet...)

## Working with a TensorFlow model in P5JS / Processing
_via P5JS + a simplified code snippet_
- open [https://editor.p5js.org/johnbcarpenter/sketches/pYtQxPuYu](https://editor.p5js.org/johnbcarpenter/sketches/pYtQxPuYu)
- update line 7 `let imageModelURL = 'https://teachablemachine.withgoogle.com/models/l3RNjZHm/';` to your model URL
- run the sketch!

![teachable machine](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/ML_TM2_step07.png)  

_via the P5JS google code snippet_
- scroll down to _Code snippets to use your model:_ and select the _p5.js_ tab
- select _Open up the code snippet below directly in the p5.js Web Editor_
- update line 3 `let imageModelURL = 'https://teachablemachine.withgoogle.com/models/l3RNjZHm/';` to your model URL
- run the sketch!

<sup>Note: you can also download your TensorFlow model and run P5JS locally </sup>

We're using P5JS (as Shiffman did) because it's the most straightforward way to work with your TensorFlow model, but it looks like it's also possible to get this [running in Processing via the Java Binding](http://www.magicandlove.com/blog/2017/04/14/tensorflow-in-processing/).

