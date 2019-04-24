// This is the obstacle class
// It displays the images that are not budr
// specifically images of the "I cant believe its not budr" logo
// AKA our mortal enemy

// need this to keep track of the locations of the obstacles
import java.util.ArrayList;

class Obstacle {

  // member vars
  int numObstacles = 0;
  float obstacleW;
  float obstacleH;
  ArrayList<Float> obstaclesX = new ArrayList<Float>();
  ArrayList<Float> obstaclesY = new ArrayList<Float>();

  // constructor
  public Obstacle() {
    
    // initializes height and withd
    // they are hardcoded, but scalable
    obstacleH = height/10;
    obstacleW = width/10;
  }
  
  // this will be the image passed from main
  // it must be passed in this way, otherwise errors
  // make sure its the i cant believe its not budr image
  PImage obstacleImage = new PImage();

  // calculate how many obstacles we need to display
  // based on diffuculty level
  void calcObstacle() {
    if (difficulty == 1) {
      this.numObstacles = 4;
    } else if (difficulty == 2) {
      this.numObstacles = 9;
    }
    
    // make the call to produce the obstaceles
    makeObstacleLocations();
  }

  // fills the arraylist with the randomly generated
  // obstacle locations
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

  // will display all the obstacles in the list
  // called in the draw method of main
  void display() {
    for (int i = 0; i < this.numObstacles; i++) {
      image(obstacleImage, obstaclesX.get(i), obstaclesY.get(i), obstacleW, obstacleH);
    }
  }
}
