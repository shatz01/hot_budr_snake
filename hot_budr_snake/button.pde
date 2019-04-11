public class Button{
  String buttonName = "";
  color buttonColor = yellow; // buttons are by default yellow
  
  // basic constructor, only title of button
  Button(String buttonName){
    this.buttonName = buttonName;
  }
  
  // constructor if you want another color
  Button(String buttonName, color c){
    this.buttonName = buttonName;
    this.buttonColor = c;
  }
  
  // display non-rounded button
  void display(float x1, float y1, float x2, float y2){
    fill(this.buttonColor);
    rect(x1, y1, x2, y2);
  }
  
  // display rounded button
  public void display(float x1, float y1, float x2, float y2, float corners, float textSize){
    pushMatrix();
      fill(this.buttonColor);
      rectMode(CENTER);
      rect(x1, y1, x2, y2, corners);
      fill(0);
      textAlign(CENTER);
      textSize(textSize);
      text(buttonName, x1, y1, x2, y2);
      //shadeIfHover(x1, y1, x2, y2);
    popMatrix();
  }
  
  // TODO: hovering and shading the button no work yet
  //private void shadeIfHover(float x1, float y1, float x2, float y2){
  //  // shade button if its being hovered over
  //  if (isHover(x1, y1, x2, y2)){
  //    this.buttonColor = yellow-100;
  //  } else {
  //    this.buttonColor = yellow;
  //  }
  //}
  
  //private boolean isHover(float x1, float y1, float x2, float y2){
  //  boolean isHover = false;
  //  float mx = mouseX-width/4;
  //  float my = mouseY-height/4;
  //  //mx >= x1 && mx <= x2 && 
  //  if (my >= y1 && my <= y2){
  //    isHover = true;
  //  }
    
  //  return isHover;
  //}
  
}
