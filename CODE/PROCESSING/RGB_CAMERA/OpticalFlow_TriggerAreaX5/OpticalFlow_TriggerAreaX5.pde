import processing.video.*;

ShimodairaOpticalFlow SOF;

PVector []targets = new PVector[6];
float []target_vals = new float[6];

// minim sound 1,2,3...

int active_chord = 0;

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

  for (int i = 0; i < targets.length; i++) {
    float x = 100 + i*(width-200)/float(targets.length);
    targets[i] = new PVector(x, height*0.5);
    target_vals[i] = 0;
  }

}

void draw () {
 // reset target vals ever draw loop
  for (int i = 0; i < targets.length; i++) {
    target_vals[i] = 0;
  }

  // draw image
  if (SOF.flagimage) set(0, 0, SOF.cam);
  else background(120);

  // calculate optical flow
  SOF.calculateFlow();

  // draw the optical flow vectors
  if (SOF.flagflow)
    SOF.drawFlow();

  // print out the optical flow (e.g. to use them with some other system)
  for (int i = 0; i < SOF.flows.size() - 2; i+=2) {
    PVector force_start = SOF.flows.get(i);
    PVector force_end = SOF.flows.get(i+1);
    //println ("force from " + force_start + " to " + force_end);

    PVector force = PVector.sub (force_end, force_start);
    float force_mag = force.mag()*0.1;

    // test to see if the force vector is near any of the targets
    for (int j = 0; j < targets.length; j++) {
      if (force_start.dist(targets[j]) < 50.0) {
        target_vals[j] += force_mag;
      }
    }

    //float heading = force.heading();
    //float f = map (heading, 0, TWO_PI, 0, 255);
    //fill (f);
    //noStroke();
    //ellipse (force_start.x, force_start.y, force_mag, force_mag);
  }


  for (int i = 0; i < targets.length; i++) {
    stroke(255);
    //if (target_vals[i] > 10) {
    //  fill(255, 0, 0);
    //} else {
    //  noFill();
    //}
    fill(255, 0, 0, target_vals[i]);
    rect(targets[i].x, targets[i].y, 100, 100);
    
    // set the minim object volume
  }
  

  //println(target_vals);
  int cur_greatest_indx = 0;
  float cur_greatest_val = -100.0;
  
  for (int i = 0; i < target_vals.length; i++) {
    if (target_vals[i] > cur_greatest_val){
      cur_greatest_val = target_vals[i];
      cur_greatest_indx = i;
    }
  }
  active_chord = cur_greatest_indx;
  println(active_chord);
}


void keyPressed() {
  //if (key=='w') SOF.flagseg=!SOF.flagseg; // segmentation on/off
  if (key=='m') SOF.flagmirror=!SOF.flagmirror; // mirror on/off
  else if (key=='i') SOF.flagimage=!SOF.flagimage; // show video on/off
  else if (key=='f') SOF.flagflow=!SOF.flagflow; // show opticalflow on/off
}
