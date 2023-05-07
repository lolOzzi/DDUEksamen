class Weight extends Movable {

  float val;
  Sprite sprite;
  InputBox massInput;

  Weight(ArrayList<Liquid> liquidList, float g, Ground ground) {
    super(liquidList, g, ground);
    this.location = new PVector(100, 310);
    this.size = new PVector(88, 104);
    start = location.get();
    velocity = new PVector(0, 0);
    mass = 250;
    sprite = new Sprite("logo", loadImage("sprites/game/env/weight/weight.png"), 1, 1, 0);
    massInput = new InputBox(new PVector(this.location.x + 40, this.location.y - this.size.y/2), new PVector(168, 40), 1);
  }

  Weight(PVector location, ArrayList<Liquid> liquidList, float g, Ground ground) {
    super(liquidList, g, ground);
    this.location = location;
    this.size = new PVector(88, 104);
    start = location.get();
    velocity = new PVector(0, 0);
    mass = 250;
    sprite = new Sprite("logo", loadImage("sprites/game/env/weight/weight.png"), 1, 1, 0);
    massInput = new InputBox(new PVector(this.location.x + this.size.x + 16, this.location.y - this.size.y/28), new PVector(168, 40), 1, "Input Mass", "kg");
  }

  void display() {
    sprite.display(location.x, location.y);
    massInput.update();
    massInput.display();
  }
  void updateInput(){
    massInput.display();
    massInput.update();
    massSet();
  }
  
  void massSet(){
    this.mass = massInput.intValue;
    setMass(massInput.intValue);
  }
}
