// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Demonstration of Craig Reynolds' "Flocking" behavior
// See: http://www.red3d.com/cwr/
// Rules: Cohesion, Separation, Alignment

// Click mouse to add boids into the system

// let's see if we can create a set of rules 
// for creating a system similar to casey reas'
// process works from ~2005... eg http://reas.com/p10_s/

// PROCESS 404
// use reynold/shiffman's flocking algorithm to generate
// a sketch that draws lines between boids when they are
// within a certain distance of each other.  ramp the alpha 
// of the lines based on proximity

// hint: start by deactivating how the boids usually draw

Flock flock;

void setup() {
  size(1280,720);
  flock = new Flock();
  // Add an initial set of boids into the system
  for (int i = 0; i < 200; i++) {
    Boid b = new Boid(random(width), random(height));
    flock.addBoid(b);
  }
  background(255);
}

void draw() {
  //background(255); // <<< background refresh?
  fill(255,255,255,20);
  rect(0,0,width,height);
  flock.run();
  
  // Instructions
  //fill(0);
  //text("Drag the mouse to generate new boids.",10,height-16);
}

// Add a new boid into the System
void mouseDragged() {
  flock.addBoid(new Boid(mouseX,mouseY));
}