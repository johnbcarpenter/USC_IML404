Spinner spin;

void setup(){
  size(1280,720,P3D);
  
  spin = new Spinner();
}

void draw(){
  background(0);
  //lights();
  //                R   G   B    direction
  directionalLight(20,220,255, -1,0,0);
  //sphereDetail(mouseX / 4);
  
spin.update();
spin.PushSpinnerMatrix();
  //noStroke();
  stroke(255);
  sphere(200);
  translate(400,0,0);
  sphere(60);
spin.PopSpinnerMatrix();
  
}

void mousePressed() {
  spin.mousePressed();
}
void mouseDragged() {
  spin.mouseDragged();
}
void mouseReleased() {
  spin.mouseReleased();
}
void keyPressed() {
  spin.keyPressed(key);
}
