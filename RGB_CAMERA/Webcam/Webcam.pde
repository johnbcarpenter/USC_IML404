/*
  processing.org reference
  Capture \ Language (API) \ Processing 2+
  https://processing.org/reference/libraries/video/Capture.html
*/

import processing.video.*;

Capture cam;

void setup() {
  size(960, 540);

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
    cam = new Capture(this, 640, 360, cameras[0]);
    cam.start();     
  }      
}

void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  
  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  set(0, 0, cam);
  
  // tint: https://processing.org/reference/tint_.html
  //float tint_alpha = 30.0; // step 01
  //tint (255, tint_alpha); // step 01
  //image(cam, 0, 0, width,height);
  
  // filters: https://processing.org/reference/filter_.html
  //filter(INVERT);
  //filter(BLUR, 6);
  

}