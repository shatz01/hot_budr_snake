class Budr {
  float budrW;
  float budrH;
  float budrX;
  float budrY;
  PImage budrImage = new PImage();

  //constructor
  public Budr() {
    budrH = height/10;
    budrW = width/8;
    randomizeLocation();
  }

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
    this.budrX = ranx;
    this.budrY = rany;
  }

  void display() {
    image(budrImage, budrX, budrY, budrW, budrH);
  }
}
