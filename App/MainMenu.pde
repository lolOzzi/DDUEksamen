class MainMenu {

  PVector playButtonLoc, titleLoc;
  PImage sprite, titleSprite, backgroundSprite;
  Sprite logoSprite;
  Sprite playButtonSprite;
  int logoWait = 0;

  MainMenu() {
    playButtonLoc = new PVector(688, 584);
    titleLoc = new PVector((1920 - 1319)/2, 200);

    logoSprite = new Sprite("logo", loadImage("sprites/mainmenu/gametitle.png"), 1, 8, 12, 60);
    playButtonSprite = new Sprite("playButton", loadImage("sprites/mainmenu/playbutton.png"), 1, 1, 0);
    //sprite = loadImage("sprites/mainmenu/playbutton.png");
    //titleSprite = loadImage("sprites/mainmenu/gametitle1.png");

    backgroundSprite = loadImage("sprites/game/env/background/background.png");
    
  }

  void display() {
    fill(0);
    image(backgroundSprite, 0, 0);
   // image(sprite, playButtonLoc.x, playButtonLoc.y);
    //image(titleSprite, titleLoc.x, titleLoc.y);
    logoSprite.display(titleLoc.x, titleLoc.y);
    playButtonSprite.display(playButtonLoc.x, playButtonLoc.y);
    logoSprite.update();
    
  }

  void update() {
    playButton();
  }
  
  
  void playButton(){
    if (mouseInBox() && mousePressed){
      gameState.scene = '1';
    }
  }
  
  
  boolean mouseInBox() {
    if (mouseX >= playButtonLoc.x && mouseX <= playButtonLoc.x + 536) {
      if (mouseX >= playButtonLoc.y && mouseY <= playButtonLoc.y + 248) {
        return true;
      }
    }
    return false;
  }
}
