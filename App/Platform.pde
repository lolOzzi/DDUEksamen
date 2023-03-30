class Platform extends StaticObject {
  int length;
  String text = "";

  Platform(int x, int y, int length, String text) {
    super(x, y, 64*2 + length*64, 64);
    this.length = length;
    this.text = text;
  }

  void display() {

    pushMatrix();
    translate(location.x, location.y);
    textureWrap(REPEAT);
    beginShape();
    texture(platformImgs.get(0));
    vertex(0, 0, 0, 0);
    vertex(64, 0, 1, 0);
    vertex(64, 64, 1, 1);
    vertex(0, 64, 0, 1);
    endShape();
    translate(64, 0);
    textureWrap(REPEAT);
    beginShape();
    texture(platformImgs.get(1));
    vertex(0, 0, 0, 0);
    vertex(64*length, 0, length, 0);
    vertex(64*length, 64, length, 1);
    vertex(0, 64, 0, 1);
    endShape();
    translate(64*length, 0);
    textureWrap(REPEAT);
    beginShape();
    texture(platformImgs.get(2));
    vertex(0, 0, 0, 0);
    vertex(64, 0, 1, 0);
    vertex(64, 64, 1, 1);
    vertex(0, 64, 0, 1);
    endShape();
    popMatrix();
    
    
    fill(0);
    PFont font40 = createFont("Georgia", 40);
    textFont(font40);
    text(text, location.x + size.x/8, location.y + size.y/1.45);
  }
}
