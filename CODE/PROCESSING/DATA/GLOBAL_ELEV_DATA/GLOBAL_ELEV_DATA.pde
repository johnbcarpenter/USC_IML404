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

PImage globe;
float globe_rad;
Spinner spin;

PVector[] flat_points;
float[] point_alphas;
color[] point_colors;
PVector[] globe_points;

PShader point_shader;

float sphere_factor = 0;
float sphere_target = sphere_factor;
float easing = 0.3;
float rotation_factor = 0.0;
float rotation_target = 0.0;

void setup() {
  size (1280, 640, P3D);

  globe = loadImage("GDEM-10km-colorized_1280x640.png");
  globe_rad = height*0.25;
  spin = new Spinner ();

  int skip = 2;
  int cur_indx = 0;

  int point_ct = int(globe.width/float(skip))*int(globe.height/float(skip));
  flat_points = new PVector[point_ct];
  point_alphas = new float[point_ct];
  point_colors = new color[point_ct];
  globe_points = new PVector[point_ct];
  for (int x = 0; x < globe.width; x+=skip) {
    for (int y = 0; y < globe.height; y+=skip) {
      color c = globe.get(x, y);
      float z = 0.075*red(c);

      //if (x%(inc*10) == 0 && y%(inc*10) == 0) z = 40.0;
      PVector loc = new PVector(x, y, z);
      loc.sub(new PVector(width*0.5, height*0.5, 0));
      //data.stroke(255, map(z, 0, 20, 0, 255));
      //data.vertex(loc.x, loc.y, loc.z);

      point_alphas[cur_indx] = map(z, 0, 10, 10, 255);
      point_colors[cur_indx] = c;
      flat_points[cur_indx] = loc.copy();
      float sphere_x = map(loc.x, -width*0.5, width*0.5, 0, TWO_PI);
      float sphere_y = map(loc.y, -height*0.5, height*0.5, -PI*0.5, PI*0.5);
      globe_points[cur_indx] = sphere_coord(sphere_x, sphere_y, globe_rad+loc.z*0.2);

      //locs[cur_indx] = loc.copy();
      cur_indx++;
    }
  }

  point_shader = loadShader("pointfrag.glsl", "pointvert.glsl");
}

void draw() {
  background(0.0);

  //hint(DISABLE_DEPTH_MASK);

  sphere_factor += (sphere_target - sphere_factor)*easing;

  spin.update();
  spin.PushSpinnerMatrix();

  rotation_factor += (rotation_target - rotation_factor)*easing;
  rotateX(rotation_factor*PI*-0.5);

  shader(point_shader, POINTS);

  // ALL MAP POINTS
  beginShape(POINTS);
  strokeWeight(1.5);
  for (int i = 0; i < globe_points.length; i++) {
    if (flat_points[i].z < 0.5) continue;

    PVector sp_to_net = PVector.sub(globe_points[i].copy(), flat_points[i].copy());
    PVector coord = PVector.add(flat_points[i].copy(), sp_to_net.mult(sphere_factor));

    //stroke(255, point_alphas[i]);
    stroke(point_colors[i]);
    //point(globe_points[i].x, globe_points[i].y, globe_points[i].z);
    //point(flat_points[i].x, flat_points[i].y, flat_points[i].z);
    vertex(coord.x, coord.y, coord.z);
  }
  endShape();

  // VERTICAL LINES
  //beginShape(LINES);
  //strokeWeight(2);
  //for (int i = 0; i < globe_points.length - 1; i++) {
  //  PVector sp_to_net = PVector.sub(globe_points[i].copy(), flat_points[i].copy());
  //  PVector coord = PVector.add(flat_points[i].copy(), sp_to_net.mult(sphere_factor));
  //  PVector sp_to_net2 = PVector.sub(globe_points[i+1].copy(), flat_points[i+1].copy());
  //  PVector coord2 = PVector.add(flat_points[i+1].copy(), sp_to_net2.mult(sphere_factor));

  //  stroke(255, point_alphas[i]);
  //  //point(globe_points[i].x, globe_points[i].y, globe_points[i].z);
  //  //point(flat_points[i].x, flat_points[i].y, flat_points[i].z);
  //  vertex(coord.x, coord.y, coord.z);
  //  vertex(coord2.x, coord2.y, coord2.z);
  //}
  //endShape();

  // HORIZONTAL LINES
  //beginShape(LINES);
  //strokeWeight(1);
  //for (int i = 0; i < globe_points.length; i++) {
  //  PVector sp_to_net = PVector.sub(globe_points[i].copy(), flat_points[i].copy());
  //  PVector coord = PVector.add(flat_points[i].copy(), sp_to_net.mult(sphere_factor));

  //  stroke(255, point_alphas[i]*0.01);
  //  vertex(0,0,0);
  //  //vertex(globe_rad*2*cos(millis()*0.0005),globe_rad*2*sin(millis()*0.0005),globe_rad*2*cos(millis()*0.001));
  //  //vertex(globe_points[i].x, globe_points[i].y, globe_points[i].z);
  //  //vertex(flat_points[i].x, flat_points[i].y, flat_points[i].z);
  //  vertex(coord.x, coord.y, coord.z);
  //}
  //endShape();

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
