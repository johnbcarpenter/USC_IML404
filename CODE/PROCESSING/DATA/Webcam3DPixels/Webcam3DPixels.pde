/*
  processing.org reference
  Capture \ Language (API) \ Processing 2+
  https://processing.org/reference/libraries/video/Capture.html
*/

import processing.video.*;

Capture cam;

void setup() {
  size(1280, 720, P3D);

  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, 1280, 720, cameras[0]);
    cam.start();     
  }      
}

void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  background(0);
  //set(0, 0, cam); // image(cam, 0, 0);
  
  int skip = 10;
  noStroke();
  for (int y = 0; y < height; y += skip){
    for (int x = 0; x < width; x += skip){
      color c = cam.get(x,y);
      float z = 2.0*brightness(c); // set z val based on c brightness
      fill(c);
      pushMatrix();
      translate(x,y,z);
      ellipse(0,0, skip*0.5, skip*0.5);
      popMatrix();
    }
  }
  

  

}
