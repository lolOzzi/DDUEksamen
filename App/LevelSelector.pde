class LevelSelector {

    PVector backButtonLoc, levelBoxLoc;
  PImage mainSprite, backButtonSprite, levelBoxSprite;
  int logoWait = 0;
  ArrayList<PVector> levelBoxLocs;
  PFont Pixel64;

  LevelSelector() {
    backButtonLoc = new PVector(64, height - 200 - 64);
    levelBoxLoc = new PVector(64*8, 44*8);

    mainSprite = loadImage("sprites/levelmenu/levelselect.png");
    backButtonSprite = loadImage("sprites/levelmenu/backbutton.png");
    levelBoxSprite = loadImage("sprites/levelmenu/levelbox.png");
    levelBoxLocs = new ArrayList<>();
    for (int i = 0; i < LEVEL_CLASS_NAMES.length; i++) {
      levelBoxLocs.add(new PVector(levelBoxLoc.x + (i * 300), levelBoxLoc.y));
    }
    Pixel64 = createFont("./font/pixel.ttf", 64, false);
  }

  void display() {
    fill(0);
    image(mainSprite, 0, 0);
    image(backButtonSprite, backButtonLoc.x, backButtonLoc.y);
    for (int i = 0; i < LEVEL_CLASS_NAMES.length; i++) {
        if (i > gameState.maxLevelIndex) {
          tint(255, 100);
        } else {
          tint(255, 255);
        }
      image(levelBoxSprite, levelBoxLocs.get(i).x, levelBoxLocs.get(i).y);
      tint(255, 255);
      textFont(Pixel64);
      textAlign(CENTER, CENTER);
      text(i+1, levelBoxLocs.get(i).x + levelBoxSprite.width/2, levelBoxLocs.get(i).y + levelBoxSprite.height/2);
      textAlign(BASELINE);
    }
  }

  void update() {
    if (actionTrack.isPlaying()) {
      actionTrack.stop();
      defaultTrack.play();
      defaultTrack.loop();
    }
    pressButton(backButtonLoc, backButtonSprite, -1);
    for (int i = 0; i < LEVEL_CLASS_NAMES.length; i++) {
        if (i <= gameState.maxLevelIndex) {
            pressButton(levelBoxLocs.get(i), levelBoxSprite, i);
        } 

    }
  }
  
  void pressButton(PVector loc, PImage img, int index){
    if (mouseInBox(loc, img) && mousePressed && isMouseReleased()){
        if (loc == backButtonLoc){
            gameState.scene = '2';
        } else if (loc == levelBoxLocs.get(index)){
            gameState.scene = '1';
            gameState.levelIndex = index;
            currLevel = currLevel.getCurrentLevel();
        }
    }
  }
  
  
  boolean mouseInBox(PVector loc, PImage img) {
    if (mouseX >= loc.x && mouseX <= loc.x + img.width) {
      if (mouseY >= loc.y && mouseY <= loc.y + img.height) {
        return true;
      }
    }
    return false;
  }
}
