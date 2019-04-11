class Menu {
  public int diff = 0;
  public boolean start = false;
  private boolean reset = false;
  public Menu() {
    rectMode(CENTER);
    //start
    reset();
    reset = true;
  }

  void fillDiff() {
    stroke(0);
    strokeWeight(3);
    fill(blue);
    ellipse(width/2, height/2, 40, 40);
    ellipse(width/2.5, height/2, 40, 40);
    ellipse(width - width/2.5, height/2, 40, 40);

    fill(250, 238, 3);
    if (diff == 0) {
      ellipse(width/2.5, height/2, 30, 30);
    } else if (diff == 1) {
      ellipse(width/2, height/2, 30, 30);
    } else {
      ellipse(width - width/2.5, height/2, 30, 30);
    }
  }

  void hoverDiff(int h) {
    reset = false;
    stroke(0);
    strokeWeight(3);
    fill(blue);
    ellipse(width/2, height/2, 40, 40);
    ellipse(width/2.5, height/2, 40, 40);
    ellipse(width - width/2.5, height/2, 40, 40);

    fill(250, 238, 3, 100);
    if (h == 0) {
      ellipse(width/2.5, height/2, 30, 30);
    } else if (h == 1) {
      ellipse(width/2, height/2, 30, 30);
    } else {
      ellipse(width - width/2.5, height/2, 30, 30);
    }
    fill(250, 238, 3);
    if (diff == 0) {
      ellipse(width/2.5, height/2, 30, 30);
    } else if (diff == 1) {
      ellipse(width/2, height/2, 30, 30);
    } else {
      ellipse(width - width/2.5, height/2, 30, 30);
    }
  }


  void clicked(int x, int y) {
    println(x + ", " + y);
    if (x >= width/2-120 && x <=width/2+120 && y >=height/3-50 && y <= height/3+50) {
      start = true;
      println("start");
      //start
    } else if (x >= width/2-40 && x <=width/2+40 && y >=height - height/5-20 && y <= height - height/5+20) {
      println("quit");
      exit();
      //start
    } else if (distance(x, y, (int)(width/2.5), (int)(height/2)) <= 20) {
      diff = 0;
      fillDiff();
      println("0");
    } else if (distance(x, y, (int)(width/2), (int)(height/2)) <= 20) {
      diff = 1;
      fillDiff();
      println("1");
      lvl_speed = 2;
    } else if (distance(x, y, (int)(width - width/2.5), (int)(height/2)) <= 20) {
      diff = 2;
      fillDiff();
      println("2");
      lvl_speed = 5;
    }
  }

  void mouseHover(int x, int y) {
    if (x >= width/2-120 && x <=width/2+120 && y >=height/3-50 && y <= height/3+50) {
      reset = false;
      fill(255);
      strokeWeight(3);
      rect(width/2, height/3, 240, 100);
      fill(250, 238, 3, 100);
      rect(width/2, height/3, 240, 100);
      fill(0);
      textAlign(CENTER);
      textSize(60);
      text("START", width/2, height/3 + 20);
      println("start");
      //start
    } else if (x >= width/2-40 && x <=width/2+40 && y >=height - height/5-20 && y <= height - height/5+20) {
      reset = false;
      fill(255);
      strokeWeight(3);
      rect(width/2, height - height/5, 80, 40);
      fill(250, 238, 3,100);
      rect(width/2, height - height/5, 80, 40);
      fill(0);
      textAlign(CENTER);
      textSize(20);
      text("QUIT", width/2, height - height/5 + 7);
      println("quit");
      //start
    } else if (distance(x, y, (int)(width/2.5), (int)(height/2)) <= 20) {
      hoverDiff(0);
      println("0");
    } else if (distance(x, y, (int)(width/2), (int)(height/2)) <= 20) {
      hoverDiff(1);
      println("1");
    } else if (distance(x, y, (int)(width - width/2.5), (int)(height/2)) <= 20) {
      hoverDiff(2);
      println("2");
    } else {
      if (!reset) {
        println("reseting");
        reset();
        reset = true;
      }
    }
  }

  void reset() {
    fill(250, 238, 3);
    strokeWeight(3);
    rect(width/2, height/3, 240, 100);
    fill(0);
    textAlign(CENTER);
    textSize(60);
    text("START", width/2, height/3 + 20);

    //diff
    stroke(0);
    strokeWeight(3);
    fill(255);
    ellipse(width/2, height/2, 40, 40);
    ellipse(width/2.5, height/2, 40, 40);
    ellipse(width - width/2.5, height/2, 40, 40);

    //labels
    textSize(20);
    fill(0);
    text("Medium", width/2, height/2 + 50 );
    text("Easy", width/2.5, height/2 + 50 );
    text("Hard", width - width/2.5, height/2 + 50);

    //quit
    fill(250, 238, 3);
    strokeWeight(3);
    rect(width/2, height - height/5, 80, 40);
    fill(0);
    textAlign(CENTER);
    textSize(20);
    text("QUIT", width/2, height - height/5 + 7);

    fillDiff();
  }

  float distance(int x1, int y1, int x2, int y2) {
    return sqrt( (x2-x1)*(x2-x1) + (y2-y1)*(y2-y1) );
  }
}
