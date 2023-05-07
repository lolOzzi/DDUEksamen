class Level1 extends Level {
  ArrayList<Movable> arr = new ArrayList<Movable>();

  int amount = 10;
  color liquid_color = color(0, 0, 255);
  color air_color = color(255, 255, 255);
  int count = 0;
  float g = 9.82;
  float wCount = 0;
  int counter = 1;

  Liquid air;

  int spacing = 500;

  Button button;
  Platform buttonPlatform;
  Button button2;
  Platform buttonPlatform2;
  Weight weight;
  Weight weight2;

  InputBox numInput;
  InputBox numInput2;

  Door greenDoor;
  Door redDoor;

  int doorGroundOffset = -176 + 8;
  

  PFont inputFont = createFont("./font/pixel.ttf", 16, false);

  public Level1() {
    super();
    air = new Liquid(0, 0, width, height/3, 1.204, air_color );
    liquidList.add(air);

    //Weight button combinations
    weight = new Weight(new PVector(275, 200), liquidList, g, ground);
    button = new Button(275, 475-40, 20, 50, "green");
    weight2 = new Weight(new PVector( (275 + spacing), 200), liquidList, g, ground);
    button2 = new Button(275 + spacing, 475-40, 100, 140, "red");

    buttonPlatform = new Platform(250, 475 - 8, 2, (int) button.minForce + "N - " + (int) button.maxForce + "N");
    buttonPlatform2 = new Platform(250 + spacing, 475 - 8, 2, (int) button2.minForce + "N - " +  (int) button2.maxForce + "N");
    staticObjectList.add(ground);
    staticObjectList.add(buttonPlatform);
    staticObjectList.add(buttonPlatform2);
    staticObjectList.add(button);
    staticObjectList.add(button2);
    

    //Door definitions
    greenDoor = new Door( (int) (buttonPlatform.location.x + buttonPlatform.size.x / 2), (int) ground.location.y + doorGroundOffset, "green");
    redDoor = new Door( (int) (buttonPlatform2.location.x + buttonPlatform2.size.x / 2), (int) ground.location.y + doorGroundOffset, "red");
    blockArr.add(greenDoor.stopBlock);
    blockArr.add(redDoor.stopBlock);

    PImage hintImg = loadImage("./formula/gravity.png");
    hint = new Hint("Hint: Gravity", "The force of gravity is the weight of the object multiplied by the acceleration of gravity. The acceleration of gravity on Earth is 9.8 m/s^2.", hintImg);
    
  }

  public void update() {
    allDisplay();
    if (counter == 1) {
      this.startTime = millis();
    }

    if (startGame || counter == 1) {
      if (first && counter != 1) {
        actionSetup();
        weight.massInput.disabled = true;
        weight2.massInput.disabled = true;
      }
      count++;
      player.moveUpdate();
      
      
      //Puzzle 1

      weight.update();

      if (button.pressed) {
        blockArr.get(0).active = false;
      }

      //Puzzle 2
      weight2.update();
      if (button2.pressed) {
        blockArr.get(1).active = false;
      }
    }


    weight.updateInput();
    weight2.updateInput();
    counter++;

    winUpdate();
  }

  void allDisplay() {
     defaultDisplay();
      
      //Main Doors
      greenDoor.display();
      redDoor.display();
      
      //Player displayed in middle of Door displays
      if (startGame) {
        player.display(true);
      } else {
        player.display(false);
      }

      
      //Door Side
      greenDoor.displaySide();
      redDoor.displaySide();
      
      
      //Puzzle 1
      buttonPlatform.display();
      button.display();
      weight.display();


      //Puzzle 2
      buttonPlatform2.display();
      button2.display();
      weight2.display();
  }

}
