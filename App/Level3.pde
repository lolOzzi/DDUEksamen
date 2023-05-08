class Level3 extends Level {
  ArrayList<Movable> arr = new ArrayList<Movable>();

  int amount = 10;
  color liquid_color = color(0, 0, 255);
  color air_color = color(255, 255, 255);
  int count = 0;
  float g = 9.82;
  int counter = 1;
  Spike spike;

  Liquid air;

  ArrayList<Spike> spikeArr = new ArrayList<Spike>();

  Button button;
  Platform buttonPlatform;
  Weight weight;

  Door greenDoor;

  int doorGroundOffset = -176 + 8;


  public Level3() {
    super();
    air = new Liquid(0, 0, width, height/3, 1.204, air_color );
    liquidList.add(air);

    //Force definitions
    float btnMinForce = 20;
    float btnMaxForce = 50;

    //Platform & static object definitions
    buttonPlatform = new Platform(1000, 475 - 8, 2, (int) btnMinForce + "N - " + (int) btnMaxForce + "N");
    staticObjectList.add(ground);
    staticObjectList.add(buttonPlatform);


    //Weight button combinations
    weight = new Weight(new PVector(buttonPlatform.location.x, 200), liquidList, g, ground);
    button = new Button((int) buttonPlatform.location.x, 475-40, btnMinForce, btnMaxForce, "green");
    staticObjectList.add(button);
    movableList.add(weight);

    //Door definitions
    greenDoor = new Door( (int) (buttonPlatform.location.x + buttonPlatform.size.x / 2), (int) ground.location.y + doorGroundOffset, "green");
    blockArr.add(greenDoor.stopBlock);

    //Spring setup
    spring = new Spring(new PVector(200, 770), "right");

    //Spike definitions
    spikeArr.add(new Spike( new PVector(500, 800)));

    int spikeRowHeight = (int) (ground.location.y + doorGroundOffset - 88);
    spikeArr.add(new Spike( new PVector(greenDoor.location.x, spikeRowHeight)));
    spikeArr.add(new Spike( new PVector(greenDoor.location.x +56, spikeRowHeight)));
    spikeArr.add(new Spike( new PVector(greenDoor.location.x +56 *2, spikeRowHeight)));
    spikeArr.add(new Spike( new PVector(greenDoor.location.x +56 *3, spikeRowHeight)));
    spikeArr.add(new Spike( new PVector(greenDoor.location.x +56 *4, spikeRowHeight)));
    spikeArr.add(new Spike( new PVector(greenDoor.location.x +56 *5, spikeRowHeight)));
    spikeArr.add(new Spike( new PVector(greenDoor.location.x +56 *6, spikeRowHeight)));
    spikeArr.add(new Spike( new PVector(greenDoor.location.x +56 *7, spikeRowHeight)));
    spikeArr.add(new Spike( new PVector(greenDoor.location.x +56 *8, spikeRowHeight)));

    PImage hintImg = loadImage("./formula/gravity.png");
    hint = new Hint("Hint: Gravity & Play around", "The acceleration of gravity on Earth is still 9.8 m/s^2. This level is more about trying to get a feel for the relation betwwen force and mass", hintImg);
    infoBox = new InfoBox("Player mass: " + player.mass + " kg;Gravity: " + g + " m/s^2;Spring angle: 45 deg");

  }


  public void update() {
    allDisplay();
    if (counter == 1) {
      this.startTime = millis();
    }

    if (startGame || counter == 1) {
      if (first && counter != 1) {
        actionSetup();
        spring.forceInput.disabled = true;
        weight.massInput.disabled = true;
      }
      count++;
      
      player.moveUpdate();
      //Puzzle 1
      spring.update();
      spring.display();
      for (Spike spike : spikeArr) {
        spike.display();
        spike.update();
      }
      
      
      //Puzzle 2
      weight.update();
      if (button.pressed) {
        blockArr.get(0).active = false;
      }
    }

    //Update inputs
    spring.updateInput();
    weight.updateInput();
    
    winUpdate();
    counter++;
  }
  void allDisplay() {
    defaultDisplay();
    spring.display();
    for (Spike spike : spikeArr) {
      spike.display();
    }
    greenDoor.display();

    if (startGame) {
      player.display(true);
    } else {
      player.display(false);
    }

    greenDoor.displaySide();

    buttonPlatform.display();
    button.display();
    weight.display();
  }
}