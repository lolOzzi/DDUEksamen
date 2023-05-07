class Platform extends StaticObject {
  int length;
  String text = "";

  Platform(int x, int y, int length, String text) {
    super(x, y, 64*2 + length*64, 64);
    this.length = length;
    this.text = text;
  }

  void display() {

    PVector relPos = new PVector(location.x, location.y);
    textureWrap(REPEAT);
    beginShape();
    texture(platformImgs.get(0));
    vertex(relPos.x, relPos.y, 0, 0);
    vertex(relPos.x + 64, relPos.y, 1, 0);
    vertex(relPos.x + 64, relPos.y + 64, 1, 1);
    vertex(relPos.x, relPos.y + 64, 0, 1);
    endShape();
    relPos = new PVector(location.x + 64, location.y);
    textureWrap(REPEAT);
    beginShape();
    texture(platformImgs.get(1));
    vertex(relPos.x, relPos.y, 0, 0);
    vertex(relPos.x + 64*length, relPos.y, length, 0);
    vertex(relPos.x + 64*length, relPos.y + 64, length, 1);
    vertex(relPos.x, relPos.y + 64, 0, 1);
    endShape();
    relPos = new PVector(location.x + 64 + 64*length, location.y);
    textureWrap(REPEAT);
    beginShape();
    texture(platformImgs.get(2));
    vertex(relPos.x, relPos.y, 0, 0);
    vertex(relPos.x + 64, relPos.y, 1, 0);
    vertex(relPos.x + 64, relPos.y + 64, 1, 1);
    vertex(relPos.x, relPos.y + 64, 0, 1);
    endShape();

    
    
    fill(0);
    PFont pixelFont20 = createFont("./font/pixel.ttf", 20, false);
    textFont(pixelFont20);
    text(text, location.x + size.x/15, location.y + size.y/1.5);
  }
}
