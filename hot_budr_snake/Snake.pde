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
    
   if(len%lvl_speed*3 == 0 && len >= 3*lvl_speed*diff_speed){
     lvl_speed++;
     diff_speed++;
   }
  }

  //draw the snake
  void display() {
    noStroke();
    fill(yellow);
    rect(pos.x, pos.y, size, size);
    fill(255);
  }

  // see if the thing is moving or not
  boolean isMoving() {
    if (vel.x != 0 || vel.y != 0) {
      return true;
    }
    return false;
  }

  void detectCollision() {
    //calculate whether snake hits a wall
    if (pos.x-size/2 < 0 || pos.x+size/2 > width || pos.y-size/2 < 0 || pos.y+size/2 > height) {
      alive = false;
    }

    // checks if snake hit an object in front of it
    detectObstacle();
  }

  void detectObstacle() {   

    //color check1 = get(int(pos.x + vel.x*15), int(pos.y + vel.y*15));

    // will show an ellipse around the area it checks for obstacles
    if (DEBUG == true) {
      noFill();
      stroke(255);
      ellipse(pos.x + vel.x*15, pos.y + vel.y*15, 10, 10);
    }


    if (isMoving()) {
      for (int i = 0; i< size; i++) {
        color check1 = get(int(pos.x + size/2), int(pos.y - size/2 + i));
        color check2 = get(int(pos.x - size/2 - 1), int(pos.y - size/2 + i));
        color check3 = get(int(pos.x - size/2 + i), int(pos.y - size/2 - 1));
        color check4 = get(int(pos.x - size/2 + i), int(pos.y + size/2 + 1));
        if (check1 == obstacle_border || check2 == obstacle_border || check3 == obstacle_border || check4 == obstacle_border) {
          alive = false;
          break;
        } else if (check1 == target_border || check1 == target_inside || check2 == target_border || check2 == target_inside || check3 == target_border || check3 == target_inside || check4 == target_border || check4 == target_inside) { // got a target!
          //print("aye");
          len++;
          budr.randomizeLocation();
          break;
          //alive = false;
        }
      }
    }
  }
}
