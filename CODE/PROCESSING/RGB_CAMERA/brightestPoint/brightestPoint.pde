/*
  processing.org reference
 Capture \ Language (API) \ Processing 2+
 https://processing.org/reference/libraries/video/Capture.html
 */

import processing.video.*;

Capture cam;

PVector []light_trail;

void setup() {
  size(640, 360);

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

  light_trail = new PVector[64];
  for (int i = 0; i < light_trail.length; i++) {
    light_trail[i] = new PVector(); //0,0,0
  }
}

void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  set(0, 0, cam);

  float brightest_pixel_val = -1;
  int brightest_pixel_index = -1;
  for (int i = 0; i < cam.pixels.length; i++) {
    float brightness = brightness(cam.pixels[i]);
    if (brightness > brightest_pixel_val) {
      brightest_pixel_val = brightness;
      brightest_pixel_index = i;
    }
  }
  if (brightest_pixel_index >= 0) {
    for (int i = light_trail.length - 1; i > 0; i--) {
      light_trail[i] = light_trail[i-1];
    }
    int x = brightest_pixel_index%width;
    int y = floor(brightest_pixel_index/float(width));
    light_trail[0] = new PVector(x, y);
  }
  
  strokeWeight(10);
  for (int i = 0; i < light_trail.length-1; i++) {
    stroke(255, 255*(1 - i/float(light_trail.length)));
    line(light_trail[i].x, light_trail[i].y, light_trail[i+1].x, light_trail[i+1].y);
  }
}
