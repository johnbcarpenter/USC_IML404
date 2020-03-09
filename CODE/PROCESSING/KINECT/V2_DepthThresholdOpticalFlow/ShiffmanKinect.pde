import org.openkinect.processing.*;

class ShiffmanKinect {

  Kinect2 kinect2;
  
  // Depth image
  PImage depthImg;
  //PImage rawImg;

  boolean mirror = false;

  // Which pixels do we care about?
  int minDepth =  60;
  int maxDepth = 860;
  
  // note: the kinect v1 has raw depth values between 0 and 2048
  // the kinect v2 range is between 0 and 4500.

  // What is the kinect's angle
  float angle;

  ShiffmanKinect (PApplet parent) {
    
    kinect2 = new Kinect2(parent);
    kinect2.initDepth();
    kinect2.initDevice();

    // Blank image
    depthImg = new PImage(kinect2.depthWidth, kinect2.depthHeight);
    println(kinect2.depthWidth, kinect2.depthHeight);
  }

  public void update () {
    // Threshold the depth image
    int[] rawDepth = kinect2.getRawDepth();
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
