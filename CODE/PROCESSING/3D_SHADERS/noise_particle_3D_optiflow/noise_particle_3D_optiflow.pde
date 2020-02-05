import processing.video.*;

ShimodairaOpticalFlow SOF;

// moving particles with perlin noise
Particle [] particles;

void setup() {
  size (1280, 720, P3D);

  // OPTICAL FLOW SETUP
  String[] cameras = Capture.list();
  if (cameras.length == 0) {
    println("There are no cameras available for capture. Exiting application");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    Capture cam = new Capture(this, width, height, cameras[0]);
    cam.start();

    SOF = new ShimodairaOpticalFlow(cam);
  }

  // PARTICLES
  particles = new Particle [75];

  PVector starting_vect = new PVector(width*0.5, height*0.5);
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle(starting_vect);
  }
}

void draw() {
  background(255);
  
  // RUN / DRAW THE OPTICAL FLOW CALCULATIONS
  // draw image
  if (SOF.flagimage) set(0, 0, SOF.cam);
  else background(120);

  // calculate optical flow
  SOF.calculateFlow(); 

  // draw the optical flow vectors
  if (SOF.flagflow)
    SOF.drawFlow();

  for (int i = 0; i < particles.length; i++) {
    // lookup optical flow and add it to the particle's velocity
    PVector flow_vect = SOF.lookup(particles[i].position);
    particles[i].velocity.add(flow_vect);
    
    particles[i].update();
    particles[i].drawSelf();
  }
}

void keyPressed() {
  //if (key=='w') SOF.flagseg=!SOF.flagseg; // segmentation on/off
  if (key=='m') SOF.flagmirror=!SOF.flagmirror; // mirror on/off
  else if (key=='i') SOF.flagimage=!SOF.flagimage; // show video on/off
  else if (key=='f') SOF.flagflow=!SOF.flagflow; // show opticalflow on/off
}
