import java.util.ArrayList;


Liquid liquid;

ArrayList<Movable> arr = new ArrayList<Movable>();
int amount = 10;

public void setup() {
  size(960, 580);
  for (int i = 0; i < amount; i++) {
    arr.add(new Movable());
  }
  liquid = new Liquid(0, height/2, width, height/2, 0.1);
}

void draw() {
  background(0, 200, 255);
  ellipse(mouseX, mouseY, 20, 20);
  liquid.display();
  fill(255);
  for (int i = 0; i < amount; i++) {
    Movable p = arr.get(i);
    
    if (p.isInside(liquid)) {
      println("pog");
      p.drag(liquid);
    }
    
    p.update();
    p.checkEdges();
    p.display();
  }
  
}
