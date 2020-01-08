boolean draw_rect = false;
int draw_rect_time_start;
int draw_rect_length = 4000; //ms

void setup() {
  size(640, 640);
}


void draw() {
  background(120);
  
  if (millis() - draw_rect_time_start > draw_rect_length)
    draw_rect = false;

  if (draw_rect) {
    rect (100, 100, 100, 100);
  }
}

void mousePressed() {
  draw_rect = true;
  draw_rect_time_start = millis();
}
