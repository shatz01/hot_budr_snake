import java.util.ArrayList;

class Obstacle {

  int numObstacles = 0;
  float obstacleW;
  float obstacleH;
  ArrayList<Float> obstaclesX = new ArrayList<Float>();
  ArrayList<Float> obstaclesY = new ArrayList<Float>();

  public Obstacle() {
    obstacleH = height/10;
    obstacleW = width/10;
  }

  PImage obstacleImage = new PImage();

  void calcObstacle() {
    if (difficulty == 1) {
      this.numObstacles = 4;
    } else if (difficulty == 2) {
      this.numObstacles = 9;
    }

    makeObstacleLocations();
  }

  void makeObstacleLocations() {
    int obs = 0;
    for (int i = 0; i < this.numObstacles; i++) {
      float ranx = 0;
      float rany = 0;
      boolean col = true;
      while (col) {
        ranx = random(0, width - obstacleW);
        rany = random(0, height - obstacleH);
        //println("Trying: " + ranx + ", " + rany);
        col = false;
        for (int j = 0; j < obs; j++) {
          if (((obstaclesX.get(j) + obstacleW >= ranx && obstaclesX.get(j)  <= ranx) || (ranx + obstacleW  >= obstaclesX.get(j) && ranx <= obstaclesX.get(j))) 
          && ((obstaclesY.get(j) + obstacleH >= rany && obstaclesY.get(j)  <= rany) || (rany + obstacleH  >= obstaclesY.get(j) && rany <= obstaclesY.get(j)))) {
            //println("err: col");
            col = true;
          }
        }
        if(ranx > (width/2) - (obstacleW * 2) + obstacleW/2 && ranx < (width/2) + (obstacleW) - obstacleW/2  && rany > (height/2) - (obstacleH * 2) + obstacleH/2  && rany < (height/2) + (obstacleH) - obstacleH/2  ){
           col = true; 
        }
      }
      //println("Adding: " + ranx + ", " + rany);
      obstaclesX.add(ranx);
      obstaclesY.add(rany);
      obs++;
      //print(width);
    }
  }

  void display() {
    for (int i = 0; i < this.numObstacles; i++) {
      image(obstacleImage, obstaclesX.get(i), obstaclesY.get(i), obstacleW, obstacleH);
      //println(obstaclesX.get(i) + ", " + obstaclesY.get(i));
    }
  }
}
