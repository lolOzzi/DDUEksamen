class Level0 extends Level {
  ArrayList<Movable> arr = new ArrayList<Movable>();
  int amount = 10;
  color liquid_color = color(0, 0, 255);
  color air_color = color(255, 255, 255);
  int count = 0;
  float g = 9.82;

  Liquid liquid;
  Liquid air;
  Ground ground;

  public Level0() {
    liquidList = super.getLiquidList();
    liquid = new Liquid(0, height/3, width, height/2, 1000, liquid_color);
    air = new Liquid(0, 0, width, height/3, 1.204, air_color );
    ground = new Ground();
    liquidList.add(air);
    liquidList.add(liquid);
    
    for (int i = 0; i < amount; i++) {
      arr.add(new Movable(liquidList, g, ground));
    }
  }

  public void update() {
    count++;
    fill(255);
    liquid.display();
    air.display();
    ground.display();

    spriteAnimation.setSprite("walk");
    spriteAnimation.display(0, height - ground.size.y - 17*8);
    spriteAnimation.update();

    //StaticObject amogus = new StaticObject(0, 0, 100, 100, imgs.get(0));
    //StaticObject box = new StaticObject(0, 0, 100, 100);
    //box.display();
    
    staticObjectList.add(new StaticObject(width / 2 - 300, height / 3 - 100, 300, 100));
    staticObjectList.get(0).display();

    fill(49, 51, 56);

    for (int i = 0; i < amount; i++) {
      Movable p = arr.get(i);
      p.update();
      p.checkEdges();
      p.display(i);
    }
    fill(255);
  }
}
