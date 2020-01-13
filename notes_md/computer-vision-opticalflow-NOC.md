# IML404 // Computer Vision: Optical Flow

![optical flow --> agents](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/dandelion.gif)  
<sup>^ [_dandelion clock_ (2011)](http://www.johnbcarpenter.com/artworks/dandelion_clock/index.html)</sup>

## RGB camera + optical flow + agent-based systems
in this lecture, we're going to combine our optical flow readings from the RGB camera with agent-based systems. an agent is an object (or instance) that functions according to a given set of behaviors defined in a class. we can create a simple way to interact with agents in our system by having force vectors from our optical flow readings move them around.

### background notes on shiffman and agent-based systems (eg flocking)
if you're new to agent-based systems, daniel shiffman has a great introduction to the agents in the [_nature of code_](http://natureofcode.com/book/chapter-6-autonomous-agents/) / [video](https://vimeo.com/63928274), so please check them out if you'd like a more in depth look at how they work in processing.

here are some links to the original flocking code by Shiffman (which are in turn adaptations of work done by [Craig Reynolds](https://www.red3d.com/cwr/papers/1987/boids.html)):
- [Shiffman's flocking example](https://github.com/shiffman/The-Nature-of-Code-Examples/tree/master/chp06_agents/NOC_6_09_Flocking)
- [Shiffman's flocking example + mouse following](https://github.com/shiffman/The-Nature-of-Code-Examples/tree/master/chp06_agents/NOC_6_09_FlockingMouse)

### code examples
- [control Shiffman flocking boids with Shimodaira optical flow](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/AGENTS/Flocking_OpticalFlow)

![optical flow + boid emitting screen capture](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/boid-flow.png)

- [Shimodaira optical flow + boid emitting](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/AGENTS/BoidEmit_OpticalFlow)

## past student work

![jerry tsui (spring 2019)](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/jerry-tsui-2019.gif)  
<sup>^ _untitled_ (spring 2019) by jerry tsui</sup>

![alex lee (spring 2019)](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/alex-lee-facial-shift-2019.gif)  
<sup>^ _facial shift_ (spring 2019) by alex lee</sup>

![tfwhollow (spring 2017)](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/tfwhollow-spring17.gif)  
<sup>^ _tfwhollow_ (spring 2017) by davis avila // [Deathless Gods with Human Bods](https://vimeo.com/207192583)</sup>
