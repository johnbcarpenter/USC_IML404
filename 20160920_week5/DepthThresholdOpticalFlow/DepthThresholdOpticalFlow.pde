/* this example combines 

   Daniel Shiffman's Depth thresholding example
   https://github.com/shiffman/OpenKinect-for-Processing, http://shiffman.net/p5/kinect/
   (Original example by Elie Zananiri, http://www.silentlycrashing.net)
   
   with an adaptation of 
   
   Hidetoshi Shimodaira's Optical Flow sketch on OpenProcessing
   http://www.openprocessing.org/sketch/10435
*/

import org.openkinect.freenect.*;
import org.openkinect.processing.*;

Kinect kinect;

// Depth image
PImage depthImg;

boolean mirror = false;

// Which pixels do we care about?
int minDepth =  60;
int maxDepth = 860;

// What is the kinect's angle
float angle;

void setup() {
  size(640, 480);

  kinect = new Kinect(this);
  kinect.initDepth();
  angle = kinect.getTilt();

  // Blank image
  depthImg = new PImage(kinect.width, kinect.height);
  
  SOF = new ShimodairaOpticalFlow(depthImg.pixels, depthImg.width, depthImg.height);
}

void draw() {
  
  // Threshold the depth image
  int[] rawDepth = kinect.getRawDepth();
  for (int i=0; i < rawDepth.length; i++) {
    if (rawDepth[i] >= minDepth && rawDepth[i] <= maxDepth) {
      depthImg.pixels[i] = color(255);
    } else {
      depthImg.pixels[i] = color(0);
    }
  }

  // Draw the thresholded image
  depthImg.updatePixels();
  image(depthImg, 0, 0);
  
  // Update and draw the optical flow
  SOF.calculateFlow(depthImg.pixels);
  if (SOF.flagflow) SOF.drawFlow();

  fill(0);
  text("TILT: " + angle, 10, 20);
  text("THRESHOLD: [" + minDepth + ", " + maxDepth + "]", 10, 36);
}

// Adjust the angle and the depth threshold min and max
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      angle++;
    } else if (keyCode == DOWN) {
      angle--;
    }
    angle = constrain(angle, 0, 30);
    kinect.setTilt(angle);
  } else if (key == 'a') {
    minDepth = constrain(minDepth+10, 0, maxDepth);
  } else if (key == 's') {
    minDepth = constrain(minDepth-10, 0, maxDepth);
  } else if (key == 'z') {
    maxDepth = constrain(maxDepth+10, minDepth, 2047);
  } else if (key =='x') {
    maxDepth = constrain(maxDepth-10, minDepth, 2047);
  } else if(key == 'm'){
    mirror = !mirror;
    kinect.enableMirror(mirror);
  }
}