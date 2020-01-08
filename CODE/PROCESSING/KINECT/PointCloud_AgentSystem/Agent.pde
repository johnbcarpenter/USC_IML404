float siz = 10.0;
int life_span_max = 40;
float life_span_max_inv = 1.0/life_span_max;

class Agent {
  PVector loc;
  PVector vel = new PVector(0, random(0.1, 1), 0);
  int life_span = life_span_max;

  Agent(PVector _starting_loc) {
    loc = _starting_loc;
  }

  void updateAndDrawSelf() {
    // update
    loc.add(vel);

    // draw  
    point(loc.x, loc.y, loc.z);
    
    life_span--;
  }
}