import java.util.ArrayList;

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

  boolean startGame;

  StopBlock endBlock;
  Ground ground;

  public Level() {
    staticObjectList = new ArrayList<StaticObject>();
    if (actionTrack.isPlaying()) {
      actionTrack.stop();
      defaultTrack.play();
      defaultTrack.loop();
    }
  }

  public void update() {
    count++;
    fill(255);
    ground.display();
    //hBar.display();
  }

  public ArrayList<Liquid> getLiquidList() {
    return liquidList;
  }

  public float getGravity() {
    return g;
  }
  Level reset() {
    return new Level();
  }
  void nextLevel() {
  }
}
