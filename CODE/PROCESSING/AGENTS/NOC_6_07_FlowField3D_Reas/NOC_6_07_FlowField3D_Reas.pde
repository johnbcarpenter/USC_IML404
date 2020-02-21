// Adapted from chapter 06, example 07 (flow field 3d noise) from 
// The Nature of Code by Daniel Shiffman, http://natureofcode.com
// press spacebar to see proximity-based lines inspired by casey reas

// Using this variable to decide whether to draw all the stuff
boolean debug = true;

// Flowfield object
FlowField flowfield;
// An ArrayList of vehicles
ArrayList<Vehicle> vehicles;

void setup() {
  size(1280, 720, P3D); // P3D renderer speeds up the sketch a ton
  // Make a new flow field with "resolution" of 16
  flowfield = new FlowField(20);
  vehicles = new ArrayList<Vehicle>();
  // Make a whole bunch of vehicles with random maxspeed and maxforce values
  for (int i = 0; i < 1000; i++) {
    vehicles.add(new Vehicle(new PVector(random(width), random(height)), random(2, 5), random(0.1, 0.5)));
  }
}

void draw() {
  background(255);
  flowfield.update();
  
  noStroke();
  strokeWeight(1);

  // Display the flowfield in "debug" mode
  if (debug) flowfield.display();
  // Tell all the vehicles to follow the flow field
  for (Vehicle v : vehicles) {
    v.follow(flowfield);
    v.run();
    
    // LOOK UP OPTICAL FLOW AND APPLY TO VEHICLE ACC OR VEL
  }

  float min_dist = 20.0;
  float max_dist = 50.0;
  beginShape(LINES);
  noFill();
  strokeWeight(1);
  for (int i = 0; i < vehicles.size(); i++) {
    for (int j = 0; j < vehicles.size(); j++) {
      Vehicle v1 = vehicles.get(i); // array [i]
      Vehicle v2 = vehicles.get(j);

      float dist = v1.position.dist(v2.position);
      if (dist > min_dist && dist < max_dist) {
        //float a = 255 * (1.0 - min(1.0, dist/max_dist)); // 0 - max_dist
        float a = 255 * (0.5 + 0.5 * cos (map(dist, min_dist, max_dist, -PI,  PI)));
        a *= 0.25; //reduce alpha by half (so max alpha is 255/4.0)
        stroke(0,a);
        vertex(v1.position.x, v1.position.y);
        vertex(v2.position.x, v2.position.y);
      }
    }
  }
  endShape();

  // Instructions
  fill(0);
  text("Hit space bar to toggle debugging lines.\nClick the mouse to generate a new flow field.", 10, height-20);
}


void keyPressed() {
  if (key == ' ') {
    debug = !debug;
  }
}

// Make a new flowfield
void mousePressed() {
  flowfield.init();
}
