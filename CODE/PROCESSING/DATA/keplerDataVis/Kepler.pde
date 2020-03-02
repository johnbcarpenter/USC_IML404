class Kepler {
  Table table;

  int star_count;
  PVector [] star_xyz; // array to store star positions
  PVector [] star_xyz_sphere; // array to store star positions projected onto a sphere
  PVector [] star_xyz_flat; // array to store star positions projected onto a sphere
  float [] star_rad; // array to store star radii
  float [] star_temp; // array to store star temperature
  int [] planet_disc; // array to store planet discovery year

  int ui_pt_ct; 
  PVector [] ui_xyz; // array to store star positions
  PVector [] ui_xyz_sphere; // array to store star positions projected onto a sphere
  PVector [] ui_xyz_flat; // array to store star positions projected onto a sphere

  Kepler(String _file_path) {
    table = loadTable(_file_path, "header");

    star_count = table.getRowCount();
    println(star_count + " total rows in table"); 

    star_xyz = new PVector [star_count];
    star_xyz_sphere = new PVector [star_count];
    star_xyz_flat = new PVector [star_count];
    star_rad = new float [star_count];
    star_temp = new float [star_count];
    planet_disc = new int [star_count];

    ui_pt_ct = int ((width/100.0) * (height/100.0));
    ui_xyz = new PVector [ui_pt_ct];
    ui_xyz_sphere = new PVector [ui_pt_ct];
    ui_xyz_flat = new PVector [ui_pt_ct];

    // in the data, each row is an exoplanet candidate...
    int indx = 0;
    for (TableRow row : table.rows()) {
      // look up data by the column header for each exoplanet... 
      //String pl_name = row.getString("pl_name"); 
      float st_dist = row.getFloat("st_dist"); // parsecs (pc)
      if (Float.isNaN(st_dist)) st_dist = 300.0; //println(row.getString("pl_name")); //st_rad = 1.0;
      float st_rad = row.getFloat("st_rad"); // sun radii
      if (Float.isNaN(st_rad)) st_rad = 1.0; // if there's no entry for a planet (isNotaNumber), set to 1.0
      st_rad /= 44350000.0; // convert solar radius to parsecs
      // MAGIC NUMBERS
      st_rad *= 100000000.0; // magnify by so we can see the stars
      if (st_rad > 10) st_rad = 10.0; // max star size, some stars are big
      st_dist *= 1.0; // 1 pc = 1 px, lol
      // END MAGIC NUMBERS
      float st_teff = row.getFloat("st_teff"); // K
      float ra = row.getFloat("ra"); // decimal degrees 0 - 360
      float dec = row.getFloat("dec"); // decimal degrees -90 - 90
      int pl_disc = row.getInt("pl_disc"); // year

      // feed all this data into some arrays rather than
      // continuously looking up info in the table... 
      ra *= PI/180.0; // degrees -> radians
      dec *= PI/180.0; // degrees -> radians
      star_xyz[indx] = cartesian (st_dist, dec, ra); // 
      star_xyz_sphere[indx] = cartesian (300.0, dec, ra); // sphere radius 300
      star_xyz_flat[indx] = new PVector (width*ra/TWO_PI-(width*0.5), (height*0.5)*dec/(PI*0.5), 0.01*st_dist); //

      star_rad[indx] = st_rad;
      star_temp[indx] = st_teff;
      planet_disc[indx] = pl_disc;
      indx++;
    }

    indx = 0;
    for (int x = 0; x <= width; x += 100) {
      for (int y = -int(height*0.5); y <= int(height*0.5); y+= 100) {
        ui_xyz[indx] = cartesian (x/width*TWO_PI, y/height, 1000);
        ui_xyz_sphere[indx] = cartesian (x/width*TWO_PI, y/height, 300);
        ui_xyz_flat[indx] = new PVector (x, y, 0);
      }
    }

    println(star_xyz.length + " vertices in the array");
  }

  void drawData() {
    // kepler data
    //beginShape(POINTS); // doesn't allow multiple strokes
    for (int i = 0; i < star_xyz.length; i++) {
      //println(star_xyz[i]);
      strokeWeight(star_rad[i]);
      //float h = map(planet_disc[i], 2000, 2019, 0, 0.9); // yr discovery
      float h = map(star_temp[i], 0, 10000, 1.0, 0.0); // yr discovery
      stroke(h, 1, 1, 1);

      PVector sp_to_net = PVector.sub(star_xyz_sphere[i], star_xyz[i]);
      PVector coord = PVector.add(star_xyz[i], sp_to_net.mult(sphere_fctr));

      PVector fl_to_net = PVector.sub(star_xyz_flat[i], coord);
      coord = PVector.add(coord, fl_to_net.mult(flat_fctr));

      point(coord.x, coord.y, coord.z);

      strokeWeight(0.5);

      if (flat_fctr < 0.999) {
        beginShape(LINES);
        stroke(h, 1, 1, 0.0);
        vertex(0, 0, 0);
        stroke(h, 1, 1, 0.4*(1.0-flat_fctr));
        vertex(coord.x, coord.y, coord.z);
        endShape();
      }
    }
  }

  // cartesian calculations from http://www.astronexus.com/a-a/positions
  // delta = declination, alpha = right ascension
  PVector cartesian (float dist, float delta, float alpha) {
    float x = dist * cos(delta) * cos(alpha);
    float y = dist * cos(delta) * sin(alpha);
    float z = dist * sin(delta);

    return new PVector (x, y, z);
  }
}
