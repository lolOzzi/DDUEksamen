class Player extends Movable { //<>//
  PVector speed;
  float jump;
  boolean hitBlock = false;
  boolean atEnd = false;
  ArrayList<StopBlock> blockArr;
  StopBlock endBlock;
  Sprite jumpSprite, walkSprite;
  SpriteAnimation plAnim;

  Player(ArrayList<Liquid> liquidList, float g, Ground ground ) {
    super(liquidList, g, ground);
    acceleration = new PVector(1.75, 0);
    speed = new PVector(1.75, 0);
    mass = 2f;
    location = new PVector(50, ground.location.y + size.y);
    jump =  44.4;
    size = new PVector(96, 136);
    plAnim = new SpriteAnimation();
    jumpSprite = new Sprite("logo", loadImage("sprites/game/player/movement/jump.png"), 1, 2, 0);
    walkSprite = new Sprite("walk", loadImage("sprites/game/player/movement/walk.png"), 1, 4, 9);

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
    playerAnim();
  }

  void playerAnim() {
    if (velocity.x != 0) {
      walkSprite.display(location.x, location.y);
      walkSprite.update();
      println("I AM HERE " + velocity.x);
    } else {
      jumpSprite.display(location.x, location.y);
      println("I AM IN ELSE " + velocity.x);
    }
  }

  void keyCheck() {
    if (keyPressed == true) {
      if (key == ' ' && onGround == true) {
        onGround = false;
        jump(new PVector(0, -jump));
      }
    }
  }

  boolean inBlocks() {
    blockArr = currLevel.blockArr;
    for (StopBlock block : blockArr) {
      if (block.location.x < location.x && location.x < block.location.x + block.size.x && block.active) {
        //print("I AM INSIDE");
        return true;
      }
    }
    return false;
  }

  void atEnd() {
    endBlock = currLevel.endBlock;
    if (endBlock.location.x < location.x && location.x < endBlock.location.x + endBlock.size.x) {
      atEnd = true;
    }
  }

  void jump(PVector force) {
    applyForce(new PVector(force.x, force.y));
  }
}
