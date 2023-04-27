class Weight extends Movable {

  float val;
  Sprite sprite;
  InputBox inputMass;

  Weight(ArrayList<Liquid> liquidList, float g, Ground ground) {
    super(liquidList, g, ground);
    this.location = new PVector(100, 310);
    this.size = new PVector(88, 104);
    start = location.get();
    velocity = new PVector(0, 0);
    mass = 250;
    sprite = new Sprite("logo", loadImage("sprites/game/env/weight/weight.png"), 1, 1, 0);
    inputMass = new InputBox(new PVector(this.location.x + 40, this.location.y - this.size.y/2), new PVector(168, 32), 1);
  }
  Weight(PVector location, ArrayList<Liquid> liquidList, float g, Ground ground) {
    super(liquidList, g, ground);
    this.location = location;
    this.size = new PVector(88, 104);
    start = location.get();
    velocity = new PVector(0, 0);
    mass = 250;
    sprite = new Sprite("logo", loadImage("sprites/game/env/weight/weight.png"), 1, 1, 0);
    inputMass = new InputBox(new PVector(this.location.x + this.size.x + 16, this.location.y - this.size.y/28), new PVector(168, 32), 1);
  }

  void display() {
    sprite.display(location.x, location.y);
    inputMass.update();
    inputMass.display();
    
  }
  
  void massSet(){
    this.mass = inputMass.intValue;
    print(mass);
    setMass(inputMass.intValue);
  }
}
