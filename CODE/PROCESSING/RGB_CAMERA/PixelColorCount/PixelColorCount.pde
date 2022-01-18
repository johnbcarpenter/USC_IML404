size(1058, 460); // must be the same size as your image

PImage img = loadImage("Screen.png");
image(img, 0, 0);

// color you're looking for
int search_r = 230; // out of 255
int search_g = 95;// out of 255
int search_b = 98;// out of 255
int how_close = 1; // 0 or 1 is exactly that color, ~10 would be close to that color

int number_of_pixels = 0;

for (int x = 0; x < width; x++) {
  for (int y = 0; y < width; y++) {
    color c = get(x, y);

    float r = red(c);
    float g = green(c);
    float b = blue(c);

    if (abs(r-search_r) < how_close && abs(g-search_g) < how_close && abs(b-search_b) < how_close){
      number_of_pixels++; // add 1 more pixel that fits this search
    }
  }
}
println(number_of_pixels);
