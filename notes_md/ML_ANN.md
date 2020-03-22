# IML404 // Tangible + Spatial Computing // USC MA+P S19   

![CNN apple watch](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/ANN_HelloWorld.png)  
<sup>^ _scribble mode_ on the apple watch (via convolutional neural networks) </sup>

## artifical neural networks (ANNs) 
Apple's _Scribble Mode_ is a convolutional neural networks (a subclass of ANNs) that some of you are probably familiar with. There's a pretty thorough article in **Apple's Machine Learning Journal** that discusses their approach to handwriting recognition: [_Real-Time Recognition of Handwritten Chinese Characters Spanning a Large Inventory of 30,000 Characters_](https://machinelearning.apple.com/2017/09/12/handwriting.html).
 
---

I am not an expert on machine learning or artificial neural networks (ANN), but I find them and their parallels to neurobiology really fascinating...  

![ANN bio](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/ANN_bio.png)   
<sup>^ neurobiology parallels to ANNs </sup>

![Fried ANN diagram](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/ANN_FriedANN.png)  
<sup>^ ANN diagram by Charles Fried on Medium: [_Let’s code a Neural Network from scratch_](https://medium.com/typeme/lets-code-a-neural-network-from-scratch-part-1-24f0a30d7d62) </sup>

In short, ANNs are computing systems trained on datasets (they learn), that are able to process and recognize information related to their training dataset.  We're discussing them in this class because 1) it's a really interesting technology that I think you should be aware of, and 2) artists are starting to work with ANNs...

## ANNs in processing  
There's a fantastic Medium article by Charles Fried on how to build an ANN in Processing: [Let’s code a Neural Network from scratch](https://medium.com/typeme/lets-code-a-neural-network-from-scratch-part-1-24f0a30d7d62).  His example is built and trained on the NMIST handwritten number data set, and it will give us a chance to see how a system is trained, how connections are weighted, and how the system is tested.

![Charles Fried ANN tutorial](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/ANN_training.png)  
<sup>^ Charles Fried ANN tutorial in Processing: training with the number 5 </sup>

![Charles Fried ANN tutorial](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/ANN_5.png)  
<sup>^ Charles Fried ANN tutorial in Processing </sup>
 
I've very minorly updated his example for our class:
- [Charles Fried ANN tutorial in Processing](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/ARTIFICIAL_NEURAL_NETWORKS/Fried_ANN_tutorial)

## ANNs and the art world
![google deep dream](https://b2h3x3f6.stackpathcdn.com/assets/landing/img/blend/horizontal/dd.jpg)  
<sup>^ google's deep dream transforms an image via convolutional neural network algorithms (image from google)</sup>

Google's Deep Dream (created in 2015 via one of their engineers: Alexander Mordvintsev) helped to popularize the use of neural networks by artists. The software was designed to create dream-like images via _algorithmic pareidolia_:

> The software is designed to detect faces and other patterns in images, with the aim of automatically classifying images. However, once trained, the network can also be run in reverse, being asked to adjust the original image slightly so that a given output neuron (e.g. the one for faces or certain animals) yields a higher confidence score. This can be used for visualizations to understand the emergent structure of the neural network better, and is the basis for the DeepDream concept.  
<sup>^ [Wikipedia: DeepDream](https://en.wikipedia.org/wiki/DeepDream) </sup>

You can do some pretty interesting things with the current version of [Google's Deep Dream Generator](https://deepdreamgenerator.com). 

Note: Deep Dream is built on a _convolutional neural network_ (CNN), which is a deep learning subclass of ANNs -- differentiated by the use of convolutional layers, and a primary focus on computer vision/pixels.

## generative adversarial networks (GANs) 
Ian Goodfellow from the University of Montreal first described GANs in a [white paper from 2014](https://arxiv.org/abs/1406.2661) as

> a new framework for estimating generative models via an adversarial process, in which we simultaneously train two models: a generative model G that captures the data distribution, and a discriminative model D that estimates the probability that a sample came from the training data rather than G. The training procedure for G is to maximize the probability of D making a mistake. 

In short, there are two neural networks (a _generator_ and a _discriminator_) that compete with each other to create a result that is similar to a training set... the _generator_ and _discriminator_ go back and forth (via _Unsupervised Learning_) until they're able to create a product that's statistically identical to the training set.  Sumeet Agrawal has a nice [article on Medium that discusses GANs further](https://medium.com/archieai/a-dozen-times-artificial-intelligence-startled-the-world-eae5005153db). 

![casey reas GAN](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/ANN_reas_GAN.png)  
<sup>^ _Making Pictures With Generative Adversarial Networks_ by Casey Reas </sup>

Here's a very brief list of artists that are using GANs as a medium to produce new works of art (please let me know any others I should add to this list): 
- [studio international: _Casey Reas – interview_](https://www.studiointernational.com/index.php/casey-reas-interview-computer-art-coding)
- [art news: _Refik Anadol Trains AI to Dream of New York City_](https://www.artnews.com/art-in-america/features/refik-anadol-machine-hallucination-artechouse-shows-how-ai-dreams-60204/)
- [artnet: _Has Artificial Intelligence Brought Us the Next Great Art Movement?_](https://news.artnet.com/market/9-artists-artificial-intelligence-1384207).

