class Ground extends StaticObject{
  float cf = 0.4;
  PShape ground1;
  PShape ground2;

  Ground(){
    super(0, height - 24*8, width, 24*8);
    location = new PVector(0, height - 24*8);
    size = new PVector(width, 24*8);
    float relPosY = location.y + 64;
    textureWrap(REPEAT); 
    ground1 = createShape();
    ground1.beginShape();
    ground1.noStroke();
    ground1.textureMode(0);
    ground1.texture(groundImgs.get(0));
    ground1.vertex(0, relPosY, 0, 0);
    ground1.vertex(size.x, relPosY, 30, 0);
    ground1.vertex(size.x, relPosY + size.y - 8*8, 30, 2);
    ground1.vertex(0, relPosY + size.y - 8*8, 0, 2);
    ground1.endShape(CLOSE);
    float relPosY2 = location.y;
    textureWrap(REPEAT); 
    ground2 = createShape();
    ground2.beginShape();
    ground2.noStroke();
    ground2.textureMode(0);
    ground2.texture(groundImgs.get(1));
    ground2.vertex(0, relPosY2, 0, 0);
    ground2.vertex(size.x, relPosY2, 30, 0);
    ground2.vertex(size.x, relPosY2 + 8*8, 30, 1);
    ground2.vertex(0, relPosY2 + 8*8, 0, 1);
    ground2.endShape(CLOSE);

  }
  
  void display(){
    shape(ground1);
    shape(ground2);

  }

}
