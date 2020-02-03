class Particle {
  
  PVector position;
  PVector velocity;
  float offset;
  
  Particle(PVector _position){
    position = _position.copy();
    velocity = new PVector (random(0.8,2),0);
    
    offset = random(TWO_PI);
  }
  
  void update(){
    // update the position w perlin noise
    float time = millis()*0.01;
    float noise_fctr = 0.01;
    float noise_float = noise(position.x*noise_fctr, position.y*noise_fctr);
    PVector perlin_noise = new PVector(0, sin(15.0*noise_float + offset));
    //perlin_noise.mult(2.0);
    position.add(perlin_noise);
    
    // and the original velocity
    position.add(velocity);
  }
  
  void drawSelf(){
    ellipse(position.x, position.y, 10,10);
  }
  
}
