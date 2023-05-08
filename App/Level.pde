import java.util.ArrayList;
import java.lang.reflect.Constructor;
import java.lang.reflect.*;
class Level {

  ArrayList<Liquid> liquidList = new ArrayList<Liquid>();
  ArrayList<Movable> movableList = new ArrayList<Movable>();
  ArrayList<StopBlock> blockArr = new ArrayList<StopBlock>();

  color liquid_color = color(0, 0, 255);
  color air_color = color(255, 255, 255);
  float g = 9.82;
  int count = 0;
  WinScreen wScreen;
  HotBar hBar = new HotBar();
  float score;

  boolean startGame;
  boolean hintEnabled;

  Hint hint;
  InfoBox infoBox;

  StopBlock endBlock;
  Ground ground;

  //First display pass
  boolean first = true;

  //Win screen
  boolean won = false;
  boolean wonSetup = true;
  WinFlag winFlag;

  //Timer
  int startTime;
  int endTime;
  int elapsedTime;

  //Level



  public Level() {
    //Level setup
    staticObjectList = new ArrayList<StaticObject>();

    //Env setup
    ground = new Ground();

    //Player setup
    player = new Player(liquidList, g, ground);


    //Win setup
    winFlag = new WinFlag(1500, (int) (ground.location.y - 128));
    endBlock = winFlag.endBlock;
    wScreen = new WinScreen();

    //Hint setup
    PImage hintImg = loadImage("./formula/gravity.png");
    hint = new Hint("Hint", "Gravity", hintImg);

    //InfoBox setup
    infoBox = new InfoBox("Player mass: " + player.mass + " kg;Gravity: " + g + " m/s^2;");


    if (actionTrack.isPlaying()) {
      actionTrack.stop();
      defaultTrack.play();
      defaultTrack.loop();
    }
  }

  public void update() {
    hBar.display();

  }

  public ArrayList<Liquid> getLiquidList() {
    return liquidList;
  }

  public float getGravity() {
    return g;
  }

  Level reset() {
    return currLevel.getCurrentLevel();
  }

  void nextLevel() {
    currLevel = currLevel.getNextLevel();
  }

  void actionSetup() {
    hBar.inPlay = true;
    first = false;
    defaultTrack.stop();
    actionTrack.play();
    actionTrack.loop();
  }

  void defaultDisplay() {
    image(backgroundImgs.get(0), 0, 0);
    ground.display();
    winFlag.display();
  }

  void winUpdate() {
    if (player.atEnd == true) {
        won = true;
    }
    if (won) {
      if (wonSetup) {
        this.endTime = millis();
        this.elapsedTime = this.endTime - this.startTime;
        wonSetup = false;
      }

      wScreen.score = round(500 - elapsedTime/300);
      if (wScreen.score < 100) {
        wScreen.score = 100;
      }
      wScreen.display();
    }
  }

  public Level getNextLevel() {
      gameState.levelIndex++;
      if (gameState.levelIndex > LEVEL_CLASS_NAMES.length -1) {
        gameState.levelIndex = 0;
      }
      if (gameState.levelIndex > gameState.maxLevelIndex) {
        gameState.maxLevelIndex = gameState.levelIndex;
        login.setLevelIndex();
      }

      final Class<?> appCls = PAPPLET.getClass(), innerCls;
      try {
        innerCls = Class.forName(appCls.getName() + '$' + LEVEL_CLASS_NAMES[gameState.levelIndex]);
        return (Level) innerCls.getDeclaredConstructor(appCls).newInstance(PAPPLET);
      }
      catch (final ReflectiveOperationException ex) {
        println(ex.getCause());
        throw new RuntimeException(ex);
      }
  }

  public Level getCurrentLevel() {
    final Class<?> appCls = PAPPLET.getClass(), innerCls;
    try {
      innerCls = Class.forName(appCls.getName() + '$' + LEVEL_CLASS_NAMES[gameState.levelIndex]);
      return (Level) innerCls.getDeclaredConstructor(appCls).newInstance(PAPPLET);
    }
    catch (final ReflectiveOperationException ex) {
      //System.err.println(ex);
      throw new RuntimeException(ex);
    }
  }
}
