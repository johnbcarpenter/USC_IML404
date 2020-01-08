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

void setup()
{
  size(512, 512);

  minim = new Minim(this);
  
  // use the getLineIn method of the Minim object to get an AudioInput
  in = minim.getLineIn();
  
  // create an FFT object that has a time-domain buffer 
  // the same size as jingle's sample buffer
  // note that this needs to be a power of two 
  // and that it means the size of the spectrum will be half as large.
  fft = new FFT( in.bufferSize(), in.sampleRate() );
}

void draw()
{
  background(0);
  stroke(255);
  
  // perform a forward FFT on the samples in jingle's mix buffer,
  // which contains the mix of both the left and right channels of the file
  fft.forward( in.mix );
  
  float sum = 0;
  for(int i = 0; i < fft.specSize(); i++)
  {
    sum += fft.getBand(i);
  }
  overall_volume_level = sum; // / fft.specSize();
  //println(overall_volume_level);

  float diameter = overall_volume_level;
  if (diameter < 6.0) diameter = 6.0;
  ellipse (width*0.5, height*0.5, diameter, diameter);
}
