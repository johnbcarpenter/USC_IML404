/*
JOHN Carpenter class intro
basic draw example from 01/12
*/

float x = 100.0;
float y = 100.0;

float x_rate = 10.0;
float y_rate = 2.0;
float radius = 50.0;

float x2 = 400.0;
float y2 = 500.0;

float x_rate2 = -6.0;
float y_rate2 = 20.0;
float radius2 = 20.0;

void setup(){ // runs 1x
  size(1280,720);
}

void draw(){ // loops infinitely
  
  ellipse(x,y, radius, radius);
  ellipse(x2,y2, radius2, radius2);
  
  // ball 1
  x += x_rate; // x = x + x_rate
  y += y_rate;
  
  // bounce off the walls
  if (x > width) { // this is a conditional statement
     x = width;
     x_rate *= -1;
  }
  if (x < 0) { // so is this
     x = 0;
     x_rate *= -1;
  }
   if (y > height) {
     y = height;
     y_rate *= -1;
  }
  if (y < 0) {
     y = 0;
     y_rate *= -1;
  }
  
  // ball2
  x2 += x_rate2; // x = x + x_rate
  y2 += y_rate2;
  
  // bounce off the walls
  if (x2 > width) { // this is a conditional statement
     x2 = width;
     x_rate2 *= -1;
  }
  if (x2 < 0) { // so is this
     x2 = 0;
     x_rate2 *= -1;
  }
   if (y2 > height) {
     y2 = height;
     y_rate2 *= -1;
  }
  if (y2 < 0) {
     y2 = 0;
     y_rate2 *= -1;
  }
}



 
