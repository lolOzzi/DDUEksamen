Ground ground;

ArrayList<StaticObject> staticObjectList = new ArrayList<StaticObject>();
ArrayList<PImage> imgs = new ArrayList<PImage>();
ArrayList<StopBlock> blockArr = new ArrayList<StopBlock>();
ArrayList<Movable> arr = new ArrayList<Movable>();
Player player;
StopBlock endBlock;

int amount = 10;

Helper helper = new Helper();
SpriteAnimation spriteAnimation;

GameState gameState;
Level1 l1;
Level currLevel;

public void setup() {
  //size(960, 540);
  fullScreen();
  frameRate(60);
  gameState = new GameState();
  currLevel = new Level1();
  ground = new Ground();
   player = new Player();
   blockArr.add(new StopBlock(new PVector(400, 410), new PVector(70, 70)));
  endBlock = new StopBlock();
  imgs = helper.loadImages( "test/");
  // Create a new SpriteAnimation object
  spriteAnimation = new SpriteAnimation();

  // Load sprite sheets for animation
  PImage walkSpriteSheet = loadImage("coolguy_walk.png");

  // Add sprite animations to the SpriteAnimation object
  //Parameters: String name, PImage spriteSheet, int rows, int cols, int frameRate
  spriteAnimation.addSprite("walk", walkSpriteSheet, 2, 2, 8);
}

void draw() {
  background(255);
  gameState.update();
  ellipse(mouseX, mouseY, 20, 20);
  fill(255);
  player.moveUpdate();
  player.display();
  endBlock.display(); 
  for (StopBlock block : blockArr){
    block.display();
  }
}
