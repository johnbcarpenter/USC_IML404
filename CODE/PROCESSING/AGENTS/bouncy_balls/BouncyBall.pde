class BouncyBall {
  float x, y;
  float size;
  float x_rate, y_rate;
  color c;
  
  BouncyBall(float _x, float _y){ //constructor
    x = _x;
    y = _y;
    size = random(1,40);
    c = color (random(255), random(255), random(255));
    
    float rnge = map (size, 1, 40, 400, 10);
    x_rate = rnge * random(-1,1);
    y_rate = rnge * random(-1,1);
  }
  
  void Update(){
    x = x + x_rate;
    y = y + y_rate; 
    
    if (x >= width){
      x = width;
      x_rate *= -1;
    }
    if (x <= 0){
      x = 0;
      x_rate *= -1;
    }
    if (y >= height){
      y = height;
      y_rate *= -1;
    }
    if (y <= 0){
      y = 0;
      y_rate *= -1;
    }
  }
  
  void DrawSelf(){
    noStroke();
    fill(c);
    ellipse(x,y,size,size);
  }
}