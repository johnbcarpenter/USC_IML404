// Knight Rider 2 with a Potentiometer...
// https://www.arduino.cc/en/Tutorial/KnightRider (notes below)
// https://www.arduino.cc/en/tutorial/potentiometer

int pinArray[] = {2, 3, 4, 5, 6, 7};
int count = 0;
int timer = 100;

// potentiometer
int potPin = 2;    // select the input pin for the potentiometer

void setup(){
  // we make all the declarations at once
  for (int count=0;count<6;count++) {
    pinMode(pinArray[count], OUTPUT);
  }
}

void loop() {
  timer = analogRead(potPin);    // read the value from the sensor  
   
  for (count=0;count<5;count++) {
   digitalWrite(pinArray[count], HIGH);
   delay(timer);
   digitalWrite(pinArray[count + 1], HIGH);
   delay(timer);
   digitalWrite(pinArray[count], LOW);
   delay(timer*2);
  }

  timer = analogRead(potPin);    // read the value from the sensor 

  for (count=5;count>0;count--) {
   digitalWrite(pinArray[count], HIGH);
   delay(timer);
   digitalWrite(pinArray[count - 1], HIGH);
   delay(timer);
   digitalWrite(pinArray[count], LOW);
   delay(timer*2);
  }

}

/* Knight Rider 3
 * --------------
 *
 * This example concentrates on making the visuals fluid.
 *
 *
 * (cleft) 2005 K3, Malmo University
 * @author: David Cuartielles
 * @hardware: David Cuartielles, Aaron Hallborg
 */
