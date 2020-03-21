# IML404 // Tangible + Spatial Computing // USC MA+P S19   

![CNN apple watch](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/ANN_HelloWorld.png)  
<sup>^ _scribble mode_ on the apple watch (via convolutional neural networks) </sup>

## artifical neural networks (ANNs) 
Apple's _Scribble Mode_ is an ANN (more specifically a convolutional neural networks or CNN, which is a subclass of ANN) that some of you are probably familiar with. There's a pretty thorough article in **Apple's Machine Learning Journal** that discusses their approach to handwriting recognition: [_Real-Time Recognition of Handwritten Chinese Characters Spanning a Large Inventory of 30,000 Characters_](https://machinelearning.apple.com/2017/09/12/handwriting.html).
 
---

![ANN bio](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/ANN_bio.png)   
<sup>^ neurobiology parallels to ANNs </sup>

I am not an expert in artificial neural networks (ANN), but I find them and their parallels to neurobiology really fascinating.  

![Fried ANN diagram](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/ANN_FriedANN.png)  
<sup>^ ANN diagram by Charles Fried on Medium: [_Let’s code a Neural Network from scratch_](https://medium.com/typeme/lets-code-a-neural-network-from-scratch-part-1-24f0a30d7d62) </sup>

In short, ANNs are computing systems (that mimic neurobilogy), trained on datasets (they learn), that are able to process and recognize information (related to their training dataset).  We're discussing them in this class because 1) it's a really interesting technology that I think you should be aware of, and 2) artists are starting to work with ANNs...

Google's Deep Dream (created in 2015 via one of their engineers Alexander Mordvintsev) popularized the use of neural networks by artists. You can do some pretty interesting things like stylize a photo based on the technique of an artist, or visualize the CNN algroithms as they anylize an image.  If you'd like to try it out, you can create an account on [Google's Deep Dream Generator](https://deepdreamgenerator.com).

![google deep dream](https://b2h3x3f6.stackpathcdn.com/assets/landing/img/blend/horizontal/dd.jpg)  
<sup>^ google's deep dream transforms an image via convolutional neural network algorithms (image from google)</sup>

More recently, artists have been exploring generative adversarial networks (GANs) -- two neural networks that compete with each other to create a result that is statistically similar to a training set. 

![verge image](https://cdn.vox-cdn.com/thumbor/i06afh0TU9LaYDiLvjxRDwV1am4=/0x0:3049x2048/1820x1213/filters:focal(1333x1562:1819x2048):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/63058104/fake_ai_faces.0.png)  
<sup>^ [Verge article on ThisPersonDoesNotExist.com](https://www.theverge.com/tldr/2019/2/15/18226005/ai-generated-fake-people-portraits-thispersondoesnotexist-stylegan) </sup>

A more straightforward implementation of this technique is Philip Wang's [ThisPersonDoesNotExist.com](https://www.theverge.com/tldr/2019/2/15/18226005/ai-generated-fake-people-portraits-thispersondoesnotexist-stylegan) where the engineer trained the system on a bunch of faces, and is able to generate new faces that generally look human (even though they're not based on a real person).

![casey reas GAN](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/ANN_reas_GAN.png)  
<sup>^ _Making Pictures With Generative Adversarial Networks_ by Casey Reas </sup>

Here's a couple artists that are using GANs as a medium to produce their art (please let me know if there are others I should add to this list): 
- [studio international: _Casey Reas – interview_](https://www.studiointernational.com/index.php/casey-reas-interview-computer-art-coding)
- [art news: _Refik Anadol Trains AI to Dream of New York City_](https://www.artnews.com/art-in-america/features/refik-anadol-machine-hallucination-artechouse-shows-how-ai-dreams-60204/)
- [artnet: _Has Artificial Intelligence Brought Us the Next Great Art Movement?_](https://news.artnet.com/market/9-artists-artificial-intelligence-1384207).

## ANN in processing  
There's a fantastic Medium article by Charles Fried on ANNs, and how to build one in Processing: [Let’s code a Neural Network from scratch](https://medium.com/typeme/lets-code-a-neural-network-from-scratch-part-1-24f0a30d7d62).  His example is built and trained on the NMIST handwritten number data set.

![Charles Fried ANN tutorial](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/ANN_training.png)  
<sup>^ Charles Fried ANN tutorial in Processing: training with the number 5 </sup>

![Charles Fried ANN tutorial](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/ANN_5.png)  
<sup>^ Charles Fried ANN tutorial in Processing </sup>
 
I've very minorly updated his example for our class:
- [Charles Fried ANN tutorial in Processing](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/ARTIFICIAL_NEURAL_NETWORKS/Fried_ANN_tutorial)

  
