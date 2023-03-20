class Ground{
  float gHeight;
  
  Ground(){
    gHeight = 100; 
  }
  
  void display(){
    fill(255);
    rect(0, height - gHeight, width, height - gHeight);
  }
}
