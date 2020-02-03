// basic shader points example
int point_ct = 1000;
PVector point_locs[];

PShader point_shader; // DECLARE THE SHADER 

void setup () {
  size(1280, 720, P3D);
  
  // initializa and populate the point_locs array
  point_locs = new PVector [point_ct];
  for (int i = 0; i < point_locs.length; i++) {
    point_locs[i] = new PVector(random(-width*0.5, width*0.5), 
      random(-height*0.25, height*0.25), 
      random(-width*0.5, width*0.5));
  }

  // LOAD THE SHADER FROM THE DATA FOLDER
  point_shader = loadShader("pointfrag.glsl", "pointvert.glsl");
}

void draw () {
  background(255);
  
  // ENABLE THE SHADER FOR ANY POINTS AFTER THIS LINE
  shader(point_shader, POINTS);

  // translate to the center of the screen + rotate
  pushMatrix();
  translate(width*0.5, height*0.5);
  rotateY(millis()*0.0005);
  // draw the points
  beginShape(POINTS);
  strokeWeight(4);
  for (int i = 0; i < point_locs.length; i++) {
    point(point_locs[i].x, point_locs[i].y, point_locs[i].z);
  }
  endShape();
  popMatrix();
}
