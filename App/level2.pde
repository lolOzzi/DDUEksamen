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
    spring = new Spring(new PVector(230, 770), "right");

    //Spike definitions
    spikeArr.add(new Spike( new PVector(1030, 800)));
    spikeArr.add(new Spike( new PVector(1030 -56, 800)));
    spikeArr.add(new Spike( new PVector(1030 -56 *2, 800)));
    spikeArr.add(new Spike( new PVector(1030 -56 *3, 800)));

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
