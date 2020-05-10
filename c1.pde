//void setup() {
//  size(500,260);
//  background(0);
//}
//void draw() {
//   fill(255);
//   ellipse(mouseX,mouseY,30,30);
//}

/////////////////////////////////////////

//void setup() {
//  size(500,260);
//  background(0);
//}

//void draw(){
//  if(mousePressed){
//    dd();
//  }
//}

//void dd(){
//   fill(random(255), random(255), random(255));
//   float d = random(20);
//   ellipse(mouseX,mouseY,d,d);
//}


/////////////////////////////////////////

//void settings() {
//}

//PImage img;
//void setup() {
//  img = loadImage("01.jpg");
//  size(687, 364);
//  background(0);
//}
//void draw() {
//  noStroke();
//  PVector pos = new PVector(mouseX, mouseY);
//  fill(img.get((int)pos.x, (int)pos.y));
//  float d = random(10, 20);
//  ellipse(pos.x, pos.y, d, d);
//}

/////////////////////////////////////////

//PImage img;

//void settings() {
//  img = loadImage("01.jpg");
//  size(img.width, img.height);
//}


//void setup() {
//  background(255);
//}


//void draw() {
//  color c ;
//  noStroke();
//  for (int i = 0; i<150; i++) {
//    PVector pos = new PVector(mouseX+random(-random(50),random(50)), mouseY+random(-random(50),random(50)));
//    c = img.get((int)pos.x, (int)pos.y);
//    fill(c);
//    float d = random(1,10);
//    if(mousePressed)
//    ellipse(pos.x, pos.y, d, d);
//  }
//}


/////////////////////////////////////////

//import processing.video.*;
//Capture cam;

//void settings() {
//  cam = new Capture(this, 640, 480);
//  size(cam.width, cam.height);
//}

//void setup() {
//  cam.start();
//  background(255);
//}

//void draw() {
//  color c ;
//  noStroke();
//  for (int i = 0; i<150; i++) {
//    PVector pos = new PVector(mouseX+random(-random(50),random(50)), mouseY+random(-random(50),random(50)));
//    c = cam.get((int)pos.x, (int)pos.y);
//    fill(c);
//    float d = random(1,10);
//    ellipse(pos.x, pos.y, d, d);
//  }

//}

//void captureEvent(Capture c) {
//  c.read();
//}


/////////////////////////////////////////

//import processing.video.*;
//Movie  mov;

//void setup() {
//  mov = new Movie(this, "01.mov"); 
//  size( 640, 696);
//  mov.loop();
//  background(255);
//}

//void draw() {
//  noStroke();
//  for (int i = 0; i<150; i++) {
//    PVector pos = new PVector(mouseX+random(-random(50), random(50)), mouseY+random(-random(50), random(50)));
//    fill(mov.get((int)pos.x, (int)pos.y));
//    float d = random(1, 10);
//    ellipse(pos.x, pos.y, d, d);
//  }
//  image(mov,0,348);
//}

//void movieEvent(Movie m) {
//  m.read();
//}


/////////////////////////////////////////



//画笔外部声音加文字加录像

import processing.video.*;
Movie  mov;

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
BeatDetect beat;
AudioInput input;


PImage showimg;
float voice;

void setup() {
  mov = new Movie(this, "01.mov"); 
  size( 640, 696);
  mov.loop();

  minim = new Minim(this);
  input = minim.getLineIn();
  beat = new BeatDetect();

  background(255);
  voice = 40;
}


void draw() {
  beat.detect(input.mix);
  if ( beat.isOnset() ) {
    voice = 220;
  } 
  if(voice < 1) voice = 1;

  voice*=0.88;

  color c ;
  noStroke();
  for (int i = 0; i<30+voice; i++) {
    PVector pos = new PVector(mouseX+random(-random(20+voice), random(20+voice)), mouseY+random(-random(20+voice), random(20+voice)));
    c = mov.get((int)pos.x, (int)pos.y);
    fill(c);
    float d = random(3,9);
    ellipse(pos.x, pos.y, d, d);
  }

  showimg = mov;
  image(showimg, 0, 348);
}

void movieEvent(Movie m) {
  m.read();
}
