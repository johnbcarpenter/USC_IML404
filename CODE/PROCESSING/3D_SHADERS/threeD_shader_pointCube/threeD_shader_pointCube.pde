Spinner spin;
PShader point_shader;


PVector [] grid_points; //5x5x5
int grid_ct = 5;
float grid_sp = 80.0;
float pt_sz = 9.0;

void setup() {
  size(1280, 720, P3D);
  
  spin = new Spinner ();
  point_shader = loadShader("pointfrag.glsl", "pointvert.glsl");

  grid_points = new PVector [grid_ct*grid_ct*grid_ct];

  float min_max = grid_sp * 2.0;
  int ct = 0;
  for (float x = -min_max; x <= min_max; x += grid_sp) {
    for (float y = -min_max; y <= min_max; y += grid_sp) {
      for (float z = -min_max; z <= min_max; z += grid_sp) {
        grid_points[ct] = new PVector (x, y, z);
        ct++;
      }
    }
  }
  println(ct);
}


void draw() {
  background(255);
  
  shader(point_shader, POINTS);
  
  spin.update();
  spin.PushSpinnerMatrix();
  strokeWeight(pt_sz);
  stroke(0, 200);
  for (int i = 0; i < grid_points.length; i++){
    point(grid_points[i].x, grid_points[i].y, grid_points[i].z);
  }
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
