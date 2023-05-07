class WinScreen {

  PVector location, size;
  PImage lvlComp, sRetry, sNext, aSLvl;
  int score;
  String path = "sprites/game/endscreen/";
  UIButton retryB;
  UIButton nextB;
  UIButton allB;
  PFont pixelFont35;

  WinScreen() {
    location = new PVector(width/2 - 492, height/2 - 336);
    size = new PVector(0, 0);
    lvlComp = loadImage(path + "levelcompleted.png");
    sRetry = loadImage(path + "retrylevel.png");
    sNext = loadImage(path + "nextlevel.png");
    aSLvl = loadImage(path + "levelscreen.png");
    retryB = new UIButton(location.x + 398, location.y + 432, 200, 168, "Start");
    nextB = new UIButton(location.x + 672, location.y + 432, 200, 168, "Start");
    allB = new UIButton(location.x + 112, location.y + 432, 200, 168, "Start");
    pixelFont35 = createFont("./font/pixel.ttf", 35, false);
  }

  void display() {
    fill(0, 150);
    rect(0, 0, width, height);
    image(lvlComp, location.x, location.y);
    image(sRetry, location.x + 398, location.y + 432);
    image(sNext, location.x + 672, location.y + 432);
    image(aSLvl, location.x + 112, location.y + 432);
    textFont(pixelFont35);
    textAlign(CENTER);
    text("Your Score Is: " + score, location.x + 984/2, location.y + 350);
    textAlign(LEFT);
    update();
  }

  void update() {
    if (mouseButton == LEFT && retryB.isClicked()) {
      currLevel = currLevel.reset();
    }
    if (mouseButton == LEFT && nextB.isClicked()) {
      currLevel.nextLevel();
    }
    if (mouseButton == LEFT && allB.isClicked()) {
      gameState.scene = '2';
    }
  }
}
