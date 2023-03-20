class Ground{
  float gHeight;
  float cf = 0.4;

  Ground(){
    gHeight = 100; 
  }
  
  void display(){
  fill(0, 139, 10);
    rect(0, height - gHeight, width, height - gHeight);
  }
}
