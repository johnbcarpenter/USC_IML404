/* combination of shiffman's flocking example with shimodaira optical flow

   The Nature of Code, Chapter 06-09 (Agents)
   Daniel Shiffman, http://natureofcode.com
*/

import processing.video.*;

ShimodairaOpticalFlow SOF;
Flock flock;

void setup() {
  size(960, 540);
  
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
    Boid b = new Boid(width/2,height/2);
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
  
  // run through the optical flow and apply the force vectors to nearby boids
  for (int i = 0; i < SOF.flows.size() - 2; i+=2) {
    PVector force_start = SOF.flows.get(i);
    PVector force_end = SOF.flows.get(i+1);
    PVector force_vector = PVector.sub(force_end, force_start);
    if (force_vector.mag() < 20.0) //ignore smaller force vectors
      continue;
      
    // normalize the force vector, then multiply it by some factor 
    force_vector.normalize().mult(3.0);
    
    // loop through the boids now
    for (Boid b : flock.boids) {
      // check distance btw the force_start and the boid
      if (PVector.dist(b.location, force_start) < 5) //if under a certain distance -- 5 pixels
        b.acceleration.add(force_vector); //add the force to the acceleration
      // NOTE: look for 2 changes in the boid class... search for "OPTICAL FLOW"
    }
  }
  
  // RUN / DRAW THE FLOCKING CALCULATIONS
  flock.run();
  
  // Instructions
  //fill(0);
  //text("Drag the mouse to generate new boids.",10,height-16);
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