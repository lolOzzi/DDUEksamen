class Weight extends Movable {

  float val;
  Sprite sprite;

  Weight(ArrayList<Liquid> liquidList, float g, Ground ground) {
    super(liquidList, g, ground);
    this.location = new PVector(100, 310);
    this.size = new PVector(88, 104);
    start = location.get();
    velocity = new PVector(0, 0);
    mass = 250;
    sprite = new Sprite("logo", loadImage("sprites/game/env/weight/weight.png"), 1, 1, 0);
  }
  Weight(PVector location, ArrayList<Liquid> liquidList, float g, Ground ground) {
    super(liquidList, g, ground);
    this.location = location;
    this.size = new PVector(88, 104);
    start = location.get();
    velocity = new PVector(0, 0);
    mass = 250;
    sprite = new Sprite("logo", loadImage("sprites/game/env/weight/weight.png"), 1, 1, 0);
  }

  void display() {
    sprite.display(location.x, location.y);
  }
}
