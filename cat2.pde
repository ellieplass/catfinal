import ddf.minim.*;
Minim minim;
AudioPlayer purr;
AudioPlayer meow;

int happiness = 200;
int timer;
int timeStamp;
int catX = 100; 
PImage cat;
PImage sunflower;
PImage rainy;
PFont instructions; 
PFont reg;
boolean showpic = true;
boolean lampon;
boolean foodon = false;
boolean show_instructions = true;


void setup(){
  size(700, 500);
//fonts//
    instructions= createFont("slkscr.ttf", 15);
    reg = createFont("acme.ttf", 15);
//images//
    cat = loadImage("cats.png");
    //cat[1] = loadImage("cats2.png");
    sunflower = loadImage("sun.jpg");
    rainy = loadImage("rain.jpg");
//sounds//
    minim = new Minim(this);
    purr = minim.loadFile("purr.mp3");
    meow = minim.loadFile("meow.wav");
//frameRate(1);
}

void draw(){
  background(247, 247, 178);
  image(cat, catX, 350, 150, 150);
  if(catX > 350){
    catX = 350;
  }
  if (catX < 50){
    catX = 50;
  }
  
//cat's meow//
if(mousePressed && mouseX > catX && mouseX < catX + 150 && mouseY > 400 && mouseY < 450){
   meow.play();
   meow.rewind();
   happiness = happiness + 1;
    }
 
//floor// 
  fill(175, 129, 86);
  noStroke();
  rect(0, 470, 700, 40);
  
//dresser//
  stroke(0);
  fill(165, 91, 21);
  rect(495, 380, 200, 40);
  rect(495, 340, 200, 40);
  rect(495, 300, 200, 40);
  ellipse(510, 465, 15, 15);
  ellipse(680, 465, 15, 15);
  rect(495, 420, 200, 40);
  fill(242, 212, 46);
  ellipse(595, 440, 10, 10);
  ellipse(595, 400, 10, 10);
  ellipse(595, 360, 10, 10);
  ellipse(595, 320, 10, 10);
  
//food//
  fill(129, 204, 83);
  quad(35, 450, 75, 450, 80, 470, 30, 470);
  if(foodon == true){
   fill(139,69,19);
   ellipse(38, 450, 5, 5);
   ellipse(43, 450, 5, 5);
   ellipse(48, 450, 5, 5);
   fill(160,82,45);
   ellipse(53, 450, 5, 5);
   ellipse(58, 450, 5, 5);
   ellipse(63, 450, 5, 5);
   fill(160,82,45);
   ellipse(68, 450, 5, 5);
   ellipse(72, 450, 5, 5);
   ellipse(40, 445, 5, 5);
   ellipse(45, 445, 5, 5);
   fill(210,180,140);
   ellipse(50, 445, 5, 5);
   ellipse(55, 445, 5, 5);
   ellipse(60, 445, 5, 5);
   fill(160,82,45);
   ellipse(65, 445, 5, 5);
   ellipse(70, 445, 5, 5); 
  }
  
//picture frame//
  fill(165, 91, 21);
  rect(110, 68, 150, 180);
  if(keyCode == UP){
    showpic = false;
    image(rainy, 115, 72, 140, 170);
  } else {
    showpic = true;
    image(sunflower, 115, 72, 140, 170); 
  }
  
//table lamp//
  noStroke();
  fill(83, 83, 86);
  rect(510, 290, 60, 10);
  rect(535, 240, 10, 60);
  fill(66, 118, 150);
  quad(510, 240, 570, 240, 550, 200, 530, 200);
  
  if(lampon == true){
     fill(232, 218, 67);
     noStroke();
     quad(525, 240, 520, 265, 560, 265, 555, 240);
  }
  
//happiness meter//
  fill(0);
  rect(460, 29, happiness, 10, 18);
   if (timer > 5000){
     happiness = happiness-5;
     timeStamp = millis();
     timer = 0;
   }else {
    timer = millis() - timeStamp;
  }
  textFont(instructions);
   text("Kitty Happiness Meter:" + " " + happiness, 450, 70);
   if (happiness < 130){
     textFont(reg);
     text("Take care of me, I need love!", catX , 325);
   }
   
//rules and commands//
    fill(0);
    rect(20, 20, 85, 20);
    fill(255);
    textFont(reg);
    text("Press for Rules", 20, 35);
  if(mousePressed && mouseX > 20 && mouseX < 100 && mouseY > 20 && mouseY < 40){
      show_instructions = true;
      background(247, 247, 178);
      textFont(instructions);
      fill(0);
      text("Congratulations on adopting your cat!", 120, 100);
      text("Rules and Commands", 50, 150);
      text("Kitty is a perfect desktop companion for a long paper or long day!", 50, 180);
      text("Press ENTER to feed your kitty, and SHIFT to start feeding again.", 50, 240);
      text("Press TAB to turn on the light, and CONTROL to turn it off.",50, 270);
      text("Click on your kitty to hear him meow and make him happy!", 50, 300);
      text("Try to keep the happiness as high as you can.", 50, 330);
      text("Move your kitty around using right and left arrow keys.", 50, 360);
      text("Change the picture with the UP arrow key.", 50, 390);
      text("If the happiness reaches zero, it's game over!", 50, 420);
      }
      
 //gameover//
    if (happiness < 0 || happiness == 0){
      background(0);
      textFont(instructions);
      text("GAME OVER. Give more love next time!", 300, 250);
        
      }
      
      
  }


  void keyPressed(){
    //food bowl// 
     if(keyCode == ENTER){
       happiness = happiness + 1;
       foodon = true; 
       purr.play();
       purr.rewind();
     }else if(keyCode == SHIFT){
       foodon = false;
     }
     //lamp turn on//
     if(keyCode == TAB){
     happiness = happiness + 1;
     lampon = true;
     } else if (keyCode == CONTROL){
       lampon = false;
     }
     
     //cat movement//
     if(keyCode == RIGHT){
       catX = catX + 50;
  }
    if(keyCode == LEFT){
       catX = catX - 50;
    }
  }
  
  
