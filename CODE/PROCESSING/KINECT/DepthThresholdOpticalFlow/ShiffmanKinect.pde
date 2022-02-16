import org.openkinect.freenect.*;
import org.openkinect.processing.*;
import processing.video.*;

class ShiffmanKinect {

  Kinect kinect;
  
  // Depth image
  PImage depthImg;
  //PImage rawImg;

  boolean mirror = false;

  // Which pixels do we care about?
  int minDepth =  60;
  int maxDepth = 860;

  // What is the kinect's angle
  float angle;

  ShiffmanKinect (PApplet parent) {
    
    kinect = new Kinect(parent);
    kinect.initDepth();
    angle = kinect.getTilt();

    // Blank image
    depthImg = new PImage(kinect.width, kinect.height);
  }

  public void update () {
    // Threshold the depth image
    int[] rawDepth = kinect.getRawDepth();
    for (int i=0; i < rawDepth.length; i++) {
      //rawImg.pixels[i] = rawDepth[i];
      if (rawDepth[i] >= minDepth && rawDepth[i] <= maxDepth) {
        depthImg.pixels[i] = color(255, 300-255.0*float (rawDepth[i])/2048.0);
      } else {
        depthImg.pixels[i] = color(0,0,255,255.0*float(rawDepth[i])/2048.0);
      }
    }

    depthImg.updatePixels();
    // image(depthImg, 0, 0);
  }
  
  public void drawDepth () {
    image(depthImg, 0, 0);
  }
}
