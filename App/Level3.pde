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
  InputBox numInput;

  ArrayList<Spike> spikeArr = new ArrayList<Spike>();
  


  public Level3() {
    super();
    air = new Liquid(0, 0, width, height/3, 1.204, air_color );
    liquidList.add(air);

    //Spring setup
    spring = new Spring(new PVector(230, 770), "right");
    numInput = new InputBox(new PVector(spring.location.x, spring.location.y - 50), new PVector(150, 50), 1);

    //Spike definitions
    spikeArr.add(new Spike( new PVector(1030, 800)));
    spikeArr.add(new Spike( new PVector(1030 -56, 800)));
    spikeArr.add(new Spike( new PVector(1030 -56 *2, 800)));
    spikeArr.add(new Spike( new PVector(1030 -56 *3, 800)));
    spikeArr.add(new Spike( new PVector(1030 -56 *4, 800)));
    spikeArr.add(new Spike( new PVector(1030 -56 *5, 800)));
    spikeArr.add(new Spike( new PVector(1030 -56 *6, 800)));
    spikeArr.add(new Spike( new PVector(1030 -56 *7, 800)));
    spikeArr.add(new Spike( new PVector(1030 -56 *8, 800)));

  }

  public void update() {

    if (startGame || counter == 1) {
      if (first && counter != 1) {
        actionSetup();
      }
      count++;
      defaultDisplay();
      
      spring.fLength = numInput.intValue;
      spring.update();
      spring.display();
      for (Spike spike : spikeArr) {
        spike.display();
        spike.update();
      }
      fill(0, 255, 0);
      player.display();
    }

    numInput.update();
    numInput.display();
    
    winUpdate();
    counter++;
  }
}
