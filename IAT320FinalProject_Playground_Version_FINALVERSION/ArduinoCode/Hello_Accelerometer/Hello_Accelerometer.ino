
#include <Adafruit_CircuitPlayground.h>

float X, Y, Z;
const int numReadings = 10;

float readingsX[numReadings];      // the readings from the analog input
int readXIndex = 0;              // the index of the current reading
float totalX = 0;                  // the running total
float averageX = 0;                // the average

void setup() {
  Serial.begin(9600);
  CircuitPlayground.begin();
  for (int thisReading = 0; thisReading < numReadings; thisReading++) {
    readingsX[thisReading] = 0;
  }
}

void loop() {
  //Readings from X
  totalX = totalX - readingsX[readXIndex];
  readingsX[readXIndex] = CircuitPlayground.motionZ();
  totalX = totalX + readingsX[readXIndex];
  readXIndex = readXIndex + 1;

  if (readXIndex >= numReadings) {
    readXIndex = 0;
  }

  // calculate the average:
  averageX = totalX / numReadings;
  Serial.println(averageX);
  delay(50);   
}
