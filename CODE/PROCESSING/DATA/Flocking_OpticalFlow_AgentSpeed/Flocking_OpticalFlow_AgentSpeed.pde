/* combination of shiffman's flocking example with shimodaira optical flow
 
 The Nature of Code, Chapter 06-09 (Agents)
 Daniel Shiffman, http://natureofcode.com
 */

import processing.video.*;

ShimodairaOpticalFlow SOF;
Flock flock;

void setup() {
  size(960, 540, P3D); // P3D RENDERER

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

  // FLOCKING SETUP
  flock = new Flock();
  // Add an initial set of boids into the system
  for (int i = 0; i < 200; i++) {
    Boid b = new Boid(width/2, height/2);
    flock.addBoid(b);
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

  // look up the optical flow (field) value based on the current boid location 
  for (Boid b : flock.boids) {
    PVector flow_vect = SOF.lookup(b.location);
    b.acceleration.add(flow_vect); //add the force to the acceleration
  }

  // RUN / DRAW THE FLOCKING CALCULATIONS
  flock.run();
}

void keyPressed() {
  //if (key=='w') SOF.flagseg=!SOF.flagseg; // segmentation on/off
  if (key=='m') SOF.flagmirror=!SOF.flagmirror; // mirror on/off
  else if (key=='i') SOF.flagimage=!SOF.flagimage; // show video on/off
  else if (key=='f') SOF.flagflow=!SOF.flagflow; // show opticalflow on/off
}

// Add a new boid into the System
//void mouseDragged() {
//  flock.addBoid(new Boid(mouseX,mouseY));
//}
