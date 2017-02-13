// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Flock class
// Does very little, simply manages the ArrayList of all the boids

class Flock {
  ArrayList<Boid> boids; // An ArrayList for all the boids

  Flock() {
    boids = new ArrayList<Boid>(); // Initialize the ArrayList
  }

  void run() {
    for (Boid b : boids) {
      b.run(boids);  // Passing the entire list of boids to each boid individually 
    }
    
    for (int i = boids.size() - 1; i >= 0; i--) {
      Boid b = boids.get(i);
      if (b.lifespan <= 0)
        boids.remove(i);
    }
  }

  void addBoid(Boid b) {
    boids.add(b);
  }

}