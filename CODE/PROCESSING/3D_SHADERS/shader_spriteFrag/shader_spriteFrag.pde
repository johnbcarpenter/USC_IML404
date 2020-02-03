// basic SPRITE shader points example
int point_ct = 200;
PVector point_locs[];
float point_hues[];

PShader spriteShader; // DECLARE THE SHADER 
PImage glowy_img;

float WEIGHT = 72; // NOTE: THE STROKE WEIGHT 
// AND UNIFORM "weight" IN THE SHADER SHOULD BE EQUAL

void setup() {
  size(1280, 720, P3D);

  // initializa and populate the point_locs array
  point_locs = new PVector [point_ct];
  point_hues = new float [point_ct];
  for (int i = 0; i < point_locs.length; i++) {
    point_locs[i] = new PVector(random(-width*0.5, width*0.5), 
      random(-height*0.25, height*0.25), 
      random(-width*0.5, width*0.5));
    point_hues[i] = random(1);
  }

  // LOAD THE SHADER FROM THE DATA FOLDER
  spriteShader = loadShader("spritefrag.glsl", "spritevert.glsl");
  spriteShader.set("weight", WEIGHT);
  glowy_img = loadImage("particle.png");
  spriteShader.set("sprite", glowy_img);

  colorMode(HSB, 1, 1, 1, 1);

  strokeWeight(WEIGHT);
  strokeCap(SQUARE);

  blendMode(ADD);
  hint(DISABLE_DEPTH_MASK);
}

void draw() {
  background(0);

  // ENABLE THE SHADER FOR ANY POINTS AFTER THIS LINE
  shader(spriteShader, POINTS);

  // translate to the center of the screen + rotate
  pushMatrix();
  translate(width*0.5, height*0.5);
  rotateY(millis()*0.0005);
  // draw the points
  beginShape(POINTS);
  strokeWeight(WEIGHT);
  stroke(1, 0, 1, 1);
  for (int i = 0; i < point_locs.length; i++) {
    stroke(point_hues[i], 1, 1, 1);
    point(point_locs[i].x, point_locs[i].y, point_locs[i].z);
  }
  endShape();
  popMatrix();
}
