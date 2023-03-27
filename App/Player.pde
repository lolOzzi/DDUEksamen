class Player extends Movable {
  PVector speed;
  float jump;
  boolean hitBlock = false;

  Player() {
    speed = new PVector(1, 0);
    mass = 2f;
    location = new PVector(50, 100);
    jump =  44.4;
  }

  void moveUpdate() {
    keyCheck();
    hitBlock = inBlocks();
    atEnd();
    if (onGround == true && hitBlock == false) {
      location.add(speed);
    }
    update();
  }

  void display() {
    rect(location.x, location.y, size.x, size.y);
  }

  void keyCheck() {
    if (keyPressed == true) {
      if (key == ' ' && onGround == true) {
        onGround = false;
        jump();
        print("Hello");
      }
    }
  }

  boolean inBlocks() {
    for (StopBlock block : blockArr) {
      if(block.location.x < location.x && location.x < block.location.x + block.size.x){
        print("I AM INSIDE");
        return true;
      }
    }
    return false;
  }
  
  void atEnd(){
    if(endBlock.location.x < location.x && location.x < endBlock.location.x + endBlock.size.x){
      println("I AM AT THE END, CONGRATULATIONS");
    }
  }

  void jump(){
    applyForce(new PVector(0, -jump));
  }
}
