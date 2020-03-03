import processing.sound.*;

FFT fft;
AudioIn in;
int bands = 512;
float[] spectrum = new float[bands];

PVector [] locs;

void setup() {
  size(512, 360);
  background(255);
  
  locs = new PVector[bands];
  for (int i = 0; i < locs.length; i++){
    locs[i] = new PVector(random(width), random(height));
  }

  // Create an Input stream which is routed into the Amplitude analyzer
  fft = new FFT(this, bands);
  in = new AudioIn(this, 0);

  // start the Audio Input
  in.start();

  // patch the AudioIn
  fft.input(in);
  
  colorMode(HSB, 1, 1, 1, 1);
}      

void draw() { 
  background(1,0,0,1);
  fft.analyze(spectrum);

  for (int i = 0; i < bands; i++) {
    float sw = spectrum[i]*height*5;
    //if (sw < 10) continue;
    stroke(i/(0.5*float(bands)), 1, 1, 1);
    strokeWeight(sw);
    point(locs[i].x, locs[i].y);
    // The result of the FFT is normalized
    // draw the line for frequency band i scaling it up by 5 to get more amplitude.
    strokeWeight(1);
    line( i, height, i, height - spectrum[i]*height*5 );
  }
}
