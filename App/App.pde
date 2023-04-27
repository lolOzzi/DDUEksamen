import processing.sound.*;


SoundFile defaultTrack;
SoundFile actionTrack;
ArrayList<PImage> backgroundImgs = new ArrayList<PImage>();
ArrayList<PImage> groundImgs = new ArrayList<PImage>();
ArrayList<PImage> platformImgs = new ArrayList<PImage>();
ArrayList<Movable> arr = new ArrayList<Movable>();
  ArrayList<StaticObject> staticObjectList = new ArrayList<StaticObject>();
Helper helper = new Helper();
SpriteAnimation spriteAnimation;

GameState gameState;
Level1 l1;
Level currLevel;
MainMenu mainMenu;
Spring spring;
Player player;

public void setup() {
  //size(960, 540);
  fullScreen(P2D, 2);
  noSmooth();
  frameRate(60);
  
    
  //music
  actionTrack = new SoundFile(this, "/music/action.wav");
  actionTrack.amp(0.75);
  defaultTrack = new SoundFile(this, "/music/default.wav");
  defaultTrack.amp(0.75);
  defaultTrack.play();
  defaultTrack.loop();
  
  
  gameState = new GameState();
  currLevel = new Level1();
  mainMenu = new MainMenu();
  //currLevel = new Level0();
  backgroundImgs = helper.loadImages( "/sprites/game/env/background/");
  groundImgs = helper.loadImages( "/sprites/game/env/ground/");
  platformImgs = helper.loadImages( "/sprites/game/env/platform/");
  // Create a new SpriteAnimation object
  spriteAnimation = new SpriteAnimation();

  
  // Load sprite sheets for animation
  PImage walkSpriteSheet = loadImage("coolguy_walk.png");

  // Add sprite animations to the SpriteAnimation object
  //Parameters: String name, PImage spriteSheet, int rows, int cols, int frameRate
  spriteAnimation.addSprite("walk", walkSpriteSheet, 2, 2, 8);
  textureMode(NORMAL);
  noStroke();
}

void draw() {
  //background(255);
  gameState.update();
  //ellipse(mouseX, mouseY, 20, 20);

}

void keyPressed() {
  if (key == 'r') {
    currLevel = new Level1();
  }
  if (key == 't') {
    currLevel = new Level2(); 
  }
}
