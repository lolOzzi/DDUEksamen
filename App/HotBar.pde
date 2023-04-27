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
    location = new PVector(0, 24);
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
    image(calc, 768, location.y);
    image(hint, 1040, location.y);
    image(home, 1616, location.y);
    image(play, 224, location.y);
    image(playing, 224, location.y);
    image(restart, 480, location.y);
    image(sOff, 1336, location.y);
    image(sOn, 1336, location.y);
    update();
  }

  void update() {
    if (mouseButton == LEFT && calcB.isClicked()) {
    }
    if (mouseButton == LEFT && hintB.isClicked()) {
      hint1();
    }
    if (mouseButton == LEFT && homeB.isClicked()) {
      home();
    }
    if (mouseButton == LEFT && playB.isClicked()) {
      play();
    }
    if (mouseButton == LEFT && playingB.isClicked()) {
      playing();
    }
    if (mouseButton == LEFT && restartB.isClicked()) {
      restart();
    }
    if (mouseButton == LEFT && sOffB.isClicked()) {
      sound();
    }
    if (mouseButton == LEFT && sOnB.isClicked()) {
      sound();
    }
  }

  void hint1() {
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
