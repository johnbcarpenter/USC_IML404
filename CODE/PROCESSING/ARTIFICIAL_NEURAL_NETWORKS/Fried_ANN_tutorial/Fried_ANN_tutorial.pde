/*
 Minorly adapted from...
 
 Charles Fried - 2017
 ANN Tutorial 
 
 MAIN TAB
 
 Original from Alasdair Turner (c) 2009
 Free software: you can redistribute this program and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 
 */


int totalTrain = 0;
int totalTest = 0;
int totalRight = 0;
float sucess = 0;
int testCard = 0;
int trainCard = 0;

Network neuralnet;
Button trainB, testB;

float NEURON_SIZE = 10.0;
PVector INPUT_LYR_CNTR;
PVector HIDDEN_LYR_CNTR;
PVector OUTPUT_LYR_CNTR;

boolean SYSTEM_TRAINING = false;

void setup() {
  size(1000, 400);
  
  INPUT_LYR_CNTR = new PVector(width*0.15,height*0.5);
  HIDDEN_LYR_CNTR = new PVector(width*0.4,height*0.5);
  OUTPUT_LYR_CNTR = new PVector(width*0.75,height*0.5);
  
  setupSigmoid();
  loadData();
  neuralnet = new Network(196, 49, 10);
  smooth();
  stroke(150);

  trainB = new Button(width*0.06, height*0.9, "Train");
  testB = new Button(width*0.11, height*0.9, "Test");
}

void draw() {

  background(255);
  neuralnet.display();
  //blendMode(ADD);

  int UI_FILL = 100;
  int A_OFF = 100;

  fill(UI_FILL);
  text("Total train: " + totalTrain, width*0.32, height*0.89);
  text("Total test: " + totalTest, width*0.32, height*0.93);

  if (totalTest>0) { 
    sucess = float(totalRight)/float(totalTest);
    text("Success rate: " + nfc(sucess, 2), width*0.44, height*0.89);
  } else {
    fill(UI_FILL, A_OFF);
    text("Success rate: N/A", width*0.44, height*0.89);
  }

  // DRAW THE UI DIFFERENTLY BASED ON TRAINING v TESTING
  fill(UI_FILL);
  if (testCard < 0) { // we're training
    text("Train card: " + trainCard, width*0.18, height*0.93);
    fill(UI_FILL, A_OFF);
    text("Test card: N/A", width*0.18, height*0.89);
    fill(UI_FILL);
    text("Card label: " + training_set[trainCard].output, width*0.44, height*0.93);
  } else { // we're testing
    fill(UI_FILL, A_OFF);
    text("Train card: N/A", width*0.18, height*0.93);
    fill(UI_FILL);
    text("Test card: #" + testCard, width*0.18, height*0.89);

    if (totalTrain == 0)
      text("Card label: N/A", width*0.44, height*0.93);
    else
      text("Card label: " + testing_set[testCard].output, width*0.44, height*0.93);
  }

  trainB.display();
  testB.display();
}

void mousePressed() {
  if (trainB.hover()) {
    SYSTEM_TRAINING = true;
    for (int i = 0; i < 500; i++) {
      testCard = -1; // testing not active
      trainCard = (int) floor(random(0, training_set.length));
      neuralnet.respond(training_set[trainCard]);
      neuralnet.train(training_set[trainCard].outputs);
      totalTrain++;
    }
  } else if (testB.hover()) {
    SYSTEM_TRAINING = false;
    trainCard = -1; // training not active
    testCard = (int) floor(random(0, testing_set.length));
    neuralnet.respond(testing_set[testCard]);
    neuralnet.display();
    if (neuralnet.bestIndex == testing_set[testCard].output) totalRight ++;
    totalTest ++;
  }
  redraw();
}
