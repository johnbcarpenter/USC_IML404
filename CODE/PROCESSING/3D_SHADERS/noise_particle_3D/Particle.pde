class Particle {

  PVector position;
  PVector velocity;
  float offset;

  PVector [] trail;

  Particle(PVector _position) {
    position = _position.copy();
    velocity = new PVector (random(-2, 2), random(-2, 2), random(-5, 5));

    offset = random(TWO_PI);

    trail = new PVector[50]; 
    // initially set all trail positions to the initial position
    for (int i = 0; i < trail.length; i++) {
      trail[i] = _position.copy();
    }
  }

  void update() {
    // update the position w perlin noise
    //float time = millis()*0.01;
    float noise_fctr = 0.01;
    float noise_float = noise(position.x*noise_fctr, position.y*noise_fctr);
    PVector perlin_noise = new PVector(0, sin(15.0*noise_float + offset));
    //perlin_noise.mult(2.0);
    position.add(perlin_noise);

    // and the original velocity
    position.add(velocity);
    
    // if the particle is more than 600px away, reset to 0
    PVector center = new PVector(width*0.5, height*0.5, 0);
    if (PVector.sub(position, center).mag() > 600){
      position = center.copy();
    }
    
    for (int i = trail.length - 1; i > 0; i--){
      trail[i] = trail[i-1];
    }
    trail[0] = position.copy();
  }

  void drawSelf() {
    pushMatrix();
    translate(position.x, position.y, position.z);
    ellipse(0, 0, 10, 10);
    popMatrix();

    // loop through and draw a trail of ellipses
    for (int i = 0; i < trail.length; i++) {
      pushMatrix();
      translate(trail[i].x, trail[i].y, trail[i].z);
      ellipse(0, 0, 10, 10);
      popMatrix();
    }
  }
}
