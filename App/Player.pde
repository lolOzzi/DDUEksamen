class Player extends Movable { //<>// //<>//
  PVector speed, ogLoc;
  float jump;
  boolean hitBlock = false;
  float hitCount;
  boolean atEnd = false;
  boolean died = false;
  ArrayList<StopBlock> blockArr;
  StopBlock endBlock;
  Sprite jumpSprite, walkSprite;
  Sprite defaultDeathSprite;

  boolean dying = false;

  Player(ArrayList<Liquid> liquidList, float g, Ground ground ) {
    super(liquidList, g, ground);
    acceleration = new PVector(1.75, 0);
    speed = new PVector(3.5, 0);
    mass = 2f;
    size = new PVector(96, 136);
    location = new PVector(50, ground.location.y - size.y);
    ogLoc = new PVector(location.x, location.y);
    jump =  44.4;

    jumpSprite = new Sprite("logo", loadImage("sprites/game/player/movement/jump.png"), 1, 2, 0);
    walkSprite = new Sprite("walk", loadImage("sprites/game/player/movement/walk.png"), 1, 4, 11);
    defaultDeathSprite = new Sprite("death", loadImage("sprites/game/player/death animations/default death.png"), 1, 5, 8);
    hitCount = 0;
  }

  void moveUpdate() {
    keyCheck();
    hitBlock = inBlocks();
    atEnd();
    if (!dying) {
    if (onGround == true && hitBlock == false) {
      speed.add(acceleration);
      location.add(speed);
       
    }
    update();

    }


    if (hitBlock) {
      velocity.x = 0;
      velocity.y = 0;
      hitCount += 1;
    }
  }

  void display() {
    playerAnim();
  }

  void playerAnim() {
    if(!dying){
      if (velocity.x != 0) {
        walkSprite.display(location.x, location.y);
        walkSprite.update();
      } else {
        jumpSprite.display(location.x, location.y);
      }
      } else {
        
        defaultDeathSprite.display(location.x, location.y);
        defaultDeathSprite.update();
        if (defaultDeathSprite.currentFrame == 4) {
          delay(500);
          this.died = true; 
        }
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
  void death(String deathType) {
    if (deathType == "electrocution") {
      this.died = true;
    } else {
      this.dying = true;

    }


  }
}
