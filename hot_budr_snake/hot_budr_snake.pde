boolean DEBUG = true;

import processing.sound.*;
SoundFile menuSound;
PFont font; 
color blue = color(117, 207, 214);
color yellow = color(252, 236, 151);
color yellow_hover = color(252, 236, 151,100);

// obstacle border html is: e31837
color obstacle_border = color(227, 24, 55); // its red
color target_border = color(0, 0, 0); // black
color target_inside = color(252, 236, 151); // budr yellow

Menu m ;
boolean dead = true;

int lvl_speed = 1;
int size = 20;
Snake snake = new Snake();
boolean alive = true;

PImage obstacleImg = new PImage();
Obstacle obstacle;

PImage budrImg = new PImage();
Budr budr;

int difficulty = 0;

void setup(){
  font = createFont("Fonts/MODES.TTF", 32);
  menuSound = new SoundFile(this, "Sounds/menuSound.wav");
  textFont(font);
  size(800,600);
  background(blue);
  m = new Menu();
  
  // Obstacles
  obstacle = new Obstacle();
  obstacleImg = loadImage("obstacle.png");
  obstacle.obstacleImage = obstacleImg;
  
  // Budr
  budr = new Budr();
  budrImg = loadImage("target.png");
  budr.budrImage = budrImg;
}



void draw(){
  if(!m.start){
      //mouse hover
      m.mouseHover(mouseX,mouseY);
  }
  else{
      //start
      background(blue);
      textAlign(LEFT);
      textSize(15);
      fill(255);
      text("Score: " + snake.len, 10, 20);
      
      snake.display();
      obstacle.calcObstacle();
      obstacle.display();
      budr.display();
      
      snake.update();
      gameState();
  }
}

void mouseClicked(){
    m.clicked(mouseX,mouseY);
}

//update velocity based on the key pressed
void keyPressed() { 
  //CANNOT move in the opposite direction (i.e. if going right can't go left)
  if (keyCode == LEFT && snake.moveX != 1) {
    snake.vel.x = -1;
    snake.vel.y = 0;
  } else if (keyCode == RIGHT && snake.moveX != -1) {
    snake.vel.x = 1;
    snake.vel.y = 0;
  } else if (keyCode == UP && snake.moveY != 1) {
    snake.vel.y = -1;
    snake.vel.x = 0;
  } else if (keyCode == DOWN && snake.moveY != -1) {
    snake.vel.y = 1;
    snake.vel.x = 0;
  }
}

void gameState(){
  if(!alive){
    background(blue); 
    fill(yellow);
    textSize(50);
    text("Game Over!", 250, 300);
    text("Score: " + snake.len, 250, 360);
    if(mousePressed) {
      exit();
    }
  }
}
