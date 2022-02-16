
void setup() {
  size(500, 500, P3D); // HAS TO BE P3D FOR THE GLOWY EFFECT
  
  hint(DISABLE_DEPTH_MASK); // additive blending
}

void draw() {
  background(0);
  blendMode(ADD); // additive blending

  pushMatrix();
  translate(width*0.5, height*0.5);
  beginShape(TRIANGLES);
  noStroke();
  //stroke(255);
  float rad = 60.0*sin(millis()*0.01);
  float theta_inc = PI/6.0;
  for (float theta = 0; theta < TWO_PI-theta_inc; theta += theta_inc) {
    fill(255, 0);
    vertex(rad*cos(theta), rad*sin(theta));
    fill(255);
    vertex(0, 0);
    fill(255, 0);
    vertex(rad*cos(theta+theta_inc), rad*sin(theta+theta_inc));
  }
  endShape();
  popMatrix();
}
