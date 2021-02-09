
import javax.swing.JOptionPane;
int sunPos = 40; //y and x pos for sun
int red = 10; //red parameter in drawHill method
int green= 140; //green parameter in drawHill method
int blue = 85; //blue parameter in drawHill method
int opacity = 80;//opacity parameter in drawHill method
int posFlower = 640; //flower position on yaxis
int ballPos = 700; //ball postition on y axix

boolean sunnyDay, clearNight, rainyNight, cloudyDay, starryNight, isPressed;
PImage umbrella, beach, flower, telescope; 

void setup() {
  //size(1000,700); 
  fullScreen(); //set screen size to fullscreen (1280x800 on my laptop)
  noStroke();
  frameRate(20);

  //load all images
  umbrella = loadImage("umbrella_transparent.png");
  flower = loadImage("redFlowers.png"); // flower pixel dimension 150x288
  beach = loadImage("beachumbrella.png");
  telescope = loadImage("astronomy.png");

  String str = JOptionPane.showInputDialog("Hi, my name is Aileen. " 
    + "\n\nI am here to help you create a drawing based on questions" 
    + "\nyou answer on the time of day and weather conditions."
    + "\n\nTo begin please enter your name:", "Name");
  String trimmedMessage = str.trim();
  //String firstLetter = str.toUpperCase();
  JOptionPane.showMessageDialog(null, "Hello " + trimmedMessage 
    + "\n\nOnce you have answered two questions your image will be drawn."
    + "\nYou can then use your mouse click to reveal a hidden image or animations"
    + "\n\nIf you are ready to start let the questions begin. " );

  int reply = JOptionPane.showConfirmDialog(null, 
    "Is it daytime?", 
    "Question", 
    JOptionPane.YES_NO_OPTION);

  //print(reply); // Yes returns 0 and No returns 1

  if (reply == 0) { 
    int reply2 = JOptionPane.showConfirmDialog(null, 
      "Is it sunny?", 
      "Question", 
      JOptionPane.YES_NO_OPTION);  
    if (reply2 == 0) 
      sunnyDay = true;
    else cloudyDay = true;
  }

  if (reply == 1) {
    int reply3 = JOptionPane.showConfirmDialog(null, 
      "Can you see the stars?", 
      "Question", 
      JOptionPane.YES_NO_OPTION); 
    if (reply3 == 0) 
      starryNight = true; 
    else rainyNight = true;
  }
}

void draw() { 
  /* A different if statement is called depending on the boolean conditions in setup
   */
  if (sunnyDay) {
    drawBlueSky();
    drawSweat();

    //draws hills
    for (int i = 20; i<120; i=i+20) {
      drawHill( red, green, blue, opacity, i*16, height+i, width*2, height/2);
    }
    //draws sun
    for (int i = 0; i<20; i++) {
      drawSun(sunPos, (100-i)*4); // (position, diameter)
    }

    drawFig();
    drawBall(); // only draws if isPressed is true
    image(beach, 1000, 600, 100, 100); // image (img, xpos, ypos, width, height)
    /*
     if the mouse is pressed the ball is 
     drawn from the drawBall function
     */
    if (mousePressed == true) {
      isPressed = true;
    }
  } else if (cloudyDay) {
    for (int i = 20; i<120; i=i+20) {
      drawHill( red, green, blue, opacity/4, i*16, height+i, width*2, height/2);
    }

    drawFig();
    drawCloud();
    drawMoreFlower(); // only draws if isPressed is true

    //cloud movement effect created with an opacity fill of 20 on each frame drawn
    noStroke();
    fill(255, 20);
    rect(0, 0, width, height);
    /*
     if the following condition is met flowers are drawn 
     from the drawMoreFlower function.
     */
    if (mousePressed == true) {
      isPressed = true;
    }
  } else if (rainyNight) {
    background(40, 40, 80);
    for (int i=20; i<120; i=i+20) {
      drawHill( red, green, blue, opacity, i*16, height+i, width*2, height/2);
    }
    drawFig(); 

    if (mousePressed == true) {
      isPressed = true; 
      if (isPressed = true) {
        // draws umbrella  
        image(umbrella, 625, 400, 160, 160); 
        //draw rain
        noStroke();
        fill(255);
        rect(random(0, width), random(0, height), 5, random(10, 60));
      }
    }
  } else if (starryNight) {
    fill(40, 40, 80); 
    noStroke();
    rect(0, 0, width, height);

    for (int i = 20; i<120; i=i+20) {
      drawHill( red, green, blue, opacity, i*16, height+i, width*2, height/2);
    }

    drawFig();
    drawStars(); //only draws if isPressed is true
    /*
     if the following condition is met the telescope image 
     in the draw stars function gets called
     */
    if (mousePressed == true) 
      isPressed = true;
  }
}

void drawSun(int sunPos, int diameter) {
  stroke(127);
  strokeWeight(1);
  fill(250, 220, 0);
  ellipse( sunPos, sunPos, diameter, diameter);
} 

void drawHill(int red, int green, int blue, int opacity, int x, int y, int circleWidth, int circleHeight) {
  noStroke();
  fill(red, green, blue, opacity);
  ellipse( x, y, circleWidth, circleHeight);
}

void drawBlueSky() {

  /* this function is modified from Lab2 challenge3
   Here it is using a nested for loop to draw a two tone checkered sky. 
   A rect is also drawn to the bottom part of the window to meet with the checkered sky.*/

  for (int i=0; i < 31; i++)
  {
    for (int j=0; j < 64; j++)
    { 
      if ((i + j + 1) % 2 == 0)
        fill(190, 240, 255);
      else
        fill(165, 230, 255);
      noStroke();
      rect(j*20, i*20, 20, 20);
    }
  }

  rect(0, 620, width, height/4);
}

void drawFig() {

  /* The drawFig function Utilises a sketch I made in my Lab 1a Challenge 2.
   This translates the position of the hard coded values of the figure 
   to another postion on screen
   */

  pushMatrix();
  translate(600, 400);
  //Head
  fill(10, 140, 85);
  quad(130, 110, 170, 90, 150, 50, 110, 70);

  //Upper Body
  fill (0);
  triangle(150, 100, 150, 200, 200, 150);

  //Lower Body
  fill(126);
  triangle(175, 175, 175, 275, 125, 225);

  //Arms
  triangle(100, 120, 150, 120, 150, 170);

  //Legs
  fill(200);
  quad(125, 225, 125, 300, 150, 325, 150, 250);

  //Feet
  fill(128);
  triangle(125, 300, 150, 325, 100, 325);
  triangle(175, 270, 175, 325, 200, 300);
  popMatrix();
}

void drawSweat() {
  pushMatrix();
  translate(600, 400);
  //sweat
  fill(0, 0, 190);
  triangle(200, 200, 220, 200, 200, 180);
  triangle(300, 300, 320, 310, 290, 320);
  triangle(325, 325, 300, 325, 300, 310);
  triangle (250, 270, 260, 290, 279, 280); 
  popMatrix();
}

void drawCloud() {
  for (int i = 200; i<1200; i=i+200) {
    fill(0);
    ellipse(i, 200, 300, random(100, 200));
  }
  for (int j = 300; j<1000; j=j+200) {
    fill(0);
    ellipse(j, 300, 300, random(100, 200));
  }
}

void drawFlower() {
  image(flower, 100, posFlower, 80, 154);
  image(flower, 300, posFlower, 50, 96);
  image(flower, 200, posFlower, 25, 48);
  image(flower, 250, posFlower, 22, 38);
}

void drawMoreFlower() {
  if (isPressed == true) {
    drawFlower();
    pushMatrix();
    translate(700, 0);
    drawFlower();
    popMatrix();
  }
}

void drawStars() {

  /* use a fill opacity value with rect over the sky area 
   helps with blinking star effect*/
  fill(40, 40, 80, 100); 
  rect(0, 0, width, height/5*4);

  drawFig();

  // draw blinking stars
  stroke(255);
  strokeWeight(random(3, 8));
  point(random(width), random(0, height/5*4));

  if (isPressed == true) 
    image(telescope, 350, 350, 350, 350);
}

void drawBall() {
  fill(255, 0, 0);
  ellipse(ballPos, 710, 30, 30);
  if (isPressed == true) {
    if (ballPos<=700 && ballPos >= 15) 
      ballPos -=20;
  }
}