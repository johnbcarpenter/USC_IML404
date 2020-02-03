// basic shader lines example
int point_ct = 500; // MUST BE AN EVEN NUMBER (TWO VERTICES IN A LINE)
PVector point_locs[];
float point_greys[];

PShader line_shader; // DECLARE THE SHADER 

void setup () {
  size(1280, 720, P3D);

  // initializa and populate the point_locs array
  point_locs = new PVector [point_ct];
  point_greys = new float [point_ct];
  for (int i = 0; i < point_locs.length; i++) {
    point_locs[i] = new PVector(random(-width*0.5, width*0.5), 
      random(-height*0.25, height*0.25), 
      random(-width*0.5, width*0.5));
    point_greys[i] = random(255);
  }

  // LOAD THE SHADER FROM THE DATA FOLDER
  line_shader = loadShader("linefrag.glsl", "linevert.glsl");
}

void draw () {
  background(0);

  // ENABLE THE SHADER FOR ANY POINTS AFTER THIS LINE
  shader(line_shader, LINES);

  // translate to the center of the screen + rotate
  pushMatrix();
  translate(width*0.5, height*0.5);
  rotateY(millis()*0.0005);
  // draw the points
  beginShape(LINES);
  strokeWeight(4);
  stroke(0, 120);
  for (int i = 0; i < point_locs.length-1; i+=2) {
    stroke(point_greys[i]);
    vertex(point_locs[i].x, point_locs[i].y, point_locs[i].z);
    vertex(point_locs[i+1].x, point_locs[i+1].y, point_locs[i+1].z);
  }
  endShape();
  popMatrix();
}
