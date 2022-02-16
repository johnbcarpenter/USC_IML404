import org.openkinect.freenect.*;
import org.openkinect.processing.*;

class ShiffmanKinect {

  Kinect kinect;

  // Depth image
  PImage depthImg;
  //PImage rawImg;

  boolean mirror = false;


  int[] rawDepth;

  // Which pixels do we care about?
  int minDepth =  60;
  int maxDepth = 860;

  // What is the kinect's angle
  float angle;

  // We'll use a lookup table so that we don't have to repeat the math over and over
  float[] depthLookUp = new float[2048];


  ShiffmanKinect (PApplet parent) {

    kinect = new Kinect(parent);
    kinect.initDepth();
    angle = kinect.getTilt();

    // Blank image
    depthImg = new PImage(kinect.width, kinect.height);

    // Lookup table for all possible depth values (0 - 2047)
    for (int i = 0; i < depthLookUp.length; i++) {
      depthLookUp[i] = rawDepthToMeters(i);
    }
  }

  public void update () {
    // Threshold the depth image
    rawDepth = kinect.getRawDepth();
    for (int i=0; i < rawDepth.length; i++) {
      //rawImg.pixels[i] = rawDepth[i];
      if (rawDepth[i] >= minDepth && rawDepth[i] <= maxDepth) {
        depthImg.pixels[i] = color(255, 300-255.0*float (rawDepth[i])/2048.0);
      } else {
        depthImg.pixels[i] = color(0, 0, 255, 255.0*float(rawDepth[i])/2048.0);
      }
    }

    depthImg.updatePixels();
    // image(depthImg, 0, 0);
  }

  public void drawDepth () {
    image(depthImg, 0, 0);
  }

  public void drawPointCloud () {
    int skip = 4;

    for (int x = 0; x < kinect.width; x += skip) {
      for (int y = 0; y < kinect.height; y += skip) {
        int offset = x + y*kinect.width;

        // Convert kinect data to world xyz coordinate
        int temp_depth = rawDepth[offset];
        PVector v = depthToWorld(x, y, temp_depth);

        if (v.mag() == 0) continue;

        stroke(255);
        pushMatrix();
        // Scale up by 200
        float factor = 200;
        translate(v.x*factor, v.y*factor, factor-v.z*factor);
        // Draw a point
        point(0, 0);
        popMatrix();
      }
    }
  }

  // These functions come from: http://graphics.stanford.edu/~mdfisher/Kinect.html
  float rawDepthToMeters(int depthValue) {
    if (depthValue < 2047) {
      return (float)(1.0 / ((double)(depthValue) * -0.0030711016 + 3.3309495161));
    }
    return 0.0f;
  }

  PVector depthToWorld(int x, int y, int depthValue) {

    final double fx_d = 1.0 / 5.9421434211923247e+02;
    final double fy_d = 1.0 / 5.9104053696870778e+02;
    final double cx_d = 3.3930780975300314e+02;
    final double cy_d = 2.4273913761751615e+02;

    PVector result = new PVector();
    double depth =  depthLookUp[depthValue];//rawDepthToMeters(depthValue);
    result.x = (float)((x - cx_d) * depth * fx_d);
    result.y = (float)((y - cy_d) * depth * fy_d);
    result.z = (float)(depth);
    return result;
  }
}
