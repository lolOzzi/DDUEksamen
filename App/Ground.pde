class Ground extends StaticObject{
  float cf = 0.4;
  Ground(){
    super(0, height - 24*8, width, 24*8);
  }
  
  void display(){
    fill(0, 139, 10);
    rect(0, location.y, size.x, size.y);


    pushMatrix();
    translate(0, location.y +8*8);
    textureWrap(REPEAT); 
    beginShape();
    texture(groundImgs.get(0));
    vertex(0, 0, 0, 0);
    vertex(size.x, 0, 30, 0);
    vertex(size.x, size.y - 8*8, 30, 2);
    vertex(0, size.y - 8*8, 0, 2);
    endShape();

    popMatrix();
       pushMatrix();
    translate(0, location.y);
    textureWrap(REPEAT); 
    beginShape();
    texture(groundImgs.get(1));
    vertex(0, 0, 0, 0);
    vertex(size.x, 0, 30, 0);
    vertex(size.x, 8*8, 30, 1);
    vertex(0, 8*8, 0, 1);
    endShape();

    popMatrix();
  }

}
