/*
  processing.org reference
  Capture \ Language (API) \ Processing 2+
  https://processing.org/reference/libraries/video/Capture.html
*/

import processing.video.*;

Capture cam;

//SHIFFMAN EXPLODE3D IMPORT
PImage img;       // The source image
int cellsize = 2; // Dimensions of each cell in the grid
int cols, rows;   // Number of columns and rows in our system

void setup() {
  size(640, 360, P3D);

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
  
  cols = width/cellsize;              // Calculate # of columns
  rows = height/cellsize;             // Calculate # of rows
}

void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  
  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  set(0, 0, cam);
  //background(0);
  
  // tint: https://processing.org/reference/tint_.html
  //float tint_alpha = 30.0; // step 01
  //tint (255, tint_alpha); // step 01
  //image(cam, 0, 0, width,height);
  
  // filters: https://processing.org/reference/filter_.html
  //filter(INVERT);
  //filter(BLUR, 6);
  
  cam.loadPixels();
  //cam.updatePixels();

  // Begin loop for columns
  for (int i = 0; i < cols; i++ ) {
    // Begin loop for rows
    for (int j = 0; j < rows; j++ ) {
      int x = i*cellsize + cellsize/2; // x position
      int y = j*cellsize + cellsize/2; // y position
      int loc = x + y*width;           // Pixel array location
      color c = cam.pixels[loc];       // Grab the color
      // Map brightness to a z position as a function of mouseX
      float z = map(brightness(cam.pixels[loc]), 0, 255, 0, mouseX);
      // Translate to the location, set fill and stroke, and draw the rect
      pushMatrix();
      translate(x, y, z); 
      fill(c);
      noStroke();
      rectMode(CENTER);
      rect(0, 0, cellsize, cellsize);
      popMatrix();
    }
  }

}
