import java.util.ArrayList;

class Level {
  
  ArrayList<Liquid> liquidList = new ArrayList<Liquid>();
  ArrayList<Movable> movableList = new ArrayList<Movable>();
  ArrayList<StopBlock> blockArr = new ArrayList<StopBlock>();

  color liquid_color = color(0, 0, 255);
  color air_color = color(255, 255, 255);
  float g = 9.82;
  int count = 0; 
  
    UIButton start = new UIButton(100, 100, 100, 100, "Start");
  boolean startGame;
  
  StopBlock endBlock;
  Ground ground;

  public Level() {
  }

  public void update() {
    count++;
    fill(255);
    ground.display();
  }

  public ArrayList<Liquid> getLiquidList() {
    return liquidList;
  }
  
  public float getGravity() {
    return g;
  }
  Level reset(){
    return new Level();
  }
}
