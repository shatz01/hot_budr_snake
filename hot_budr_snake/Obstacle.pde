import java.util.ArrayList;

class Obstacle{
  
  int numObstacles = 0;
  float obstacleW = 800/7;
  float obstacleH = 600/7;
  ArrayList<Float> obstaclesX = new ArrayList<Float>();
  ArrayList<Float> obstaclesY = new ArrayList<Float>();

  PImage obstacleImage = new PImage();
  
  void calcObstacle(){
    if (difficulty == 1){
      this.numObstacles = 4;
    } 
    else if (difficulty == 2){
      this.numObstacles = 9;
    }
    
    makeObstacleLocations();
  }
  
  void makeObstacleLocations(){
    for(int i = 0; i < this.numObstacles; i++){
      obstaclesX.add(random(0, 785));
      obstaclesY.add(random(0, 685));
      //print(width);
    }
  }
  
  void display(){
    for(int i = 0; i < this.numObstacles; i++){
      image(obstacleImage, obstaclesX.get(i), obstaclesY.get(i), obstacleW, obstacleH);
      //print(width);
    }
  }
  
  
}
