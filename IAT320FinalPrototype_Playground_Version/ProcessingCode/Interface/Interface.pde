import processing.serial.*;

Serial myPort;
String valZ;
float angle;
float valueZ;

//timer
int second;
int holdTimerCount; 

//count
boolean isCount;
int repNumber = 0;
int holdTime = 0;

//PImage homepage;
PImage leg;
PImage finishBackground;
PImage homeBackground;
PImage patientBackground;
PImage doctorBackground;

static final int home = 0;
static final int patient = 1;
static final int doctor = 2;
static final int finish = 3;

int screenState;
PFont font;
PFont fontBold;

//Doctor Input Value
String docInputRep = "";
String docInputTime = "";
int repititions = 0;
int repTime = 0;
int docInputState = 1;

void setup(){
  size(1200,675);
  String portName = Serial.list()[3];
  myPort = new Serial(this, portName, 9600);
  font = createFont("HelveticaNeue-Medium-48.vlw",16);
  fontBold = createFont("HelveticaNeue-Bold-48.vlw", 16);
  
  //Timer
      int second = millis();


  //images
  leg = loadImage("img/leg.png");
  homeBackground = loadImage("img/homeBackground.png");
  homeBackground.resize(1200, 675);
  doctorBackground = loadImage("img/doctorBackground.png");
  doctorBackground.resize(1200,675);
  patientBackground = loadImage("img/patientBackground.png");
  patientBackground.resize(1200,675);
  finishBackground = loadImage("img/finishBackground.png");
  finishBackground.resize(1200,675);
  
  screenState = 0; // Set the screen state to home page
  
}

void draw(){
  background(255);
 
  //Switch State
  if(screenState == home){
    home(); 
  }else if(screenState == doctor){
    doctor();
  }else if(screenState == patient){
    patient();
  }else if(screenState == finish){
    finish();
  }
}

void home(){
  float buttonWidth = 250;
  float buttonHeight = 60;
  float rectRadius = 18;
  background(homeBackground);
  
  //Patient Button
  fill(24, 74, 110);
  noStroke();
  rect(60, 400, buttonWidth, buttonHeight, rectRadius);
  fill(255);
  textFont(font, 25);
  text("I'm the Patient", 100, 440);
  
  //Mouse Detection for Patient Button
  if(mouseX > 60 && mouseX < 60 + buttonWidth && mouseY > 400 && mouseY < 400 + buttonHeight){
    //Hovering Patient Button
    fill(171, 216, 247);
    noStroke();
    rect(60, 400, buttonWidth, buttonHeight, rectRadius);
    fill(255);
    textFont(font, 25);
    text("I'm the Patient", 100, 440);
  }
  
  //Doctor Button
  fill(24, 74, 110);
  noStroke();
  rect(60, 480, buttonWidth, buttonHeight, rectRadius);
  fill(255);
  textFont(font, 25);
  text("I'm the Doctor", 100, 520);
  
  //Mouse Detection for Doctor Button
    if(mouseX > 60 && mouseX < 60 + buttonWidth && mouseY > 480 && mouseY < 480 + buttonHeight){
    //Hovering Doctor Button
      fill(171, 216, 247);
      noStroke();
      rect(60, 480, buttonWidth, buttonHeight, rectRadius);
      fill(255);
      textFont(font, 25);
      text("I'm the Doctor", 100, 520);
  }
  
  //Mouse Detection for Doctor Page
  if(mousePressed){
    if(mouseX > 60 && mouseX < 60 + buttonWidth && mouseY > 400 && mouseY < 400 + buttonHeight){
      println("Click Patient Page");
      screenState = patient;
    }  
  }
  //Mouse Click Detection for Doctor Page
  if(mousePressed){
    if(mouseX > 60 && mouseX < 60 + buttonWidth && mouseY > 480 && mouseY < 480 + buttonHeight){
      println("Click Doctor Page");
      screenState = doctor;
    }  
  }
  
}

void doctor(){
  background(doctorBackground);
  fill(255);
  stroke(5);
  rect(80, 350, 250, 60, 18);
  rect(80, 520, 250, 60, 18);
  
  //Doctor Input Box
  fill(0);
  text(""+ docInputRep, 120, 390);
  text("" + docInputTime, 120, 560);
  
  //Reset Buttons
  fill(24, 74, 110);
  noStroke();
  rect(350, 365, 60, 30, 10);
  fill(255);
  textFont(font, 15);
  text("RESET", 358, 385);
  
  fill(24, 74, 110);
  noStroke();
  rect(350, 535, 60, 30, 10);
  fill(255);
  textFont(font, 15);
  text("RESET", 358, 555);
  
  //Mouse Detection for Reset Buttons
  if(mouseX > 350 && mouseX < 350 + 60 && mouseY > 365 && mouseY < 365 + 30){
      fill(171, 216, 247);
      noStroke();
      rect(350, 365, 60, 30, 10);
      fill(255);
      textFont(font, 15);
      text("RESET", 358, 385);
   }
   
   if(mousePressed){
     if(mouseX > 350 && mouseX < 350 + 60 && mouseY > 365 && mouseY < 365 + 30){
       docInputRep = "";
     }
   }
   
   if(mouseX > 350 && mouseX < 350 + 60 && mouseY > 535 && mouseY < 535 + 30){
      fill(171, 216, 247);
      noStroke();
      rect(350, 535, 60, 30, 10);
      fill(255);
      textFont(font, 15);
      text("RESET", 358, 555);
   }
   
   if(mousePressed){
     if(mouseX > 350 && mouseX < 350 + 60 && mouseY > 535 && mouseY < 535 + 30){
       docInputTime = "";
     }
   }
   
  //Back Button
  fill(24, 74, 110);
  noStroke();
  rect(80, 50, 60, 30, 10);
  fill(255);
  textFont(font, 15);
  text("BACK", 90, 70);
  
  if(mouseX > 80 && mouseX < 80 + 60 && mouseY > 50 && mouseY < 50 + 30){
      fill(171, 216, 247);
      noStroke();
      rect(80, 50, 60, 30, 10);
      fill(255);
      textFont(font, 15);
      text("BACK", 90, 70);
   }
   
   if(mousePressed){
     if(mouseX > 80 && mouseX < 80 + 60 && mouseY > 50 && mouseY < 50 + 30){
       screenState = home;
     }
   }
  
  
  //Enter Button
  fill(24, 74, 110);
  noStroke();
  rect(460, 515, 100, 50, 10);
  fill(255);
  textFont(font, 25);
  text("ENTER", 473, 548);
  
  if(mouseX > 460 && mouseX < 460 + 100 && mouseY > 515 && mouseY < 515 + 50){
    fill(171, 216, 247);
    noStroke();
    rect(460, 515, 100, 50, 10);
    fill(255);
    textFont(font, 25);
    text("ENTER", 473, 548);
  }
  if(mousePressed){
    if(mouseX > 460 && mouseX < 460 + 100 && mouseY > 515 && mouseY < 515 + 50){
      if(docInputRep != "" && docInputTime != ""){
        repititions = int(docInputRep);
        repTime = int(docInputTime);
        screenState = home;
      }
    }
  }
}

//Doctor Page Text Input
void keyPressed(){
  if(screenState == doctor){
    //use enter key to change the input box
    if(key == '\n'){
      docInputState +=1;
      if(docInputState >2){
        docInputState =1;
      }
    }
    if(docInputState ==1 && docInputRep.length() <=2){
      if(key == '1' || key == '2' || key == '3' || key == '4' || key == '5' || key == '6' || key == '7' ||
      key == '8' || key == '9' || key == '0'){
        docInputRep = docInputRep+key;
      }
    }else if(docInputState == 2 && docInputTime.length() <=0){
      if(key == '1' || key == '2' || key == '3' || key == '4' || key == '5' || key == '6' || key == '7' ||
      key == '8' || key == '9' || key == '0'){
        docInputTime = docInputTime+key;
      }
    }
  } 
}

void patient(){
  float thresholdLow = 3.0;
  float thresholdHigh = 9.0;
  background(patientBackground);
  
  //read data
  if(myPort.available() >0){
    valZ = myPort.readStringUntil('\n');
  }
  println(valZ);
  if(valZ != null){
    
    angle = map(float(valZ), -4, 10, PI/8, -PI/2 +PI/10);
    valueZ = float(valZ);
  }
  
  leg.resize(80, 230);
  pushMatrix();
  translate(400, 395);
  rotate(angle);
  image(leg,-30,-20);
  popMatrix();
  
  //Text Inform
  fill(0);
  textFont(fontBold, 25);
  text("/ " +repititions, 983, 225);
  
  fill(0);
  textFont(fontBold, 25);
  text("/" + repTime, 900, 435);
  
  //Number Change
  fill(243, 164, 115);
  textFont(fontBold, 30);
  text(repNumber, 940, 225);
  
  fill(243, 164, 115);
  textFont(fontBold, 30);
  text(holdTime, 880, 435);
  
  
  //Back Button
  fill(24, 74, 110);
  noStroke();
  rect(80, 50, 60, 30, 10);
  fill(255);
  textFont(font, 15);
  text("BACK", 90, 70);
  
  
  
  if(mouseX > 80 && mouseX < 80 + 60 && mouseY > 50 && mouseY < 50 + 30){
      fill(171, 216, 247);
      noStroke();
      rect(80, 50, 60, 30, 10);
      fill(255);
      textFont(font, 15);
      text("BACK", 90, 70);
   }
   
   if(mousePressed){
     if(mouseX > 80 && mouseX < 80 + 60 && mouseY > 50 && mouseY < 50 + 30){
       screenState = home;
       repNumber = 0;
       holdTime = 0;
     }
   }
   
    
    //count timer
    if(valueZ > thresholdHigh){
      if(millis() > second + 1000){
        holdTimerCount +=1;
        if(holdTimerCount / 60 >= 1){
          holdTime += 1;
          holdTimerCount = 0;
        }
      }
    } else{
      holdTimerCount = 0;
      holdTime = 0;
    }
    
    //count Rep Number
    if(valueZ > thresholdHigh && isCount == false && holdTime >= repTime){
      repNumber = repNumber+1;
      isCount = true;
    }else if(valueZ < thresholdLow){
      isCount = false;
    }   
    
    //go to the finish page
    if(repNumber != 0 && repNumber == repititions){
      repNumber = 0;
      holdTime = 0;
      screenState = finish;
    }
}

void finish(){
  background(finishBackground);
  
  //count timer
  if(millis() > second + 1000){
    holdTimerCount +=1;
    if(holdTimerCount / 60 >= 1){
      holdTime += 1;
      holdTimerCount = 0;
      if(holdTime >= 5){
        screenState = home;
      }
    }
  }
}
  
  
  
  
  
  
  
  
  
  
  
  
  
  

  
 
 // text("how many you did:" + number, width/2, 20);
 // textSize(20);
 // //timer
 // // if (millis() > timer) {
 // //  x += 1;
 // //  timer += 1000;
 // //}
 // println(x);
 // //warning message
 // float legPos = valueZ;
 // println(second());
 // if (legPos > 1 && legPos <2){
 //   if (x >= 2){
 //    text("please move your damn leg upper, thank you", width-600, height/2);
 //   }
 // }
 // if (legPos > 2 && legPos <3){
 //   if (x >= 2){
 //    text("please move your damn leg upper, thank you", width-600, height/2);
 //   }
 // }
 // if (legPos > 3 && legPos <4){
 //   if (x >= 2){
 //    text("please move your damn leg upper, thank you", width-600, height/2);
 //   }
 // }
 // if (legPos > 4 && legPos <5){
 //   if (x >= 2){
 //    text("please move your damn leg upper, thank you", width-600, height/2);
 //   }
 // }
 // if (legPos > 5 && legPos <6){
 //   if (x >= 2){
 //    text("please move your damn leg upper, thank you", width-600, height/2);
 //   }
 // }
 // if (legPos > 6 && legPos <7){
 //   if(x>2){
 //    text("please move your damn leg upper, thank you", width-600, height/2);
 //   }
 // }
