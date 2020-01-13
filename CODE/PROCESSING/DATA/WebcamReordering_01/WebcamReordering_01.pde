/*
 simple pixel sorting... create a array of random colors 
 for every hue, and replace all pixels with the random color

 based on processing.org reference
 Capture \ Language (API) \ Processing 2+
 https://processing.org/reference/libraries/video/Capture.html
 */

import processing.video.*;

Capture cam;
color[] rndm_col;

void setup() {
  size(1280, 720);

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

  // create a array of random colors for every hue
  rndm_col = new color [256];
  for (int i = 0; i < 256; i++) {
    rndm_col[i] = color (int (random (255)), int (random (255)), int (random (255)));
  }
}

void draw() {
  if (cam.available() == true) {
    cam.read();
  }

  // create an array from the camera pixels
  color[] cam_pixels = cam.pixels;
  
  // create a new image to store the distorted pixels
  PImage img = createImage(1280, 720, ARGB);
  
  // loop through all the camera pixels and replace them with their random color
  // chosen based on their read in hue
  for (int i = 0; i < cam_pixels.length; i++) {
    // get a random color index based on the current pixel's hue
    int col_indx = (int (millis ()*0.0008) + floor (hue (cam_pixels[i])))%255;
    
    // generate/set the new image's pixel color based on the above col_indx
    img.pixels[i] = rndm_col[col_indx]; 
  }
  img.updatePixels(); // update the img pixels 
  image (img, 0, 0); // draw the image
}