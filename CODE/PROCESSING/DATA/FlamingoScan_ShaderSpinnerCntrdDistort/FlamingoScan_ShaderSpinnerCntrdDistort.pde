// 3D scan data from the Standerd Cyborg Capture App
// converte from PLY -> CSV
// https://www.standardcyborg.com/products

// code below based on the loadTable() \ Language (API) \ Processing 3+ example
// at https://processing.org/reference/loadTable_.html

Table table; // how we load the data into processing

PVector [] locs; // store all the point locations
color [] locs_cols; // store all the point colors

PVector avg_loc;

Spinner spin;
PShader point_shader;

void setup() {
  size(1280, 720, P3D);
  table = loadTable("FlamingoScan.csv", "header"); // load the data, "header" indicates
  // there's a row at the top of the data file that indicates what the columns are.
  // note: this csv file must be added to the sketch and located in the "data" folder

  int row_ct = table.getRowCount(); // how many rows of data there are -- minus the "header"
  println(row_ct + " total rows in table");
  locs = new PVector [row_ct];
  locs_cols = new color [row_ct];

  avg_loc = new PVector();

  int cur_ct = 0;
  // loop through all the rows of data in the table
  for (TableRow row : table.rows()) {
    // look up data by the column header...
    float x = row.getFloat("x");
    float y = row.getFloat("y");
    float z = row.getFloat("z");
    int r = row.getInt("red");
    int g = row.getInt("green");
    int b = row.getInt("blue");

    locs[cur_ct] = new PVector (x, y, z);
    locs[cur_ct].mult(1000.0); // scale up by 1000
    //println(locs[cur_ct]);
    locs_cols[cur_ct] = color (r, g, b);
    avg_loc.add(locs[cur_ct]);

    cur_ct++;
  }

  avg_loc.div(cur_ct+1);

  // subtract the avg_loc from all the point locations
  for (int i = 0; i < locs.length; i++) {
    locs[i].sub(avg_loc);
  } // this centers the data



  // DO A WEIRD DISTORTION BASED ON Z
  //for (int i = 0; i < locs.length; i++) {
  //  if (locs[i].x < 100) {
  //    locs[i].z += 400;
  //  }
  //}

  // TWIRLY VERSION
  //for (int i = 0; i < locs.length; i++) {
  //  locs[i].z += 60.0*sin(TWO_PI*locs[i].x/100.0);
  //}

  // NOISE VERSION
  for (int i = 0; i < locs.length; i++) {
    locs[i].z += 400.0*noise(locs[i].x/40.0);
    //locs[i].y += 400.0*noise(locs[i].x/100.0);
  }


  spin = new Spinner ();
  point_shader = loadShader("pointfrag.glsl", "pointvert.glsl");
}

void draw() {
  background(255);

  spin.update();
  spin.PushSpinnerMatrix();

  rotateZ(-PI*0.5); // orient the flamingo upright to start with
  //translate(-avg_loc.x, - avg_loc.y, -avg_loc.z); // center the data

  shader(point_shader, POINTS);

  // draw all the points
  beginShape(POINTS);
  strokeWeight(4);
  float scale = 1.0; //random(1, 2);
  for (int i = 0; i < locs.length; i++) {
    stroke(locs_cols[i], 20);
    vertex(locs[i].x*scale, locs[i].y*scale, locs[i].z*scale);
  }
  endShape();

  //for (int i = 0; i < locs.length; i++) {
  //  stroke(locs_cols[i], 20);
  //  line(0, 0, 0, locs[i].x, locs[i].y, locs[i].z);
  //}


  spin.PopSpinnerMatrix();
}

void mousePressed() {
  spin.mousePressed();
}
void mouseDragged() {
  spin.mouseDragged();
}
void mouseReleased() {
  spin.mouseReleased();
}
void keyPressed() {
  spin.keyPressed(key);
}
