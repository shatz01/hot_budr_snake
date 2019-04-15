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
    fill(255);
  }
  
  void detectCollision() {
    //calculate whether snake hits a wall
    if(pos.x < 0 || pos.x > width || pos.y < 0 || pos.y > height){
      alive = false;
    }
    
    // checks if snake hit an object in front of it
    detectObstacle();
  }
  
  void detectObstacle(){   
    
    color check1 = get(int(pos.x + vel.x*15), int(pos.y + vel.y*15));
    
    // will show an ellipse around the area it checks for obstacles
    if (DEBUG == true){
      noFill();
      stroke(255);
      ellipse(pos.x + vel.x*15, pos.y + vel.y*15, 10, 10);
    }
    
    if (check1 == obstacle_border){
      alive = false;
    } else if (check1 == target_border){ // got a target!
      //print("aye");
      //len++;
    }    
  }
  
}
