// This class is the Budr class
// This is the object that the snake is looking to aquire

// when a budr is collected, score increases and length of budr increases

class Budr {
  
  // members
  float budrW;
  float budrH;
  float budrX;
  float budrY;
  PImage budrImage = new PImage();

  //constructor
  public Budr() {
    // budr height and width hardcoded, location randomized
    budrH = height/10;
    budrW = width/8;
    randomizeLocation();
  }

  // randomize location of budr
  // checks to make sure that there are not already an image at that location
  // otherwise budr might not be possible to aquire
  void randomizeLocation() {
    boolean cont = true;
    float ranx = 0;
    float rany = 0;
    while (cont) {
      cont = false;
      ranx = random(0, width - budrW);
      rany = random(0, height - budrH);
      // TODO: check that these locations dont have any images in them
      // if they do, recalculate
      for ( int x = (int)ranx; x < ranx + budrW; x++) {
        for ( int y = (int)rany; y < rany + budrH; y++) {
          color check = get(x, y);
          if ( check != blue && check != color(255)) {
            cont = true;
          }
        }
      }
    }
    
    // set location
    this.budrX = ranx;
    this.budrY = rany;
  }

  // simple display function
  // called in void draw() loop
  void display() {
    image(budrImage, budrX, budrY, budrW, budrH);
  }
}
