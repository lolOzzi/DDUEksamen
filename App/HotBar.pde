class HotBar {

  PVector location;
  PImage bar, calc, hint, home, play, playing, restart, sOff, sOn;
  float score;
  boolean inPlay = false;
  boolean mute = false;
  String path = "sprites/hotbar/icons/";
  UIButton calcB = new UIButton(768, 24, 88, 104, "Start");
  UIButton hintB = new UIButton(1040, 24, 112, 104, "Start");
  UIButton homeB = new UIButton(1616, 24, 96, 104, "Start");
  UIButton playB = new UIButton(224, 24, 72, 104, "Start");
  UIButton restartB = new UIButton(480, 24, 104, 104, "Start");
  UIButton sOffB = new UIButton(1336, 24, 104, 104, "Start");

  HotBar() {
    location = new PVector(0, 16);
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
    image(restart, 480, location.y);

    if (!inPlay) {
      image(play, 224, location.y);
    } else if (inPlay) {
      tint(255, 127); 
      image(playing, 224, location.y);
      tint(255, 255); 
    }

    if (mute) {
      image(sOff, 1336, location.y);
    } else if (!mute) {
      image(sOn, 1336, location.y);
    }
    update();
  }

  void update() {
    if (mousePressed && (mouseButton == LEFT) && calcB.isClicked()) {
    }
    if (mousePressed && (mouseButton == LEFT) && hintB.isClicked()) {
      hint();
    }
    if (mousePressed && (mouseButton == LEFT) && homeB.isClicked()) {
      home();
    }
    if (mousePressed && (mouseButton == LEFT) && playB.isClicked()) {
      play();
    }
    if (mousePressed && (mouseButton == LEFT) && restartB.isClicked()) {
      restart();
    }
    if (mousePressed && (mouseButton == LEFT) && sOffB.isClicked()) {
      sound();
    }
  }

  void hint() {
    if (currLevel.hintEnabled == false && isMouseReleased()) {
      currLevel.hintEnabled = true;
    } else if (currLevel.hintEnabled == true  && isMouseReleased()) {
      currLevel.hintEnabled = false;
    }
  }
  void home() {
    gameState.scene = '2';
  }
  void play() {
    if (inPlay) {
      //currLevel.startGame = false;
    } else if (!inPlay) {
      currLevel.startGame = true;
    }
  }
  void playing() {
  }
  void restart() {
    currLevel = currLevel.reset();
  }
  
  void sound() {
    if (!mute && isMouseReleased()) {
      actionTrack.amp(0);
      defaultTrack.amp(0);
      mute = true;
    } else if (mute && isMouseReleased()) {
      actionTrack.amp(1);
      defaultTrack.amp(1);
      mute = false;
    }
  }
}
