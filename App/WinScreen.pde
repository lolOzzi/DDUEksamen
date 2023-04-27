class WinScreen {

  PVector location, size;
  PImage lvlComp, sRetry, sNext, aSLvl;
  float score;
  String path = "sprites/game/endscreen/";
  UIButton retryB = new UIButton(100, 100, 100, 100, "Start");
  UIButton nextB = new UIButton(100, 100, 100, 100, "Start");
  UIButton allB = new UIButton(100, 100, 100, 100, "Start");

  WinScreen() {
    location = new PVector(width/2 - 492, height/2 - 336);
    size = new PVector(0, 0);
    lvlComp = loadImage(path + "levelcompleted.png");
    sRetry = loadImage(path + "retrylevel.png");
    sNext = loadImage(path + "nextlevel.png");
    aSLvl = loadImage(path + "levelscreen.png");
  }

  void display() {
    image(lvlComp, location.x, location.y);
    image(sRetry, location.x + 398, location.y + 432);
    image(sNext, location.x + 672, location.y + 432);
    image(aSLvl, location.x + 112, location.y + 432);
  }

  void update() {
    if (mouseButton == LEFT && retryB.isClicked()) {
      currLevel = currLevel.reset();
    }
    if (mouseButton == LEFT && nextB.isClicked()) {
      currLevel.nextLevel();
    }
    if (mouseButton == LEFT && allB.isClicked()) {
    }
  }
}