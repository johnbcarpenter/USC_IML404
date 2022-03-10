
void setup() {
  size(1280, 720, P3D);

}

void draw() {
  background(0);

// CONTROL THE CAMERA
  float camx = width/2.0; // default
  //float camx = cos(millis()*0.001)*(height/2.0) / tan(PI*30.0 / 180.0);
  float camy = height/2.0;
  //float camz = (height/2.0) / tan(PI*30.0 / 180.0); // default
  float camz = sin(millis()*0.001)*(height/2.0) / tan(PI*30.0 / 180.0);
  camera(camx, camy, camz, width/2.0, height/2.0, 0, 0, 1, 0);

  //                R   G   B    direction
  directionalLight(20, 220, 255, -1, 0, 0);
  //sphereDetail(mouseX / 4);

  stroke(255);
  translate(width*0.5, height*0.5, 0);
  sphere(200);

}
