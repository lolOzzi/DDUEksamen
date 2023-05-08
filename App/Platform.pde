class Platform extends StaticObject {
  int length;
  String text = "";
  PShape platform0;
  PShape platform1;
  PShape platform2;

  Platform(int x, int y, int length, String text) {
    super(x, y, 64*2 + length*64, 64);
    location = new PVector(x, y);
    size = new PVector(64*2 + length*64, 64);
    this.length = length;
    this.text = text;

    PVector relPos = new PVector(location.x, location.y);
    platform0 = createShape();
    textureWrap(REPEAT);
    platform0.beginShape();
    platform0.noStroke();
    platform0.textureMode(0);
    platform0.texture(platformImgs.get(0));
    platform0.vertex(relPos.x, relPos.y, 0, 0);
    platform0.vertex(relPos.x + 64, relPos.y, 1, 0);
    platform0.vertex(relPos.x + 64, relPos.y + 64, 1, 1);
    platform0.vertex(relPos.x, relPos.y + 64, 0, 1);
    platform0.endShape();
    relPos = new PVector(location.x + 64, location.y);
    platform1 = createShape();
    platform1.beginShape();
    platform1.noStroke();
    platform1.textureMode(0);
    platform1.texture(platformImgs.get(1));
    platform1.vertex(relPos.x, relPos.y, 0, 0);
    platform1.vertex(relPos.x + 64*length, relPos.y, length, 0);
    platform1.vertex(relPos.x + 64*length, relPos.y + 64, length, 1);
    platform1.vertex(relPos.x, relPos.y + 64, 0, 1);
    platform1.endShape();
    relPos = new PVector(location.x + 64 + 64*length, location.y);
    platform2 = createShape();
    platform2.beginShape();
    platform2.noStroke();
    platform2.textureMode(0);
    platform2.texture(platformImgs.get(2));
    platform2.vertex(relPos.x, relPos.y, 0, 0);
    platform2.vertex(relPos.x + 64, relPos.y, 1, 0);
    platform2.vertex(relPos.x + 64, relPos.y + 64, 1, 1);
    platform2.vertex(relPos.x, relPos.y + 64, 0, 1);
    platform2.endShape();

  }

  void display() {

    shape(platform0);
    shape(platform1);
    shape(platform2);
    
    fill(0);
    PFont pixelFont20 = createFont("./font/pixel.ttf", 20, false);
    textFont(pixelFont20);
    text(text, location.x + size.x/15, location.y + size.y/1.5);
  }
}
