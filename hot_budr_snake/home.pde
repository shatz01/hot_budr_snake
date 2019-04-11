public class Home{
  
  Button b1 = new Button("Play");
  Button b2 = new Button("Info");
  
  void display(){
    // background
    background(blue);
    
    // buttons
    pushMatrix();
      translate(width/2, height/2);
      b1.display(0, -height/4, width/2, width/6, 8, width/12); // top button
      b2.display(0, height/4, width/2, width/6, 8, width/12); // bottom button
    popMatrix();
    
    
  }
}
