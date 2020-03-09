/* this example combines 
 
 Daniel Shiffman's Depth thresholding example
 https://github.com/shiffman/OpenKinect-for-Processing, http://shiffman.net/p5/kinect/
 (Original example by Elie Zananiri, http://www.silentlycrashing.net)
 
 with an adaptation of 
 
 Hidetoshi Shimodaira's Optical Flow sketch on OpenProcessing
 http://www.openprocessing.org/sketch/10435
 */



ShiffmanKinect SK;
ShimodairaOpticalFlow SOF;
Flock flock;

void setup() {
  size(512, 424, P3D);
  //fullScreen();

  SK = new ShiffmanKinect(this);
  SOF = new ShimodairaOpticalFlow(SK.depthImg.pixels, 
    SK.depthImg.width, 
    SK.depthImg.height);

  flock = new Flock();
}

void draw() {
  //blendMode(BLEND);
  background(0);
  //blendMode(ADD);

  //scale (2.5);
  SK.update();
  SK.drawDepth();

  // Update and draw the optical flow
  SOF.calculateFlow(SK.depthImg.pixels);
  if (SOF.flagflow) SOF.drawFlow();

  // run through the optical flow and apply the force vectors to nearby boids
  for (int i = 0; i < SOF.flows.size() - 2; i+=2) {
    PVector force_start = SOF.flows.get(i);
    PVector force_end = SOF.flows.get(i+1);
    PVector force_vector = PVector.sub(force_end, force_start);
    if (force_vector.mag() < 20.0 || force_vector.mag() > 21.0) //ignore smaller force vectors
      continue;

    // normalize the force vector, then multiply it by some factor 
    force_vector.normalize().mult(3.0);

    Boid new_b = new Boid(force_start.x, force_start.y);
    flock.addBoid(new_b);

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

  //fill(0);
  //text("TILT: " + angle, 10, 20);
  //text("THRESHOLD: [" + minDepth + ", " + maxDepth + "]", 10, 36);
}

// Adjust the angle and the depth threshold min and max
void keyPressed() {
  if (key == 'a') {
    SK.minDepth = constrain(SK.minDepth+10, 0, SK.maxDepth);
  } else if (key == 's') {
    SK.minDepth = constrain(SK.minDepth-10, 0, SK.maxDepth);
  } else if (key == 'z') {
    SK.maxDepth = constrain(SK.maxDepth+10, SK.minDepth, 2047);
  } else if (key =='x') {
    SK.maxDepth = constrain(SK.maxDepth-10, SK.minDepth, 2047);
  } 
}
