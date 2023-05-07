class Ground extends StaticObject{
  float cf = 0.4;
  Ground(){
    super(0, height - 24*8, width, 24*8);
  }
  
  void display(){
    fill(0, 139, 10);
    rect(0, location.y, size.x, size.y);

    float relPosY = location.y + 64;
    textureWrap(REPEAT); 
    beginShape();
    texture(groundImgs.get(0));
    vertex(0, relPosY, 0, 0);
    vertex(size.x, relPosY, 30, 0);
    vertex(size.x, relPosY + size.y - 8*8, 30, 2);
    vertex(0, relPosY + size.y - 8*8, 0, 2);
    endShape();

    float relPosY2 = location.y;
    textureWrap(REPEAT); 
    beginShape();
    texture(groundImgs.get(1));
    vertex(0, relPosY2, 0, 0);
    vertex(size.x, relPosY2, 30, 0);
    vertex(size.x, relPosY2 + 8*8, 30, 1);
    vertex(0, relPosY2 + 8*8, 0, 1);
    endShape();
  }

}
