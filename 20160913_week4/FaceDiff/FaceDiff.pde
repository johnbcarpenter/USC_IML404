/* OpenCV for Processing 0.5.2 by Greg Borenstein  
 Computer vision with OpenCV: Variation on the Background Substraction example
 Install the library using Sketch > Import Library... > Add Library...
 */

import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;

PImage  background_img;

void setup() {
  size(960, 540);
  video = new Capture(this, 960, 540);
  opencv = new OpenCV(this, 960, 540);
  
  video.start();
  background_img = video.get(); // probably going to be black, camera won't have started
  
}

void draw() {
  //image (background_img, 0, 0);
  
  opencv.loadImage(video.get());
  opencv.diff(background_img);
  image(opencv.getSnapshot(), 0, 0);

}

void keyPressed(){
  background_img = video.get();
}

void captureEvent(Capture c) {
  c.read();
}