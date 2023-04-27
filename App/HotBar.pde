class HotBar {

  PVector location;
  PImage bar, calc, hint, home, play, playing, restart, sOff, sOn;
  float score;
  String path = "sprites/hotbar/icons/";
  UIButton calcB = new UIButton(100, 100, 100, 100, "Start");
  UIButton hintB = new UIButton(100, 100, 100, 100, "Start");
  UIButton homeB = new UIButton(100, 100, 100, 100, "Start");
  UIButton playB = new UIButton(100, 100, 100, 100, "Start");
  UIButton playingB = new UIButton(100, 100, 100, 100, "Start");
  UIButton restartB = new UIButton(100, 100, 100, 100, "Start");
  UIButton sOffB = new UIButton(100, 100, 100, 100, "Start");
  UIButton sOnB = new UIButton(100, 100, 100, 100, "Start");

  HotBar() {
    location = new PVector(0, 25);
    bar = loadImage("sprites/hotbar/hotbar.png");
    calc = loadImage(path + "calculator.png");
    hint = loadImage(path + "hint.png");
    home = loadImage(path + "home.png");
    play = loadImage(path + "play.png");
    playing = loadImage(path + "playing.png");
    restart = loadImage(path + "restart.png");
    sOff = loadImage(path + "sound off.png");
    sOn = loadImage(path + "sound on.png");
  }

  void display() {
    image(bar, location.x, 0);
    image(calc, location.x + 100, location.y);
    image(hint, location.x + 200, location.y);
    image(home, location.x + 300, location.y);
    image(play, location.x + 400, location.y);
    image(playing, location.x + 500, location.y);
    image(restart, location.x + 600, location.y);
    image(sOff, location.x + 700, location.y);
    image(sOn, location.x + 800, location.y);
  }

  void update() {
    if (mouseButton == LEFT && calcB.isClicked()) {
    }
    if (mouseButton == LEFT && hintB.isClicked()) {
    }
    if (mouseButton == LEFT && homeB.isClicked()) {
    }
    if (mouseButton == LEFT && playB.isClicked()) {
    }
    if (mouseButton == LEFT && playingB.isClicked()) {
    }
    if (mouseButton == LEFT && restartB.isClicked()) {
    }
    if (mouseButton == LEFT && sOffB.isClicked()) {
    }
    if (mouseButton == LEFT && sOnB.isClicked()) {
    }
  }

  void hint() {
  }
  void home() {
  }
  void play() {
  }
  void playing() {
  }
  void restart() {
  }
  void sound() {
  }
}
