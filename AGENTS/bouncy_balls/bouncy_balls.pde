
BouncyBall[] bouncy_balls = new BouncyBall[1000]; //BouncyBall is the class, bb01 is the object


void setup() {
  size(1920, 1080);
  
  for (int i = 0; i < bouncy_balls.length; i++){
    float x = random(width);
    float y = random(height);
    bouncy_balls[i] = new BouncyBall(x,y); //x,y
  }
}

void draw() {
  background(0);
  //fill(0,10);
  //rect (0,0,width,height);
  for (int i = 0; i < bouncy_balls.length; i++){
    bouncy_balls[i].Update();
    bouncy_balls[i].DrawSelf(); 
  }
}