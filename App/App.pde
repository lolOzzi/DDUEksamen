import java.util.ArrayList;


Liquid liquid;
Player player;
Ground ground;
StopBlock endBlock;

ArrayList<StopBlock> blockArr = new ArrayList<StopBlock>();
ArrayList<Movable> arr = new ArrayList<Movable>();
int amount = 10;

public void setup() {
  size(960, 580);
  liquid = new Liquid(0, height/2, width, height/2, 0.1);
  player = new Player();
  ground = new Ground();
  blockArr.add(new StopBlock(new PVector(400, 410), new PVector(70, 70)));
  endBlock = new StopBlock();
}

void draw() {
  background(0, 200, 255);
  ellipse(mouseX, mouseY, 20, 20);
  liquid.display();
  fill(255);
  player.moveUpdate();
  player.display();
  ground.display();
  endBlock.display(); 
  for (StopBlock block : blockArr){
    block.display();
  }
}
