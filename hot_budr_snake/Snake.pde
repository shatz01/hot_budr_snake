import java.util.*;
class Snake {
  PVector pos;
  PVector vel;
  int len;
  int moveX = 0;
  int moveY = 0;
  Queue q;

  //Snake constructor 
  Snake() {
    pos = new PVector(400, 300); //start in the middle
    vel = new PVector();
    len = 1;
    q = new Queue();
    q.enqueue((int)pos.x, (int)pos.y);
  }

  //update based on velocity/level 
  void update() {
    if (alive) {
      moveX = int(vel.x);
      moveY = int(vel.y);

      pos.x += vel.x*lvl_speed;
      pos.y += vel.y*lvl_speed;

      q.enqueue((int)pos.x, (int)pos.y);

      detectCollision();

      if (len%lvl_speed*3 == 0 && len >= 3*lvl_speed*diff_speed) {
        lvl_speed++;
        diff_speed++;
      }
    }
  }


  //draw the snake
  void display() {
    noStroke();
    fill(fake_yellow2);
    int s = q.size();
    for (int i = 0; i< s; i++) {
      PVector t = q.get(i);
      if (i >0 && i < size*3  +1) fill(fake_yellow);
      else fill(fake_yellow2);
      //println("x: " + t.x + ", y " + t.y);
      rect(t.x, t.y, size, size);
    }
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
      hitSound.play();
      println("wall");
      println("x: " + pos.x + ", y: " + pos.y);
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
        color check1 = get(int(pos.x + size/2 + 1), int(pos.y - size/2 + i)); //right
        color check2 = get(int(pos.x - size/2 - 1), int(pos.y - size/2 + i)); //left
        color check3 = get(int(pos.x - size/2 + i), int(pos.y - size/2 - 1)); //top
        color check4 = get(int(pos.x - size/2 + i), int(pos.y + size/2 + 1)); //bottom
        if (check1 == obstacle_border || check2 == obstacle_border || check3 == obstacle_border || check4 == obstacle_border) {
          hitSound.play();
          println("obs");
          alive = false;
          break;
        } else if (check1 == target_border ||  check2 == target_border || check3 == target_border || check4 == target_border ) { // got a target!
          //print("aye");
          eatSound.play();
          len++;
          println("len++");
          budr.randomizeLocation();
          break;
          //alive = false;
        } else {
          if ( moveX > 0 && check1 == fake_yellow2) {
            hitSound.play();
            println("self right");
            set(int(pos.x + size/2 + 1), int(pos.y - size/2 + i), color(255, 0, 0));
            alive = false;
            break;
          } else if ( moveX < 0 && check2 == fake_yellow2) {
            hitSound.play();
            println("self left");
            set(int(pos.x - size/2 - 1), int(pos.y - size/2 + i), color(255, 0, 0));
            alive = false;
            break;
          } else if ( moveY < 0 && check3 == fake_yellow2) {
            hitSound.play();
            println("self up");
            set(int(pos.x - size/2 + i), int(pos.y - size/2 - 1), color(255, 0, 0));
            alive = false;
            break;
          } else if ( moveY > 0 && check4 == fake_yellow2) {
            hitSound.play();
            println("self down");
            set(int(pos.x - size/2 + i), int(pos.y + size/2 + 1), color(255, 0, 0));
            alive = false;
            break;
          } else {
            //println("no hit");
          }
        }
      }
    }
  }

  private class Queue {
    private List<PVector> list;
    public Queue() {
      list = new ArrayList<PVector>();
    }
    public void enqueue(int x, int y) {
      PVector temp = new PVector(x, y);
      list.add(temp);
      //println("size: " + size());
      println(len);
      if (list.size() > (len-1) * size + 1) {
        list.remove(0);
      }
    }
    public int size() {
      return list.size();
    }

    public PVector get(int pos) {
      return list.get(pos);
    }
  }
}
