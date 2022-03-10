class Spinner {

  PVector transl;
  PVector transl_target;
  PVector rotation;
  PVector starting_rot;
  PVector starting_mouseLoc;
  boolean mouse_clicked;

  boolean AUTO_ROTATE = false;

  Spinner() { 
    transl = new PVector(width*0.5, height*0.5, 0);
    transl_target = transl.copy();
    rotation = new PVector(0, 0, 0);
    starting_rot = rotation.copy();
    starting_mouseLoc = new PVector(0, 0, 0);
    mouse_clicked = false;
  }

  void PushSpinnerMatrix() {
    pushMatrix();
    translate(transl.x, transl.y, transl.z);
    rotateX(rotation.y);
    if (AUTO_ROTATE) {
      rotateY(rotation.x + millis()*0.0001);
    } else {
      rotateY(rotation.x);
    }
  }

  void PopSpinnerMatrix() {
    popMatrix();
  }
  
  void update() {
    float ease = 0.1;
    
    float dx = transl_target.x - transl.x;
    transl.x += dx*ease;
    
    float dy = transl_target.y - transl.y;
    transl.y += dy*ease;
    
    float dz = transl_target.z - transl.z;
    transl.z += dz*ease;
  }

  void mousePressed() {
    if (!mouse_clicked) {
      mouse_clicked = true;
      starting_rot = new PVector(rotation.x, rotation.y, rotation.z);
      starting_mouseLoc = new PVector(mouseX, mouseY, 0);
    }
  }

  void mouseDragged() {
    if (!mouse_clicked) return;

    PVector mouseLoc = new PVector(mouseX, mouseY);
    PVector diff = new PVector(starting_mouseLoc.x, starting_mouseLoc.y, starting_mouseLoc.z);
    diff.sub(mouseLoc);
    float d = TWO_PI/float(height);
    float x = starting_rot.x-diff.x*d;
    float y = starting_rot.y+diff.y*d;
    float z = starting_rot.z;
    rotation = new PVector(x, y, z);
  }

  void mouseReleased() {
    mouse_clicked = false;
  }

  void keyPressed (char key) {
    
    float d = height*0.1;
    if (key == 'r')
      transl_target.y-=d;
    if (key == 'f')
      transl_target.y+=d;
    if (key == 'd')
      transl_target.x+=d;
    if (key == 'a')
      transl_target.x-=d;
    if (key == 'w')
      transl_target.z+=d;
    if (key == 's')
      transl_target.z-=d;
      
    if (key == '1')
      AUTO_ROTATE = !AUTO_ROTATE;
  }
}
