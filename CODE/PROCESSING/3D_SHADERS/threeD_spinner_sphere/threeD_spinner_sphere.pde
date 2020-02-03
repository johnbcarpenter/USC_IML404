Spinner spin;

void setup() {
  size(1280, 720, P3D);
  
  spin = new Spinner ();
}


void draw() {
  background(255);
  lights();
  
  spin.update();
  spin.PushSpinnerMatrix();
  
  fill(122);
  sphere(height*0.35);
  
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
