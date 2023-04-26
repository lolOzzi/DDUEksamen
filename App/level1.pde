class Level1 extends Level {
  ArrayList<Movable> arr = new ArrayList<Movable>();

  int amount = 10;
  color liquid_color = color(0, 0, 255);
  color air_color = color(255, 255, 255);
  int count = 0;
  float g = 9.82;
  int counter = 1;

  UIButton start = new UIButton(100, 100, 100, 100, "Start");

  Liquid air;
  
  Ground ground;

  int spacing = 500;

  Button button;
  Platform buttonPlatform = new Platform(250, 475 - 8, 2, "20N - 50N");
  Movable weight;
  Button button2;
  Platform buttonPlatform2 = new Platform(250 + spacing, 475 - 8, 2, "20N - 50N");
  Movable weight2;
  Weight wTest;
  Weight wTest2;

  InputBox numInput;
  InputBox numInput2;

  boolean first = true;
  boolean won = false;


  public Level1() {
    air = new Liquid(0, 0, width, height/3, 1.204, air_color );
    liquidList.add(air);
    ground = new Ground();
    //weight = new Movable(293, 370, liquidList, g, ground);
    wTest = new Weight(new PVector(250, 200), liquidList, g, ground);
    button = new Button(275, 475-40, 20, 50);
    //weight2 = new Movable(293 + spacing, 370, liquidList, g, ground);
    wTest2 = new Weight(new PVector( (250 + spacing), 200), liquidList, g, ground);
    button2 = new Button(275 + spacing, 475-40, 20, 50);
    staticObjectList.add(ground);
    staticObjectList.add(buttonPlatform);
    staticObjectList.add(buttonPlatform2);
    staticObjectList.add(button);
    staticObjectList.add(button2);
    movableList.add(weight);
    player = new Player(liquidList, g, ground);
    blockArr.add(new StopBlock(buttonPlatform.location.x + buttonPlatform.size.x / 2, ground.location.y - 70, 70, 70));
    blockArr.add(new StopBlock(buttonPlatform2.location.x + buttonPlatform2.size.x / 2, ground.location.y - 70, 70, 70));
    endBlock = new StopBlock(1500, ground.location.y - 70, 70, 70);
    //input = new InputBox();
    numInput = new InputBox(new PVector(400, wTest.location.y - 50), new PVector(150, 50), 1);
    numInput2 = new InputBox(new PVector(400 + spacing, wTest2.location.y - 50), new PVector(150, 50), 1);
    spring = new Spring();
  }

  public void update() {

    if (startGame || counter == 1) {
      if (first && counter != 1) {
        println("value: " + numInput.intValue);
        wTest.setMass(numInput.intValue);
        wTest2.setMass(numInput2.intValue);
        first = false;
      }
      image(backgroundImgs.get(0), 0, 0);
      //background(255);
      count++;
      fill(255);
      ground.display();
      fill(255);
      player.moveUpdate();
      fill(0, 255, 0);
      player.display();
      endBlock.display();
      for (StopBlock block : blockArr) {
        block.display();
      }
      
      //Puzzle 1
      buttonPlatform.display();
      button.display();
      //weight.display();
      //weight.update();
      wTest.display();
      wTest.update();
      //println("Weight: " + weight.mass + "loc: " + weight.location.x + ", " + weight.location.y);
      if (button.pressed) {
        blockArr.get(0).active = false;
      }

      //Puzzle 2
      buttonPlatform2.display();
      button2.display();
      //weight2.display();
      //weight2.update();
      wTest2.update();
      wTest2.display();
      if (button2.pressed) {
        blockArr.get(1).active = false;
      }
      if (player.atEnd == true) {
        won = true;
      }
    }


    //Start screen
    start.display();
    numInput.display();
    numInput.update();
    numInput2.display();
    numInput2.update();
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
    
    //spring.display();
    //spring.update();
  }


  void mouseClicked() {
    println("mousePressed");
    if (mouseButton == LEFT && start.isClicked()) {
      startGame = true;
      println("startGame");
    }
  }
}
