class Snake {
  PVector pos;
  PVector vel;
  int len;
  int moveX = 0;
  int moveY = 0;

  //Snake constructor 
  Snake() {
    pos = new PVector(400, 300); //start in the middle
    vel = new PVector();
    len = 0;
  }
  
  //update based on velocity/level 
  void update() {
    detectCollision();
    pos.x += vel.x*lvl_speed;
    pos.y += vel.y*lvl_speed;
    
    moveX = int(vel.x);
    moveY = int(vel.y);
  }


  //draw the snake
  void display() {
    noStroke();
    fill(yellow);
    rect(pos.x, pos.y, size, size);
  }
  
  void detectCollision() {
    if(pos.x < 0 || pos.x > width || pos.y < 0 || pos.y > height){
      alive = false;
    }
  }
}
