// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Boid class
// Methods for Separation, Cohesion, Alignment added

class Boid {

  PVector seed_location;
  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed

  Boid(float x, float y) {
    acceleration = new PVector(0,0);
    velocity = new PVector(0,0);//random(-1,1),random(-1,1));
    location = new PVector(x,y);
    seed_location = location.copy();
    r = 3.0;
    maxspeed = 10; // BUMPED UP FOR OPTICAL FLOW
    maxforce = 0.05;
  }

  void run() {
    update();
    //borders();
    render();
  }

  // Method to update location
  void update() {
    //calc a vect towards the seed location
    PVector to_seed = PVector.sub(seed_location, location);
    //to_seed.normalize();
    to_seed.mult(to_seed.mag()/1000.0);
    acceleration.add(to_seed);
    stroke(0);
    line(seed_location.x, seed_location.y, location.x, location.y);
    
    // Update velocity
    velocity.add(acceleration);
    // Limit speed
    velocity.limit(maxspeed);
    location.add(velocity);
    // Reset accelertion to 0 each cycle
    acceleration.mult(0);
    // slow velocity over time (add a drag)
    velocity.mult(0.99); // ADDED UP FOR OPTICAL FLOW (SLOW vel DOWN OVER TIME)
  }

  
  void render() {
    // Draw a triangle rotated in the direction of velocity
    float theta = velocity.heading2D() + radians(90);
    fill(175);
    stroke(0);
    pushMatrix();
    translate(location.x,location.y);
    rotate(theta);
    beginShape(TRIANGLES);
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape();
    popMatrix();
  }

  // Wraparound
  void borders() {
    if (location.x < -r) location.x = width+r;
    if (location.y < -r) location.y = height+r;
    if (location.x > width+r) location.x = -r;
    if (location.y > height+r) location.y = -r;
  }
}
