// ELEVATION DATA SOURCE
// The Ministry of Economy, Trade, and Industry (METI) of Japan and the 
// United States National Aeronautics and Space Administration (NASA) 
// jointly announced the release of the 
// Advanced Spaceborne Thermal Emission and Reflection Radiometer (ASTER) 
// Global Digital Elevation Model Version 3 (GDEM 003), and the ASTER 
// Water Body Dataset (ASTWBD) on August 5, 2019.
// https://asterweb.jpl.nasa.gov/gdem.asp

PVector transl;
PVector rotation;
PVector starting_rot;
PVector starting_mouseLoc;
boolean mouse_clicked;

float sphere_rad;
Spinner spin;

PVector[] flat_points;
PVector[] sphere_points;

PShader point_shader;

float sphere_factor = 0;
float sphere_target = sphere_factor;
float rotation_factor = 0;
float rotation_target = rotation_factor;
float easing = 0.1;

void setup() {
  size (1280, 640, P3D);

  sphere_rad = height*0.25;
  spin = new Spinner ();

  int skip = 10;
  int cur_indx = 0;

  int point_ct = int(width/float(skip))*int(height/float(skip));
  flat_points = new PVector[point_ct];
  sphere_points = new PVector[point_ct];
  for (int x = 0; x < width; x+=skip) {
    for (int y = 0; y < height; y+=skip) {
      float z = 0;
      PVector loc = new PVector(x, y, z);
      loc.sub(new PVector(width*0.5, height*0.5, 0));

      flat_points[cur_indx] = loc.copy();
      float sphere_x = map(loc.x, -width*0.5, width*0.5, 0, TWO_PI);
      float sphere_y = map(loc.y, -height*0.5, height*0.5, -PI*0.5, PI*0.5);
      sphere_points[cur_indx] = sphere_coord(sphere_x, sphere_y, sphere_rad);

      cur_indx++;
    }
  }

  point_shader = loadShader("pointfrag.glsl", "pointvert.glsl");
}

void draw() {
  background(0.0);

  sphere_factor += (sphere_target - sphere_factor)*easing;

  spin.update();
  spin.PushSpinnerMatrix();

  rotation_factor += (rotation_target - rotation_factor)*easing;
  rotateX(rotation_factor*PI*-0.5);

  shader(point_shader, POINTS);

  beginShape(POINTS);
  strokeWeight(2.0);
  for (int i = 0; i < sphere_points.length; i++) {
    PVector sp_to_net = PVector.sub(sphere_points[i].copy(), flat_points[i].copy());
    PVector coord = PVector.add(flat_points[i].copy(), sp_to_net.mult(sphere_factor));

    stroke(255);
    vertex(coord.x, coord.y, coord.z);
  }
  endShape();

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

  if (key == '1') {
    sphere_target = 0.0;
    rotation_target = 0.0;
  }
  if (key == '2') {
    sphere_target = 1.0;
    rotation_target = 1.0;
  }
}

// THETA = 0 -> PI, PHI = 0 -> TWO_PI
PVector sphere_coord (float RA, float DEC, float radius) {
  float x = radius * cos(DEC) * cos(RA);
  float y = radius * cos(DEC) * sin(RA);
  float z = radius * sin(DEC);

  return new PVector (x, y, z);
}
