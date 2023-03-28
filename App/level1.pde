class Level1 extends Level {
  ArrayList<Movable> arr = new ArrayList<Movable>();

  int amount = 10;
  color liquid_color = color(0, 0, 255);
  color air_color = color(255, 255, 255);
  int count = 0;
  float g = 9.82;

  Liquid air;
  Player player;
  Ground ground;

  Button button;
  StaticObject buttonPlatform = new StaticObject(250, 475, 200, 75);
  Movable weight;

  public Level1() {
      air = new Liquid(0, 0, width, height/3, 1.204, air_color );
      liquidList.add(air);
      ground = new Ground();
      weight = new Movable(280, 300, liquidList, g, ground);
      button = new Button(275, 475-40, 20, 30);
      staticObjectList.add(ground);
      staticObjectList.add(buttonPlatform);
      staticObjectList.add(button);
      movableList.add(weight);
      player = new Player(liquidList, g, ground);
      blockArr.add(new StopBlock(400, ground.location.y - 70, 70, 70));
      blockArr.add(new StopBlock(600, ground.location.y - 70, 70, 70));
      endBlock = new StopBlock(1000, ground.location.y - 70, 70, 70);
  }

  public void update() {
    count++;
    fill(255);
    ground.display();
    fill(255);
    player.moveUpdate();
    fill(0, 255, 0);
    player.display();
    endBlock.display(); 
    for (StopBlock block : blockArr){
      block.display();
    }

    //Puzzle 1
    buttonPlatform.display();
    button.display();
    weight.display();
    weight.update();
    if (button.pressed) {
      blockArr.get(0).active = false;
    }
  }

}
