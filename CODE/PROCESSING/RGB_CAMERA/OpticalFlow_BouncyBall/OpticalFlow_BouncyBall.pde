import processing.video.*;

ShimodairaOpticalFlow SOF;

BouncyBall [] bs; // declare the array of bouncy balls (called bs)

void setup() {
  size(1280, 720);

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

  bs = new BouncyBall[100]; // inititalize the bs array
  for (int i = 0; i < bs.length; i++) { // loops through the array
    bs[i] = new BouncyBall(); // initializes all 100 bouncy balls (populates)
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

  // pass optical flow vectors into the bouncy balls
  // BouncyBalls update and draw
  for (int i = 0; i < bs.length; i++) {
    // calc the current boid position
    PVector boid_position = bs[i].position.copy();
    // lookup the optical floe vect at that postition
    PVector flow_vect = SOF.lookup(boid_position);
    // add that optical flow vect to the velocity of the bouncyball
    bs[i].velocity.add(flow_vect);
    // vv older code update and draw
    bs[i].UpdateSelf();
    bs[i].DrawSelf();
  }
}

void keyPressed() {
  //if (key=='w') SOF.flagseg=!SOF.flagseg; // segmentation on/off
  if (key=='m') SOF.flagmirror=!SOF.flagmirror; // mirror on/off
  else if (key=='i') SOF.flagimage=!SOF.flagimage; // show video on/off
  else if (key=='f') SOF.flagflow=!SOF.flagflow; // show opticalflow on/off
}
