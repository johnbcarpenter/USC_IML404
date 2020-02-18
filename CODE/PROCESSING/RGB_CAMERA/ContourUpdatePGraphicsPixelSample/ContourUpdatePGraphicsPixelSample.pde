/* OpenCV for Processing 0.5.2 by Greg Borenstein  
 Computer vision with OpenCV: Variation on the Background Substraction example
 Install the library using Sketch > Import Library... > Add Library...
 */

import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture capt;
OpenCV opencv;

PGraphics pg_cam;
PGraphics pg_out;

void setup() {
  size(960, 540);
  capt = new Capture(this, 960, 540);
  opencv = new OpenCV(this, 960, 540);
  opencv.startBackgroundSubtraction(5, 3, 0.5);

  capt.start();
  
  pg_cam = createGraphics(width, height);
  pg_out = createGraphics(width, height);
}

void draw() {
  //image(video, 0, 0 ); // raw image
  
  // OPENCV CONTOURS
  opencv.loadImage(capt);
  opencv.updateBackground();
  opencv.dilate();
  opencv.erode();

 // UPDATE THE CAMERA/OPENCV IMAGE
  pg_cam.beginDraw();
  pg_cam.background (255);
  pg_cam.noStroke();
  pg_cam.fill(0);
  for (Contour contour : opencv.findContours()) {
    ArrayList<PVector> points = contour.getPoints();
    
    pg_cam.beginShape();
    for (PVector p : points){
      pg_cam.vertex (p.x, p.y);
    }
    pg_cam.endShape(CLOSE);
  }
  pg_cam.endDraw();
  
  // image(pg_cam, 0,0); // <-- CAMERA OPENCCV IMAGE
  
  // GENERATE A NEW IMAGE BASED ON WHAT THE CAMERA OPENCV IS SEEING
  pg_out.beginDraw();
  for (int i = 0; i <pg_cam.pixels.length; i++){
    int x = i%width;
    int y = floor(i/width);
    color c;
    if (red(pg_cam.pixels[i]) < 200){
      // c = color (random(255),random(255),random(255));
      // c = someImage.get(x,y); // returns a color from an image or video
      c = capt.get(x,y);
    } else {
      c = color (0,0,255);
    }
    pg_out.set(x,y,c);
  }
  pg_out.endDraw();
  
  image(pg_out, 0,0);
  
  image(capt, 20,20, 120,90); // <-- CAMERA OPENCCV IMAGE
  image(pg_cam, 150,20, 120,90); // <-- CAMERA OPENCCV IMAGE
}

void captureEvent(Capture c) {
  c.read();
}
