ArrayList<PImage> imgs = new ArrayList<PImage>();
ArrayList<Movable> arr = new ArrayList<Movable>();
  ArrayList<StaticObject> staticObjectList = new ArrayList<StaticObject>();
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

  imgs = helper.loadImages( "/");

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

}
