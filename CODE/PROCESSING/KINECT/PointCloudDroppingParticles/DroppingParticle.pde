class DroppingParticle {
  PVector loc;
  PVector vel;
  PVector acc;
  int lifeapan_max = int (random(100));
  int lifespan = lifeapan_max;
  boolean first_bounce = true;

  DroppingParticle(PVector _loc) {
    loc = _loc.copy();
    vel = new PVector(0, 2, 0);
    acc = new PVector();
    //vel = new PVector(random(-0.5,0.5), random(-0.5,0.5), random(-0.5,0.5));
  }

  void update() {
    acc.y = 0.5;
    vel.add(acc);

    loc.add(vel);

    // math here inspired by shiffman's NOC_2_4_forces_friction
    if (loc.y > 100) {
      loc.y = 100;
      vel.y *= -0.5;
      if (first_bounce) { // first bounce, generate a random vel.x + vel.z
        float rng = 2;
        vel.x = random(-rng, rng);
        vel.z = random(-rng, rng);
        first_bounce = false;
      }
    }

    lifespan--;

    vel.mult(0.97);
    acc.mult(0);
  }

  void drawSelf() {
    stroke(255, 255*lifespan/float(lifeapan_max));
    point(loc.x, loc.y, loc.z);
  }
}
