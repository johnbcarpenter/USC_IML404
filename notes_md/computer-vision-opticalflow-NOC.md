# IML404 // Computer Vision: Optical Flow + Agent-Based Systems

![optical flow --> agents](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/dandelion.gif)  
<sup>^ [_dandelion clock_ (2011)](http://www.johnbcarpenter.com/artworks/dandelion_clock/index.html)</sup>

## agent-based systems 
let's start by looking at a couple agent-based system from daniel shiffman's nature of code. we'll walk through these examples  in class, but daniel shiffman has a great introduction to this topic in the [Nature of Code: Chapter 6. Autonomous Agents](http://natureofcode.com/book/chapter-6-autonomous-agents/) // [github code source](https://github.com/nature-of-code/noc-examples-processing/tree/master/chp06_agents) + he also covers the material on his [youtube channel](https://www.youtube.com/watch?v=JIz2L4tn5kM).

so what is an _agent-based system_? they're typically a group of objects (aka instances of a class) that exist in a scene and function according to a given set of _their own_ rules or behaviors (that are defined in the class methods). in other words, they are able to function on their own in an environment, and they can even respond to their surroundings and/or other agents. i like to use agent-based systems in my work because they can be an interesting foundation (medium) to explore of natural systems and emergent behaviors/patterns.

Several of the examples that Shiffman covers are adaptations of Craig Reynolds' work (as he references in his code). There is a fantastic paper on his work with boids here: [Flocks, Herds, and Schools:
A Distributed Behavioral Model](https://www.red3d.com/cwr/papers/1987/boids.html). if you're interested in this topic, another classic book worth checking out is [Turtles, Termites, and Traffic Jams: Explorations in Massively Parallel Microworlds By Mitchel Resnick](https://mitpress.mit.edu/books/turtles-termites-and-traffic-jams)


- [flowfields (Shiffman NOC github)](https://github.com/nature-of-code/noc-examples-processing/tree/master/chp06_agents/NOC_6_04_Flowfield)
- [flocking (Shiffman NOC github)](https://github.com/nature-of-code/noc-examples-processing/tree/master/chp06_agents/NOC_6_09_Flocking)

to get started interacting with one of these systems, let's create a simple [mouse interaction with the flocking boids](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/AGENTS/NOC_6_09_FlockingMouse) (agents are pulled towards the mouse at < 100 pixels)

## optical flow (via an RGB camera) --> agent-based systems
we're also going to look at how we can interact with agent-based systems using methods other than the mouse, so we'll be connecting the optical flow work we did in the [previous class](https://github.com/johnbcarpenter/USC_IML404/blob/master/notes_md/computer-vision-opticalflow.md) to some of the shiffman NOC examples that we're looking at today.  in short, we can create a simple way to interact with agents in our system by having force vectors from our optical flow readings move the agents around -- and this interactivity is really exciting because 1) it's a cool way to engage with your software and opens up a bunch of opportunities for interactive work, and 2) we're generating competing forces that drive the agents (their own behaviors + our influence on them) which can result in new,  unpredictable behaviors.

### code examples
![optical flow screen capture](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/optical-flow-apple-orange.png)
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
