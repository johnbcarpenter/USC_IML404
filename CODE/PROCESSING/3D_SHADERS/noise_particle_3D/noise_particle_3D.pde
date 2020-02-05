// moving particles with perlin noise
Particle [] particles;

void setup(){
  size (1280, 720, P3D);
  
  particles = new Particle [75];
  
  PVector starting_vect = new PVector(width*0.5, height*0.5);
  for (int i = 0; i < particles.length; i++){
    particles[i] = new Particle(starting_vect);
  }
}

void draw(){
  background(255);
  
  for (int i = 0; i < particles.length; i++){
    particles[i].update();
    particles[i].drawSelf();
  }
  
}
