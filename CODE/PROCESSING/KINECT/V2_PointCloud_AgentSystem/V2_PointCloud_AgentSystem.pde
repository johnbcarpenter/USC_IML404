// ADAPTED FROM THE...
// Daniel Shiffman
// Thomas Sanchez Lengeling
// Kinect Point Cloud example

// https://github.com/shiffman/OpenKinect-for-Processing
// http://shiffman.net/p5/kinect/

import org.openkinect.processing.*;
//import java.nio.FloatBuffer;
import processing.video.*;


// Kinect Library object
Kinect2 kinect2;

// Angle for rotation
//float a = 0;

AgentWatcher agent_watcher;

void setup() {
  // Rendering in P3D
  size(800, 600, P3D);
  kinect2 = new Kinect2(this);
  kinect2.initDepth();
  kinect2.initDevice();

  agent_watcher = new AgentWatcher();
}

void draw() {

  background(0);

  // Get the raw depth as array of integers
  int[] depth = kinect2.getRawDepth();

  // We're just going to calculate and draw every 4th pixel 
  int skip = 4;

  // Translate and rotate
  pushMatrix();
  translate(width/2, height/2, 50);
  //rotateY(a);
  rotateY(map(mouseX, 0, width, -PI, PI));

  // Nested for loop that initializes x and y pixels and, for those less than the
  // maximum threshold and at every skiping point, the offset is caculated to map
  // them on a plane instead of just a line
  for (int x = 0; x < kinect2.depthWidth; x += skip) {
    for (int y = 0; y < kinect2.depthHeight; y += skip) {
      int offset = x + y*kinect2.depthWidth;

      // Convert kinect data to world xyz coordinate
      int rawDepth = depth[offset];
      PVector v = depthToPointCloudPos(x, y, rawDepth);

      stroke(255);
      pushMatrix();

      translate(v.x, v.y, v.z);
      // Draw a point
      point(0, 0);

      if (random (1.0) < 0.01 && v.mag() > 0) {
        //store the non transformed position
        float model_x = modelX(0, 0, 0);
        float model_y = modelY(0, 0, 0);
        float model_z = modelZ(0, 0, 0);
        PVector world_loc = new PVector (model_x, model_y, model_z);
        // and add the agent                                 
        agent_watcher . addAgent (world_loc);
        //println (agent_watcher.agents.size());
      }
      popMatrix();
    }
  }
  popMatrix();
  
  agent_watcher.updateAndDrawAgents();

  // Rotate
  //a += 0.015f;
}

//calculte the xyz camera position based on the depth data
PVector depthToPointCloudPos(int x, int y, float depthValue) {
  PVector point = new PVector();
  point.z = (depthValue);// / (1.0f); // Convert from mm to meters
  point.x = (x - CameraParams.cx) * point.z / CameraParams.fx;
  point.y = (y - CameraParams.cy) * point.z / CameraParams.fy;
  return point;
}
