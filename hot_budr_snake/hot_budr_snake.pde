color blue = color(117, 207, 214);
color yellow = color(252, 236, 151);
color yellow_hover = color(252, 236, 151,100);

// obstacle border html is: e31837
color obstacle_border = color(227, 24, 55);

Menu m ;

void setup(){
  size(800,600);
  background(blue);
    m = new Menu();
}

void draw(){
  if(!m.start){
      //mouse hover
      m.mouseHover(mouseX,mouseY);
  }
  else{
      //start
      background(255);
  }
}

void mouseClicked(){
    m.clicked(mouseX,mouseY);
}
