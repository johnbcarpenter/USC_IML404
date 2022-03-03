/*
  processing.org reference
 Capture \ Language (API) \ Processing 2+
 https://processing.org/reference/libraries/video/Capture.html
 */

import processing.video.*;

Capture cam;

PImage capture1;
PImage capture2;

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
    cam = new Capture(this, 240, 135, cameras[0]);
    cam.start();
  }

  capture1 = cam.copy();
  //capture1.pixels = new color [cam.width*cam.height];
  //capture1.loadPixels();
  //for (int i = 0; i < capture1.pixels.length; i++) {
  //  capture1.pixels[i] = color(0,0,0);
  //}
  //capture1.updatePixels();

  capture2 = new PImage();
}

void draw() {
  background(0);
  if (cam.available() == true) {
    cam.read();
  }

  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  image(cam, 100, 300);

  // tint: https://processing.org/reference/tint_.html
  //float tint_alpha = 30.0; // step 01
  //tint (255, tint_alpha); // step 01
  //image(cam, 0, 0, width,height);

  // filters: https://processing.org/reference/filter_.html
  //filter(INVERT);
  //filter(BLUR, 6);

  image(capture1, 480, height*0.5 + height*0.3*sin(millis()*0.001));
  image(capture2, 480, height*0.25 + height*0.3*sin(PI*0.3+millis()*0.001));
}

void keyPressed() {
  if (key == '1') {
    //cam.loadPixels();
    capture1.loadPixels();
    for (int i = 0; i < cam.pixels.length; i ++) {
      
       float r = red(cam.pixels[i]);
       float g = green(cam.pixels[i]);
       float b = blue(cam.pixels[i]);
       //println(c);
       if ((r > 100) && (g > 100) && (b > 100)) capture1.pixels[i] = color(0,0,0);
       else capture1.pixels[i] = color(255,0,0);
    }
    capture1.updatePixels();
    //capture1 = cam.copy();
  }
  if (key == '2') {
    capture2 = cam.copy();
  }
}
