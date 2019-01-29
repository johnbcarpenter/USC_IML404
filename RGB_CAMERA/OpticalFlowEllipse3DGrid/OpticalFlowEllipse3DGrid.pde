import processing.video.*;

ShimodairaOpticalFlow SOF;

void setup () {
  size(960, 540, P3D);

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
  //translate(width*0.5, height*0.5);
  //rotateY(millis()*0.001);
  //translate(-width*0.5, -height*0.5);
  // draw image
  if (SOF.flagimage) set(0, 0, SOF.cam);
  else background(10);
  
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
    //if (force_mag < 2.0) force_mag = 2.0;
    fill (255);
    noStroke();
    pushMatrix();
    translate(force_start.x, force_start.y, force_mag*100.0);
    ellipse (0,0, 6,6);
    popMatrix();
    stroke(255,100);
    line(force_start.x, force_start.y, 0, force_start.x, force_start.y, force_mag*100.0);
  }

}


void keyPressed() {
  //if (key=='w') SOF.flagseg=!SOF.flagseg; // segmentation on/off
  if (key=='m') SOF.flagmirror=!SOF.flagmirror; // mirror on/off
  else if (key=='i') SOF.flagimage=!SOF.flagimage; // show video on/off
  else if (key=='f') SOF.flagflow=!SOF.flagflow; // show opticalflow on/off
}
