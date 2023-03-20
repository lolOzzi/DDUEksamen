import java.util.ArrayList;


Liquid liquid;
Player player;
Ground ground;

ArrayList<Movable> arr = new ArrayList<Movable>();
int amount = 10;

public void setup() {
  size(960, 580);
  liquid = new Liquid(0, height/2, width, height/2, 0.1);
  player = new Player();
  ground = new Ground();
}

void draw() {
  background(0, 200, 255);
  ellipse(mouseX, mouseY, 20, 20);
  liquid.display();
  fill(255);
  player.moveUpdate();
  player.display();
  ground.display();
  
  if (player.location.y + player.size.y >= height - ground.gHeight){
    player.onGround = true;
    println("On Ground " + player.onGround);
  } else player.onGround = false;
}
