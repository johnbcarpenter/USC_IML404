import processing.sound.*; // sound library

FFT fft; // Fast Fourier Transform (FFT) analyzer
AudioIn in; // will be used to capture audio
int bands = 64;
float[] spectrum = new float[bands];

float amplify = 10000.0;

void setup() {
  size(512, 512, P3D);
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
  fft.analyze(spectrum); // pass the spectrum array into the fft analyze
  // that gives us back an array spectrum[] with all the values populated

  // draw a typical sound spectrum "bar" chart at the bottom of the sketch
  strokeWeight(1);
  float eq_bar_w = width/float(bands);

  fill(0);
  for (int i = 0; i < spectrum.length; i++) {
    float temp_x = i*eq_bar_w;
    float temp_y = height;
    float rect_ht = spectrum[i]*amplify;
    //println(rect_ht);
    rect(temp_x, temp_y, eq_bar_w, -rect_ht);
    //line( i, height, i, height - spectrum[i]*amplify);
  }

  // draw sphere points
  pushMatrix();
  translate(width*0.5, height*0.5);
  rotateY(millis()*0.001);
  strokeWeight(10);
  stroke(0);
  float radius = 100.0;
  int side_ct = 8;
  //int point_ct = 0;
  for (int i = 0; i <side_ct; i++) {
    for (int j = 0; j <side_ct; j++) {
      float loop_theta = PI*0.5+PI*i/float(side_ct);
      float theta = TWO_PI*j/float(side_ct);

      float x = radius * cos (loop_theta) * cos (theta);
      float y = radius * cos (loop_theta) * sin (theta);
      float z = radius * sin (loop_theta);
      
      strokeWeight(spectrum[i]*1000.0);
      point(x, y, z);
      
      //point_ct++;
    }
  }
  //println(point_ct);
  popMatrix();
}
