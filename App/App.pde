import java.util.ArrayList;


Liquid liquid;
Player player;

ArrayList<Movable> arr = new ArrayList<Movable>();
int amount = 10;

public void setup() {
  size(960, 580);
  liquid = new Liquid(0, height/2, width, height/2, 0.1);
  player = new Player();
}

void draw() {
  background(0, 200, 255);
  ellipse(mouseX, mouseY, 20, 20);
  liquid.display();
  fill(255);
  player.moveUpdate();
  player.display();
  
}
