import processing.serial.*;
import ddf.minim.*;

Serial myPort;
String valZ;
float angle;
float valueZ;
//sound File
Minim minim;
AudioPlayer rep;
AudioPlayer congrats;
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
  
  minim = new Minim(this);
  rep = minim.loadFile("rep.mp3");
  congrats = minim.loadFile("congrats.mp3");
  
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
  float buttonHeight = 50;
  float rectRadius = 8;
  background(homeBackground);
  
  //Patient Button
  fill(88,73,191);
  noStroke();
  rect(width - buttonWidth - 60, 480, buttonWidth, buttonHeight, rectRadius);
  fill(255);
  textFont(font, 25);
  text("I'm the Patient", width - buttonWidth - 20, 515);
  
  //Mouse Detection for Patient Button
  if(mouseX > width - buttonWidth - 60 && mouseX < width - buttonWidth - 60
  + buttonWidth && mouseY > 480 && mouseY < 480 + buttonHeight){
    //Hovering Patient Button
    fill(171, 216, 247, 125);
    noStroke();
    rect(width - buttonWidth - 60, 480, buttonWidth, buttonHeight, rectRadius);
    fill(255);
    textFont(font, 25);
    text("I'm the Patient", width - buttonWidth - 20, 515);
  }
  
  //Doctor Button
  fill(88,73,191);
  noStroke();
  rect(60, 480, buttonWidth, buttonHeight, rectRadius);
  fill(255);
  textFont(font, 25);
  text("I'm the Doctor", 100, 515);
  
  //Mouse Detection for Doctor Button
    if(mouseX > 60 && mouseX < 60 + buttonWidth && mouseY > 480 && mouseY < 480 + buttonHeight){
    //Hovering Doctor Button
      fill(171, 216, 247, 125);
      noStroke();
      rect(60, 480, buttonWidth, buttonHeight, rectRadius);
      fill(255);
      textFont(font, 25);
      text("I'm the Doctor", 100, 515);
  }
  
  //Mouse Detection for Doctor Page
  if(mousePressed){
    if(mouseX > width - buttonWidth - 60 && mouseX < width - buttonWidth - 60
  + buttonWidth && mouseY > 480 && mouseY < 480 + buttonHeight){
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
  rect(145, 260, 350, 50, 8);
  rect(145, 385, 350, 50, 8);
  
  //Doctor Input Box
  fill(0);
  text(""+ docInputRep, 200, 295);
  text("" + docInputTime, 200, 420);
  
  //Reset Buttons
  fill(88,73,191);
  noStroke();
  rect(410, 270, 60, 30, 8);
  fill(255);
  textFont(font, 15);
  text("Reset", 418, 290);
  
  fill(88,73,191);
  noStroke();
  rect(410, 395, 60, 30, 8);
  fill(255);
  textFont(font, 15);
  text("Reset", 418, 415);
  
  //Mouse Detection for Reset Buttons
  if(mouseX > 410 && mouseX < 410 + 60 && mouseY > 270 && mouseY < 270 + 30){
      fill(171, 216, 247,125);
      noStroke();
      rect(410, 270, 60, 30, 8);
      fill(255);
      textFont(font, 15);
      text("Reset", 418, 290);
   }
   
   if(mousePressed){
     if(mouseX > 410 && mouseX < 410 + 60 && mouseY > 270 && mouseY < 270 + 30){
       docInputRep = "";
     }
   }
   
   if(mouseX > 410 && mouseX < 410 + 60 && mouseY > 395 && mouseY < 395 + 30){
      fill(171, 216, 247,125);
      noStroke();
      rect(410, 395, 60, 30, 8);
      fill(255);
      textFont(font, 15);
      text("Reset", 3418, 415);
   }
   
   if(mousePressed){
     if(mouseX > 410 && mouseX < 410 + 60 && mouseY > 395 && mouseY < 395 + 30){
       docInputTime = "";
     }
   }
   
  //Back Button
  fill(88,73,191);
  noStroke();
  rect(80, 50, 60, 30, 10);
  fill(255);
  textFont(font, 15);
  text("Back", 90, 70);
  
  if(mouseX > 80 && mouseX < 80 + 60 && mouseY > 50 && mouseY < 50 + 30){
      fill(171, 216, 247, 125);
      noStroke();
      rect(80, 50, 60, 30, 10);
      fill(255);
      textFont(font, 15);
      text("Back", 90, 70);
   }
   
   if(mousePressed){
     if(mouseX > 80 && mouseX < 80 + 60 && mouseY > 50 && mouseY < 50 + 30){
       screenState = home;
     }
   }
  
  
  //Enter Button
  fill(88,73,191);
  noStroke();
  rect(390, 515, 100, 50, 8);
  fill(255);
  textFont(font, 25);
  text("Enter", 403, 548);
  
  if(mouseX > 390 && mouseX < 390 + 100 && mouseY > 515 && mouseY < 515 + 50){
    fill(171, 216, 247, 125);
    noStroke();
    rect(390, 515, 100, 50, 8);
    fill(255);
    textFont(font, 25);
    text("Enter", 403, 548);
  }
  if(mousePressed){
    if(mouseX > 390 && mouseX < 390 + 100 && mouseY > 515 && mouseY < 515 + 50){
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
  float thresholdHigh = 8.0;
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
  
  leg.resize(70, 230);
  pushMatrix();
  translate(450, 375);
  rotate(angle);
  image(leg,-30,-15);
  popMatrix();
  
  //Text Inform
  fill(0);
  textFont(fontBold, 25);
  text(repititions, 928, 310);
  
  fill(0);
  textFont(fontBold, 25);
  text(repTime, 928, 490);
  
  //Number Change
  fill(243, 164, 115);
  textFont(fontBold, 30);
  text(repNumber, 830, 310);
  
  fill(243, 164, 115);
  textFont(fontBold, 30);
  text(holdTime, 830, 490);
  
  
  //Back Button
  fill(88,73,191);
  noStroke();
  rect(80, 50, 60, 30, 10);
  fill(255);
  textFont(font, 15);
  text("Back", 90, 70);
  
  
  
  if(mouseX > 80 && mouseX < 80 + 60 && mouseY > 50 && mouseY < 50 + 30){
      fill(171, 216, 247, 125);
      noStroke();
      rect(80, 50, 60, 30, 10);
      fill(255);
      textFont(font, 15);
      text("Back", 90, 70);
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
      if(repititions == 0 || repNumber != repititions){ 
        rep.rewind();
        rep.play();
      }
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
  congrats.play();
  
  //count timer
  if(millis() > second + 1000){
    holdTimerCount +=1;
    if(holdTimerCount / 60 >= 1){
      holdTime += 1;
      holdTimerCount = 0;
      if(holdTime >= 5){
        congrats.pause();
        congrats.rewind();
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
