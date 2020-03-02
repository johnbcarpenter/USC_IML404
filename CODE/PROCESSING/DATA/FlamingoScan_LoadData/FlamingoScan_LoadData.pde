// 3D scan data from the Standerd Cyborg Capture App 
// converte from PLY -> CSV
// https://www.standardcyborg.com/products

// code below based on the loadTable() \ Language (API) \ Processing 3+ example
// at https://processing.org/reference/loadTable_.html

Table table; // how we load the data into processing

PVector [] locs; // store all the point locations
color [] locs_cols; // store all the point colors

void setup() {
  size(1280, 720, P3D);
  table = loadTable("FlamingoScan.csv", "header"); // load the data, "header" indicates
  // there's a row at the top of the data file that indicates what the columns are.
  // note: this csv file must be added to the sketch and located in the "data" folder

  int row_ct = table.getRowCount(); // how many rows of data there are -- minus the "header"
  println(row_ct + " total rows in table"); 
  locs = new PVector [row_ct];
  locs_cols = new color [row_ct];

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
    locs[cur_ct].mult(1000.0); // scale up by 100
    //println(locs[cur_ct]);
    locs_cols[cur_ct] = color (r, g, b);
    cur_ct++;
  }
}

void draw() {
  background(255);
  pushMatrix();
  translate(width*0.5, height*0.5);
  rotateZ(-PI*0.5); // orient the data 
  rotateX(millis()*0.001); // rotate the system slowly based on time

  // draw all the points
  beginShape(POINTS);
  strokeWeight(2);
  for (int i = 0; i < locs.length; i++) {
    stroke(locs_cols[i]);
    vertex(locs[i].x, locs[i].y, locs[i].z);
  }
  endShape();
  popMatrix();
}
