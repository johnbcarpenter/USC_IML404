// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Demonstration of Craig Reynolds' "Flocking" behavior
// See: http://www.red3d.com/cwr/
// Rules: Cohesion, Separation, Alignment

// Click mouse to add boids into the system

Flock flock;

/**
  * audio input example -> ellipse diamter
  * overall audio input level affects the diameter of a circle
  * (run the sketch and try talking to the computer mic)
  *
  * adapted from the Minim MonitorInput example
  * For more information about Minim and additional features, 
  * visit http://code.compartmental.net/minim/ 
  */
import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioInput in;
FFT         fft;

float overall_volume_level;

float boid_diameter = 10.0;

void setup() {
  size(640,360);
  
  // FLOCKING STUFF
  flock = new Flock();
  // Add an initial set of boids into the system
  for (int i = 0; i < 200; i++) {
    Boid b = new Boid(width/2,height/2);
    flock.addBoid(b);
  }
  
  // MINIM STUFF
  minim = new Minim(this);
  // use the getLineIn method of the Minim object to get an AudioInput
  in = minim.getLineIn();
  // create an FFT object that has a time-domain buffer 
  // the same size as jingle's sample buffer
  // note that this needs to be a power of two 
  // and that it means the size of the spectrum will be half as large.
  fft = new FFT( in.bufferSize(), in.sampleRate() );
}

void draw() {
    // perform a forward FFT on the samples in jingle's mix buffer,
  // which contains the mix of both the left and right channels of the file
  fft.forward( in.mix );
  
  float sum = 0;
  for(int i = 0; i < fft.specSize(); i++)
  {
    sum += fft.getBand(i);
    
    line(i,height,i,height-10.0*fft.getBand(i));
  }
  overall_volume_level = sum; // / fft.specSize();
  //println(overall_volume_level);

  boid_diameter = overall_volume_level*0.01;
  if (boid_diameter < 1.0) boid_diameter = 1.0;
  
  background(255);
  flock.run();
  
  // Instructions
  fill(0);
  text("Drag the mouse to generate new boids.",10,height-16);
}

// Add a new boid into the System
void mouseDragged() {
  flock.addBoid(new Boid(mouseX,mouseY));
}
