/* this example combines 

   Daniel Shiffman's Depth thresholding example
   https://github.com/shiffman/OpenKinect-for-Processing, http://shiffman.net/p5/kinect/
   (Original example by Elie Zananiri, http://www.silentlycrashing.net)
   
   with an adaptation of 
   
   Hidetoshi Shimodaira's Optical Flow sketch on OpenProcessing
   http://www.openprocessing.org/sketch/10435
*/



ShiffmanKinect SK;
ShimodairaOpticalFlow SOF;

void setup() {
  size(512, 424);
  //fullScreen();

  SK = new ShiffmanKinect(this);
  SOF = new ShimodairaOpticalFlow(SK.depthImg.pixels, 
                                  SK.depthImg.width, 
                                  SK.depthImg.height);
}

void draw() {
  //blendMode(BLEND);
  background(0);
  //blendMode(ADD);
  
  //scale (2.5);
  SK.update();
  SK.drawDepth();
  
  // Update and draw the optical flow
  SOF.calculateFlow(SK.depthImg.pixels);
  if (SOF.flagflow) SOF.drawFlow();

  //fill(0);
  //text("TILT: " + angle, 10, 20);
  //text("THRESHOLD: [" + minDepth + ", " + maxDepth + "]", 10, 36);
}

// Adjust the angle and the depth threshold min and max
void keyPressed() {
  if (key == 'a') {
    SK.minDepth = constrain(SK.minDepth+10, 0, SK.maxDepth);
  } else if (key == 's') {
    SK.minDepth = constrain(SK.minDepth-10, 0, SK.maxDepth);
  } else if (key == 'z') {
    SK.maxDepth = constrain(SK.maxDepth+10, SK.minDepth, 2047);
  } else if (key =='x') {
    SK.maxDepth = constrain(SK.maxDepth-10, SK.minDepth, 2047);
  } 
}
