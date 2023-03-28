class Player extends Movable {
  PVector speed;
  float jump;
  boolean hitBlock = false;
  boolean atEnd = false;
  ArrayList<StopBlock> blockArr;
  StopBlock endBlock;

  Player(ArrayList<Liquid> liquidList, float g, Ground ground ) {
    super(liquidList, g, ground);
    acceleration = new PVector(1.75, 0);
    speed = new PVector(1.75, 0);
    mass = 2f;
    location = new PVector(50, ground.location.y + size.y);
    jump =  44.4;
  }

  void moveUpdate() {
    keyCheck();
    hitBlock = inBlocks();
    atEnd();
    if (onGround == true && hitBlock == false) {
      speed.add(acceleration);
      location.add(speed);
    }  
    update();
    if (hitBlock) {
      velocity.x = 0;
      velocity.y = 0;
    }
  }

  void display() {
    rect(location.x, location.y, size.x, size.y);
  }

  void keyCheck() {
    if (keyPressed == true) {
      if (key == ' ' && onGround == true) {
        onGround = false;
        jump();
      }
    }
  }

  boolean inBlocks() {
    blockArr = currLevel.blockArr;
    for (StopBlock block : blockArr) {
      if(block.location.x < location.x && location.x < block.location.x + block.size.x && block.active){
        //print("I AM INSIDE");
        return true;
      }
    }
    return false;
  }
  
  void atEnd(){
    endBlock = currLevel.endBlock;
    if(endBlock.location.x < location.x && location.x < endBlock.location.x + endBlock.size.x){
      atEnd = true;
    }
  }

  void jump(){
    applyForce(new PVector(0, -jump));
  }
}
