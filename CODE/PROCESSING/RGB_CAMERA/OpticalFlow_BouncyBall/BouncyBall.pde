class BouncyBall {
  // class member variables
  PVector position;
  PVector velocity;
  float radius;
  float g;
  

  BouncyBall() { // constructor
    position = new PVector(random(width), random(height));
    velocity = new PVector(random(-4,4), random(-4,4));
    
    radius = random(4,12);
    g = random(255);
  }

  void UpdateSelf(){
    position.add(velocity);
    
    if(position.x > width){
      position.x = width;
      velocity.x *= -1;
    }
    if(position.x < 0){
      position.x = 0;
      velocity.x *= -1;
    }
    if(position.y > height){
      position.y = height;
      velocity.y *= -1;
    }
    if(position.y < 0){
      position.y = 0;
      velocity.y *= -1;
    }
    
    velocity.mult(0.99);
  }
  
  void DrawSelf() {
    fill(g);
    noStroke();
    ellipse(position.x, position.y, radius*2.0, radius*2.0);
    
    stroke(255);
    line(width*0.5, height*0.5, position.x, position.y);
  }
}
