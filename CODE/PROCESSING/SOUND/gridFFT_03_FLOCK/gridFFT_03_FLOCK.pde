import processing.sound.*; // sound library

FFT fft; // Fast Fourier Transform (FFT) analyzer
AudioIn in; // will be used to capture audio
int bands = 512;
float[] spectrum = new float[bands];

float amplify = 10000.0;

Flock flock; // Flocking Example from The Nature of Code by Daniel Shiffman
// http://natureofcode.com

void setup() {
  size(512, 512, P3D);
  background(255);
  
  // AUDIO STUFF
  // Create an Input stream which is routed into the FFT analyzer
  in = new AudioIn(this, 0); // capture audio using the microphone
  in.start(); // start the Audio Input

  // create the FFT analyzer
  fft = new FFT(this, bands);
  fft.input(in); // patch in the AudioIn
  
  // FLOCKING STUFF
  flock = new Flock();
  // Add an initial set of boids into the system
  for (int i = 0; i < bands; i++) {
    float h = 100*i/float(bands);
    Boid b = new Boid(width/2,height/2, h);
    flock.addBoid(b);
  }
  
  colorMode(HSB, 100);
}

void draw() {
  background(100,0,100); // HSB
  fft.analyze(spectrum); // pass the spectrum array into the fft analyze
  // that gives us back an array spectrum[] with all the values populated

  // draw a typical sound spectrum "bar" chart at the bottom of the sketch
  strokeWeight(1);
  float eq_bar_w = width/float(bands);

// DRAW THE FREQ SPECTRUM
  //fill(0);
  noStroke();
  for (int i = 0; i < spectrum.length; i++) {
    float temp_x = i*eq_bar_w;
    float temp_y = height;
    float rect_ht = spectrum[i]*amplify;
    //println(rect_ht);
    
    float h = 100*i/float(spectrum.length);
    fill(h,100,100);
    rect(temp_x, temp_y, eq_bar_w, -rect_ht);
  }
  
  // UPDATE THE BOID SIZES
  for (int i = 0; i < flock.boids.size(); i++){
    Boid b = flock.boids.get(i);
    float temp_sz = spectrum[i]*1000.0;
    if (temp_sz < 1.0) temp_sz = 1.0;
    b.r = temp_sz;
  }
  
  // RUN THE FLOCKING ALGORITHM + DRAW, ETC
  flock.run();
}
