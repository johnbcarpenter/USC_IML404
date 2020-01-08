/*

 Charles Fried - 2017
 ANN Tutorial 
 Part #2
 
 NETWORK
 
 This class is for the neural network, which is hard coded with three layers: input, hidden and output
 
 */


ArrayList connec = new ArrayList();
ArrayList conStr = new ArrayList();

class Network {

  Neuron [] input_layer;
  Neuron [] hidden_layer;
  Neuron [] output_layer;
  int bestIndex = 0;

  int inp_lyr_grid_ct;
  int hid_lyr_grid_ct;

  float GRID_SIZE = NEURON_SIZE*1.5;

  Network(int inputs, int hidden, int outputs) {

    input_layer = new Neuron [inputs];
    hidden_layer = new Neuron [hidden];
    output_layer = new Neuron [outputs];

    for (int i = 0; i < input_layer.length; i++) {
      input_layer[i] = new Neuron();
    }

    for (int j = 0; j < hidden_layer.length; j++) {
      hidden_layer[j] = new Neuron(input_layer);
    }

    for (int k = 0; k < output_layer.length; k++) {
      output_layer[k] = new Neuron(hidden_layer);
    }

    inp_lyr_grid_ct = int (sqrt(input_layer.length));
    hid_lyr_grid_ct = int (sqrt(hidden_layer.length));
  }

  void respond(Card card) {

    for (int i = 0; i < input_layer.length; i++) {
      input_layer[i].output = card.inputs[i];
    }
    // now feed forward through the hidden layer
    for (int j = 0; j < hidden_layer.length; j++) {
      hidden_layer[j].respond();
    }
    for (int k = 0; k < output_layer.length; k++) {
      output_layer[k].respond();
    }
  }

  void display() {

    drawCon();

    // Draw the input layer
    for (int i = 0; i < input_layer.length; i++) {
      pushMatrix();
      translate(INPUT_LYR_CNTR.x - inp_lyr_grid_ct*GRID_SIZE*0.5 + (i%inp_lyr_grid_ct) * GRID_SIZE, 
        INPUT_LYR_CNTR.y - inp_lyr_grid_ct*GRID_SIZE*0.5 + (i/inp_lyr_grid_ct) * GRID_SIZE);
      input_layer[i].display();
      popMatrix();
    }

    // Draw the hidden layer
    for (int j = 0; j < hidden_layer.length; j++) {
      pushMatrix();
      translate(
        HIDDEN_LYR_CNTR.x - hid_lyr_grid_ct*GRID_SIZE*0.5 + (j%hid_lyr_grid_ct)*GRID_SIZE, 
        HIDDEN_LYR_CNTR.y - hid_lyr_grid_ct*GRID_SIZE*0.5 + (j/hid_lyr_grid_ct)*GRID_SIZE);
      hidden_layer[j].display();
      popMatrix();
    }

    // Draw the output layer
    float [] resp = new float [output_layer.length];
    float respTotal = 0.0;
    for (int k = 0; k < output_layer.length; k++) {
      resp[k] = output_layer[k].output;
      respTotal += resp[k]+1;
    }
    for (int k = 0; k < output_layer.length; k++) {
      pushMatrix();
      translate(OUTPUT_LYR_CNTR.x, 
        OUTPUT_LYR_CNTR.y - 10*GRID_SIZE*0.5 + (k%10) * GRID_SIZE);
      output_layer[k].display();
      fill(150);
      strokeWeight(sq(output_layer[k].output)/2);
      line(12, 0, 25, 0);
      text(k%10, 40, 5);
      text(nfc(((output_layer[k].output+1)/respTotal)*100, 2) + "%", 55, 5);
      popMatrix();
      strokeWeight(1);
    }
    float best = -1.0;
    for (int i =0; i < resp.length; i++) {
      if (resp[i]>best) {
        best = resp[i];
        bestIndex = i;
      }
    }
    //println(best);
    if (totalTrain > 0 || totalTest > 0) {
      // circle the number with the greatest confidence
      //stroke(120);
      //noFill();
      //ellipse(OUTPUT_LYR_CNTR.x, OUTPUT_LYR_CNTR.y - 10*GRID_SIZE*0.5 + (bestIndex%10) * GRID_SIZE,
      //  NEURON_SIZE*1.2, NEURON_SIZE*1.2);
      // draw an arrow
      fill(120);
      noStroke();
      float tri_x = OUTPUT_LYR_CNTR.x + 10;
      float tri_y = OUTPUT_LYR_CNTR.y - 10*GRID_SIZE*0.5 + (bestIndex%10) * GRID_SIZE;
      triangle (tri_x, tri_y, tri_x+5, tri_y-3, tri_x+5, tri_y+3);
      
      // circle the correct number 
      int card_label = 0;
      if (SYSTEM_TRAINING) card_label = training_set[trainCard].output;
      else card_label = testing_set[testCard].output;
      stroke(0, 255, 0);
      noFill();
      ellipse(OUTPUT_LYR_CNTR.x, OUTPUT_LYR_CNTR.y - 10*GRID_SIZE*0.5 + card_label * GRID_SIZE, 
        NEURON_SIZE*1.2, NEURON_SIZE*1.2);
    }
  }

  void train(float [] outputs) {
    // adjust the output layer
    for (int k = 0; k < output_layer.length; k++) {
      output_layer[k].setError(outputs[k]);
      output_layer[k].train();
    }
    float best = -1.0;
    for (int i = 0; i < output_layer.length; i++) {
      if (output_layer[i].output > best) bestIndex = i;
    }
    // propagate back to the hidden layer
    for (int j = 0; j < hidden_layer.length; j++) {
      hidden_layer[j].train();
    }

    // The input layer doesn't learn: it is the input and only that
  }

  void drawCon() {
    // draw connection strengths from input neurons
    for (int i = 0; i < hidden_layer.length; i++) {
      float [] res = hidden_layer[i].getStrength();
      stroke(200);
      strokeWeight(pow(10, res[1])/35);
      line(
        HIDDEN_LYR_CNTR.x - hid_lyr_grid_ct*GRID_SIZE*0.5 + (i%hid_lyr_grid_ct) * GRID_SIZE, // hidden x
        HIDDEN_LYR_CNTR.y - hid_lyr_grid_ct*GRID_SIZE*0.5 + (i/hid_lyr_grid_ct) * GRID_SIZE, // hidden y
        INPUT_LYR_CNTR.x - inp_lyr_grid_ct*GRID_SIZE*0.5 + (int(res[0])%inp_lyr_grid_ct) * GRID_SIZE, // input x
        INPUT_LYR_CNTR.y - inp_lyr_grid_ct*GRID_SIZE*0.5 + (int(res[0])/inp_lyr_grid_ct) * GRID_SIZE); // input y
    }

    for (int i = 0; i < output_layer.length; i++) {
      float [] res = output_layer[i].getStrength();
      stroke(res[1]*200);
      strokeWeight(pow(10, res[1])/35);
      line(
        OUTPUT_LYR_CNTR.x, // output x
        //(i%10) * height / 15.0 + height * 0.2, // output y
        OUTPUT_LYR_CNTR.y - 10*GRID_SIZE*0.5 + (i%10) * GRID_SIZE, 
        HIDDEN_LYR_CNTR.x - hid_lyr_grid_ct*GRID_SIZE*0.5 + (int(res[0])%hid_lyr_grid_ct) * GRID_SIZE, // hidden x
        HIDDEN_LYR_CNTR.y - hid_lyr_grid_ct*GRID_SIZE*0.5 + (int(res[0])/hid_lyr_grid_ct) * GRID_SIZE); // hidden y
    }

    strokeWeight(1);
  }
}
