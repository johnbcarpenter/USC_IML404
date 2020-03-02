// kepler exoplanet data downloaded from caltech 
// https://exoplanetarchive.ipac.caltech.edu/cgi-bin/TblView/nph-tblView?app=ExoTbls&config=planets
Kepler K;

float sphere_fctr = 0.0;
float sphere_fctr_targ = 0.0;
float sphere_easing = 0.1;
float flat_fctr = 0.0;
float flat_fctr_targ = 0.0;
float flat_easing = 0.1;

Spinner spin;
PShader point_shader;

void setup() {
  size(1280, 720, P3D);
  colorMode(HSB, 1.0);

  K = new Kepler("planets_2020.01.15_11.05.50.csv");

  spin = new Spinner ();
  point_shader = loadShader("pointfrag.glsl", "pointvert.glsl");

  //hint(DISABLE_DEPTH_TEST);
  //blendMode(ADD);
}

void draw() {
  background(0, 0, 0, 1);

  // easingly update the sphere factor (how much of a sphere the data is)
  sphere_fctr += (sphere_fctr_targ - sphere_fctr)*sphere_easing;
  flat_fctr += (flat_fctr_targ - flat_fctr)*flat_easing;

  spin.update();
  spin.PushSpinnerMatrix();

  shader(point_shader, POINTS);

  K.drawData();

  stroke(0, 0, 1, 1);
  strokeWeight(1.0);
  point(0, 0, 0); // earth

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

  if (key == '2') sphere_fctr_targ = 1.0;
  if (key == '3') sphere_fctr_targ = 0.0;

  if (key == '4') flat_fctr_targ = 1.0;
  if (key == '5') flat_fctr_targ = 0.0;
}
