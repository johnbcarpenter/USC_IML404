/* OpenCV for Processing 0.5.2 by Greg Borenstein  
   Computer vision with OpenCV: Face Detection example
   Install the library using Sketch > Import Library... > Add Library...
*/

import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;

PImage hat;

void setup() {
  size(960, 540);
  video = new Capture(this, 960, 540);
  opencv = new OpenCV(this, 960, 540);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  

  video.start();
  
  hat = loadImage("hat.png");
  
  imageMode(CENTER);
}

void draw() {
  // scale(2);
  opencv.loadImage(video);

  image(video, width*0.5, height*0.5);

  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  Rectangle[] faces = opencv.detect();
  // println(faces.length);

  for (int i = 0; i < faces.length; i++) {
    // println(faces[i].x + "," + faces[i].y);
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    image(hat, faces[i].x + faces[i].width*0.5, faces[i].y - faces[i].height*0.5, faces[i].width, faces[i].height);
  }
 
}

void captureEvent(Capture c) {
  c.read();
}
