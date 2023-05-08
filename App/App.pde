import de.bezier.data.sql.*;
import de.bezier.data.sql.mapper.*;
import processing.sound.*;


final String THISPROC = this.getClass().getCanonicalName();
final PApplet PAPPLET = this;
SQLite db;

SoundFile defaultTrack;
SoundFile actionTrack;
ArrayList<PImage> backgroundImgs = new ArrayList<PImage>();
ArrayList<PImage> groundImgs = new ArrayList<PImage>();
ArrayList<PImage> platformImgs = new ArrayList<PImage>();
ArrayList<Movable> arr = new ArrayList<Movable>();
  ArrayList<StaticObject> staticObjectList = new ArrayList<StaticObject>();
Helper helper = new Helper();

GameState gameState;
LevelSelector levelSelector;
Level1 l1;
Level currLevel;
MainMenu mainMenu;
Spring spring;
Player player;
Sprite spriteAnimation;
int playerID;

boolean tempMouseReleased = true;
Login login;

int savedLevelIndex;
 String[] LEVEL_CLASS_NAMES = {"Level1", "Level2", "Level3"};


public void setup() {
  //size(960, 540);
  fullScreen(P2D, 2);
  noSmooth();
  frameRate(30);
  hint(DISABLE_TEXTURE_MIPMAPS);
  db = new SQLite( this, "./data/mvDB.sqlite" );
  //Load images
  backgroundImgs = helper.loadImages( "/sprites/game/env/background/");
  groundImgs = helper.loadImages( "/sprites/game/env/ground/");
  platformImgs = helper.loadImages( "/sprites/game/env/platform/");
    
  //music
  actionTrack = new SoundFile(this, "/music/action.wav");
  actionTrack.amp(0.75);
  defaultTrack = new SoundFile(this, "/music/default.wav");
  defaultTrack.amp(0.75);
  defaultTrack.play();
  defaultTrack.loop();
  
  login = new Login();
  gameState = new GameState();
  currLevel = new Level1();
  mainMenu = new MainMenu();
  levelSelector = new LevelSelector();
  //currLevel = new Level0();

  // Create a new SpriteAnimation object

  
  // Load sprite sheets for animation
  //PImage walkSpriteSheet = loadImage("coolguy_walk.png");

  // Add sprite animations to the SpriteAnimation object
  //Parameters: String name, PImage spriteSheet, int rows, int cols, int frameRate
 // spriteAnimation = new Sprite(walkSpriteSheet, 1, 8, 8);
  textureMode(NORMAL);
  noStroke();
}

void draw() {
  //background(255);
  gameState.update();
  //ellipse(mouseX, mouseY, 20, 20);

}

void mouseReleased() {
  tempMouseReleased = true;
}
boolean isMouseReleased() {
  if (tempMouseReleased) {
    tempMouseReleased = false;
    return true;
  }
  return false;
}
