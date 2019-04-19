class Budr{
  float budrW;
  float budrH;
  float budrX;
  float budrY;
  PImage budrImage = new PImage();
  
  //constructor
  public Budr(){
    budrH = height/10;
    budrW = width/8;
    randomizeLocation();
  }
  
  void randomizeLocation(){
    float ranx = random(0, width - budrW);
    float rany = random(0, height - budrH);
    // TODO: check that these locations dont have any images in them
    // if they do, recalculate
    
    this.budrX = ranx;
    this.budrY = rany;
  }
  
  void display(){
    image(budrImage, budrX, budrY, budrW, budrH);
  }
  
  
  
}
