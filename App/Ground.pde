class Ground extends StaticObject{

  float cf = 0.4;

  Ground(){
    super(0, height - 24*8, width, 24*8);
  }
  
  void display(){
    fill(0, 139, 10);
    rect(0, location.y, size.x, size.y);
  }

}
