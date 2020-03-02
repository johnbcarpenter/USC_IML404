import processing.sound.*; // sound library

FFT fft; // Fast Fourier Transform (FFT) analyzer
AudioIn in; // will be used to capture audio 
int bands = 512;
float[] spectrum = new float[bands];

float amplify = 1000.0;

void setup() {
  size(512, 360);
  background(255);

  // Create an Input stream which is routed into the FFT analyzer
  in = new AudioIn(this, 0); // capture audio using the microphone
  in.start(); // start the Audio Input

  // create the FFT analyzer
  fft = new FFT(this, bands);
  fft.input(in); // patch in the AudioIn
}      

void draw() { 
  background(255);
  fft.analyze(spectrum);

  // translate to the middle of the screen
  pushMatrix();
  translate(width*0.5, height*0.5);
  rotate(millis()*0.0001);

  // draw an ellipse based on the sum of all band frequencies
  float sum = 0; // stores the sum
  for (int i = 0; i < bands; i++) {
    sum += spectrum[i]; // add the current freq to the sum
  }
  float diameter = sum*amplify; // amplify the sum a bunch so we can see it
  if (diameter < 6.0) diameter = 6.0; // minimum diameter
  fill(0, 20);
  noStroke();
  ellipse (0, 0, diameter, diameter); // draw the ellipse

  // generate a spiral with the fft analyzed spectrum
  for (int i = 0; i < bands; i++) {
    float band_rad = i*0.5 + spectrum[i]*amplify;
    pushMatrix();
    rotate(TWO_PI*i/float(bands) * 16.0); // rotate i/bands of the way around TWO_PI
    // note: *16.0 wraps around the circle 16x 
    
    // draw a line to the spiral dot, length changes based on amplitude
    strokeWeight(0.5);
    stroke(0, 20);
    line(0, 0, band_rad, 0);
    
    // draw the point, point size changes based on amplitude
    strokeWeight(max(2, spectrum[i]*amplify));
    stroke(0);
    point(band_rad, 0);
    popMatrix();
  }
  popMatrix();

  // draw a typical sound spectrum "bar" chart at the bottom of the sketch
  strokeWeight(1);
  for (int i = 0; i < bands; i++) {
    line( i, height, i, height - spectrum[i]*amplify);
  }
}
