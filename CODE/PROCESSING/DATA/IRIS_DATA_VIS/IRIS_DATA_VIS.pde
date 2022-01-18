import processing.pdf.*;

size(800,600, PDF, "IRIS_DATA.pdf");
background(255,255,255);

noStroke(); // no outline around the ellipse
Table data = loadTable("iris_data.csv", "header");
for (TableRow row : data.rows()){ //loop through ever row in data
  float sepal_length = row.getFloat("sepal_length");
  float sepal_width = row.getFloat("sepal_width");
  float petal_length = row.getFloat("petal_length");
  float petal_width = row.getFloat("petal_width");
  String flower_class = row.getString("class");
  
  println(sepal_length, sepal_width, petal_length, petal_width, flower_class);
  
  float circ_diam = 10.0; // variable that controls ellipse size
  
  if (flower_class.equals("Iris-setosa")){ // conditional statement
    circ_diam = 20.0;
  } else if (flower_class.equals("Iris-versicolor")){
    circ_diam = 5.0; 
  } else if (flower_class.equals("Iris-virginica")){
    circ_diam = 10.0;
  }
  
  float s_x = sepal_length*100;
  float s_y = height - sepal_width*100;
  fill(100,0,255,100); // r,g,b,a
  ellipse(s_x,s_y, circ_diam,circ_diam);
  
  float p_x = petal_length*100;
  float p_y = height - petal_width*100;
  fill(255,0,0,100);
  ellipse(p_x,p_y, circ_diam,circ_diam);
}
