size(640,640);

//// random
//for (int x = 0; x < width; x++){
//  for (int y = 0; y < height; y++){
//    //float n = noise(x,y);
//    float n = random(0,1);
//    stroke(255*n);
//    point(x,y);
//  }
//}

// perlin noise
float x_factor = 1.0; // 0.01;
float y_factor = 1.0; // 0.01;
for (int x = 0; x < width; x++){
  for (int y = 0; y < height; y++){
    //float n = noise(x,y);
    float n = noise(x*x_factor,y*y_factor);
    stroke(255*n);
    point(x,y);
  }
}
