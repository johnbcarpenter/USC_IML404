Spinner spin;

void setup() {
  size(1280, 720, P3D);

  spin = new Spinner();
}


void draw() {
  background(0);
  lights();
  sphereDetail(16);
  
  //camera control
  //float cam_z = sin(millis()*0.001)*(height/2.0) / tan(PI*30.0 / 180.0);
  //camera(width/2.0, height/2.0, cam_z, width/2.0, height/2.0, 0, 0, 1, 0);

  spin.update();
  spin.PushSpinnerMatrix();

  stroke(0);
  pushMatrix();
  //translate(width*0.5, height*0.5, 0);
  sphere(100);

  noStroke();
  translate(200, 0);
  sphere(20);

  popMatrix();

  spin.PopSpinnerMatrix();
}

void mousePressed(){
 spin.mousePressed(); 
}
void mouseDragged(){
 spin.mouseDragged(); 
}
void mouseReleased(){
 spin.mouseReleased(); 
}
void keyPressed(){
  spin.keyPressed(key);
}
