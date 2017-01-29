/* OpenCV for Processing 0.5.2 by Greg Borenstein  
 Computer vision with OpenCV: Variation on the Background Substraction example
 Install the library using Sketch > Import Library... > Add Library...
 */

import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;

void setup() {
  size(960, 540);
  video = new Capture(this, 960, 540);
  opencv = new OpenCV(this, 960, 540);
  opencv.startBackgroundSubtraction(5, 3, 0.5);

  video.start();
}

void draw() {
  // scale(2);
  opencv.loadImage(video);
  opencv.updateBackground();

  image(video, 0, 0 );

  opencv.dilate();
  opencv.erode();

  noFill();
  stroke(255, 0, 0);
  strokeWeight(3);
  for (Contour contour : opencv.findContours()) {
    contour.draw();
  }
}

void captureEvent(Capture c) {
  c.read();
}