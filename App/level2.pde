class Level2 extends Level {
  ArrayList<Movable> arr = new ArrayList<Movable>();

  int amount = 10;
  color liquid_color = color(0, 0, 255);
  color air_color = color(255, 255, 255);
  int count = 0;
  float g = 9.82;
  int counter = 1;
  Spike spike;

  UIButton start = new UIButton(100, 100, 100, 100, "Start");

  Liquid air;
  Ground ground;
  InputBox numInput;

  boolean first = true;
  boolean won = false;


  public Level2() {
    air = new Liquid(0, 0, width, height/3, 1.204, air_color );
    liquidList.add(air);
    ground = new Ground();
    staticObjectList.add(ground);
    player = new Player(liquidList, g, ground);
    endBlock = new StopBlock(1500, ground.location.y - 70, 70, 70);
    //input = new InputBox();
    spring = new Spring();
    numInput = new InputBox(new PVector(400, spring.location.y - 50), new PVector(150, 50), 1);
    spike = new Spike();
  }

  public void update() {

    if (startGame || counter == 1) {
      if (first && counter != 1) {
        println("value: " + numInput.intValue);
        first = false;
      }
      image(backgroundImgs.get(0), 0, 0);
      //background(255);
      count++;
      fill(255);
      ground.display();
      fill(255);
      player.moveUpdate();
      spring.fLength = numInput.intValue;
      spring.update();
      spring.display();
      spike.update();
      spike.display();
      fill(0, 255, 0);
      player.display();
      endBlock.display();
      for (StopBlock block : blockArr) {
        block.display();
      }
    }


    //Start screen
    start.display();
    numInput.display();
    numInput.update();
    counter++;
    if (won) {
      fill(0, 150);

      rect(0, 0, width, height);
      fill(255, 233, 149);
      rect(width / 2 - 400, height / 2 - 200, 800, 400);
      fill(0);
      textAlign(CENTER);
      PFont font50 = createFont("Georgia", 50);
      textFont(font50);
      text("You Won!", width/2, height/2);
      textAlign(BASELINE);
    }
  }


  void mouseClicked() {
    println("mousePressed");
    if (mouseButton == LEFT && start.isClicked()) {
      startGame = true;
      println("startGame");
    }
  }
}
