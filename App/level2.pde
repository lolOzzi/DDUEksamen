class Level2 extends Level {
  ArrayList<Movable> arr = new ArrayList<Movable>();

  int amount = 10;
  color liquid_color = color(0, 0, 255);
  color air_color = color(255, 255, 255);
  int count = 0;
  float g = 9.82;
  int counter = 1;
  Spike spike;

  Liquid air;
  InputBox numInput;

  ArrayList<Spike> spikeArr = new ArrayList<Spike>();
  


  public Level2() {
    super();
    air = new Liquid(0, 0, width, height/3, 1.204, air_color );
    liquidList.add(air);

    //Spring setup
    spring = new Spring(new PVector(230, ground.location.y - 120), "right");

    //Spike definitions
    spikeArr.add(new Spike( new PVector(1030, ground.location.y - 88)));
    spikeArr.add(new Spike( new PVector(1030 -56, ground.location.y - 88)));
    spikeArr.add(new Spike( new PVector(1030 -56 *2, ground.location.y - 88)));
    spikeArr.add(new Spike( new PVector(1030 -56 *3, ground.location.y - 88)));

    PImage hintImg = loadImage("./formula/gravity.png");
    hint = new Hint("Hint: Gravity & Play around", "The acceleration of gravity on Earth is still 9.8 m/s^2. This level is more about trying to get a feel for the relation betwwen force and mass", hintImg);
    infoBox = new InfoBox("Player mass: " + player.mass + " kg;Gravity: " + g + " m/s^2;Spring angle: 45 deg;Min jump dist: " + round(10*(spikeArr.get(3).location.x - spring.location.x + 50)/80)/10.0  + "m");

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
      }
      count++;
      player.moveUpdate();

      spring.update();
      for (Spike spike : spikeArr) {
        spike.update();
      }

    }

    spring.updateInput();
    
    winUpdate();
    counter++;
  }

  void allDisplay() {
     defaultDisplay();
     spring.display();
     for (Spike spike : spikeArr) {
        spike.display();
     }
    if (startGame) {
        player.display(true);
    } else {
        player.display(false);
    }
  }
}
