import processing.video.*;

ShimodairaOpticalFlow SOF;

void setup () {
  size(960, 540);//, P3D);

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
}

void draw () {  
  // draw image
  if (SOF.flagimage) set(0, 0, SOF.cam);
  else background(120);

  // calculate optical flow
  SOF.calculateFlow(); 

  // draw the optical flow vectors
  if (SOF.flagflow)
    SOF.drawFlow();


  float active_area_sum = 0;
  stroke(255);
  noFill();
  rect(100, 100, 100, 100);

  // print out the optical flow (e.g. to use them with some other system)
  for (int i = 0; i < SOF.flows.size() - 2; i+=2) {
    PVector force_start = SOF.flows.get(i);
    PVector force_end = SOF.flows.get(i+1);
    //println ("force from " + force_start + " to " + force_end);

    PVector force = PVector.sub (force_end, force_start);
    float force_mag = force.mag()*0.1;

    if ((force_start.x > 100 && force_start.x < 200) &&
      (force_start.y > 100 && force_start.y < 200)) {
      active_area_sum += force_mag;
    }

    float heading = force.heading();
    float f = map (heading, 0, TWO_PI, 0, 255);
    fill (f);
    noStroke();
    ellipse (force_start.x, force_start.y, force_mag, force_mag);
  }
  //println(active_area_sum);
  if (active_area_sum > 10) {
    fill(255,0,0);
    rect(100, 100, 100, 100);
  }
}


void keyPressed() {
  //if (key=='w') SOF.flagseg=!SOF.flagseg; // segmentation on/off
  if (key=='m') SOF.flagmirror=!SOF.flagmirror; // mirror on/off
  else if (key=='i') SOF.flagimage=!SOF.flagimage; // show video on/off
  else if (key=='f') SOF.flagflow=!SOF.flagflow; // show opticalflow on/off
}
