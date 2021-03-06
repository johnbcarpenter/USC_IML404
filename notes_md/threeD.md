## IML404: Working with 3D in Processing

![clematis study](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/noise-clematis-study.gif)    
<sup>^[instagram: _clematis_ study (2018)](https://www.instagram.com/p/BXCiraTlL2z/)</sup>

P3D is the 3D renderer for Processing, and it's implemented in your size call in setup:

     size(1280, 720, P3D);

There's a nice introduction for [working with P3D](https://processing.org/tutorials/p3d/) written by Daniel Shiffman on the Processing website that covers _3D Transformations_, _3D Shapes_, _Textures_, _Lighting_, _Perspective_, and the _Camera_ <-- please read through this.

![P3D coordinate system](https://processing.org/tutorials/p3d/imgs/coordinatesystem.png)  
<sup>^P3D coordinate system from [Processing](https://processing.org/tutorials/p3d/)</sup>
     
### Flowfield -> 3D + Optical Flow
![optical flow 3D](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/optical-flow-3D.gif)  
<sup>^[Flowfield -> 3D + Optical Flow](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/RGB_CAMERA/OpticalFlowEllipse3DGrid)</sup>  

We're going to start today by adapting our [Flowfield + Optical flow](https://github.com/johnbcarpenter/USC_IML404/blob/master/notes_md/computer-vision-opticalflow-NOC.md) example from last week into 3D...
- [Flowfield -> 3D + Optical Flow](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/RGB_CAMERA/OpticalFlowEllipse3DGrid)
- next steps: think about using this [Spinner class](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/3D_SHADERS/threeD_spinner_sphere) to get some new views of you 3D flowfield

![optical flow 3D cube](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/flowfield-cube.png)  
<sup>^for inspiration: [instagram: 3D Flowfield Cube (2019)](https://www.instagram.com/p/Bt6TwHUn8du/)</sup>  

### 3D Particle Emitter + Optical Flow
For this example, we'll create a particle system driven by perlin noise and interact with it via optical flow:

![perlin noise particle 3D](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/noise-particle-3D.gif)  
<sup>^[perlin noise particle 3D class example](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/3D_SHADERS/noise_particle_3D)</sup>

We'll look at: 
- [perlin noise](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/3D_SHADERS/noise) / [perlin noise with a particle](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/3D_SHADERS/noise_particle)
- [3D particle emitter (with perlin noise + trails)](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/3D_SHADERS/noise_particle_3D) // loosely based on [Shiffman's particle smoke example in the NOC](https://github.com/nature-of-code/noc-examples-processing/tree/master/chp04_systems/NOC_4_08_ParticleSystemSmoke)
- [3D particle emitter + Optical Flow](https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/3D_SHADERS/noise_particle_3D_optiflow)

### Agent-based flowfield example -> 3D
Now let's adapt the agent-based flow field NOC example into a system that runs in 3D:
- [Shiffman's flowfield example](https://github.com/nature-of-code/noc-examples-processing/tree/master/chp06_agents/NOC_6_04_Flowfield)
- If you want to challenge yourself, you can try working with [Shiffman's more dynamic flowfield noise example](https://github.com/nature-of-code/noc-examples-processing/tree/master/chp06_agents/Exercise_6_07_FlowField3DNoise)

We'll create an interactive, 3D version of it:
- Shiffman's flowfield noise example --> P3D using sinusoidal movement
- Shiffman's flowfield noise example --> P3D + Optical Flow


