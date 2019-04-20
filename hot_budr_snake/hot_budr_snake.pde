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
PImage arrowKeys;

int lvl_speed = 1;
int size = 20;
Snake snake = new Snake();
boolean alive = true;
int diff_speed = 2;

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
  if(m.how) {
    arrowKeys = loadImage("Images/arrowKeys.png");
    background(blue);
    textAlign(CENTER);
    imageMode(CENTER);
    textSize(25);
    fill(255);
    text("HOW TO PLAY", width/2, height/4);
    image(arrowKeys, width/2, height/4+55, 120, 120);
    text("Using the arrow keys navigate the playing", width/2, height/4+130);
    text("field, collide with the hot_budr to grow ", width/2, height/4+160);
    text("your snake, avoid not_budr obstacles and", width/2, height/4+190);
    text("earn a highscore. Remember the more you ", width/2, height/4+220);
    text("the more the snake grows the faster it gets!", width/2, height/4+250);
    fill(yellow);
    strokeWeight(3); 
    rect(width/2,height - height/4, 80, 40);
    fill(0);
    textAlign(CENTER);
    text("BACK", width/2, height - height/4 + 9);
  }
  
  if(m.start){
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
