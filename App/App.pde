import java.util.ArrayList;

Liquid air;
Liquid liquid;
float g = 9.82 / 80;


ArrayList<Movable> arr = new ArrayList<Movable>();
int amount = 1;

public void setup() {
  size(960, 540);
  for (int i = 0; i < amount; i++) {
    arr.add(new Movable());
  }
  liquid = new Liquid(0, height/2, width, height/2, 1000 / pow(80, 3));
  air = new Liquid(0, 0, width, height/2, 1.204 / pow(80, 3) );
}

void draw() {
  background(255);
  ellipse(mouseX, mouseY, 20, 20);
  liquid.display();
  fill(49, 51, 56);
  for (int i = 0; i < amount; i++) {
    Movable p = arr.get(i);
    p.update();
    p.checkEdges();
    p.display();
  }
}
