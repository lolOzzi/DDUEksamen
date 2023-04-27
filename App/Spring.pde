class Spring {

  PVector location, size, force;
  Sprite sAnim;
  float fLength;
  float angle;


  Spring() {
    location = new PVector(230, 770);
    size = new PVector(88, 120);
    PImage walkSpriteSheet = loadImage("sprites/game/spring/spring.png");
    sAnim = new Sprite("walk", walkSpriteSheet, 1, 3, 1);
    force = new PVector(20, -40);
    fLength = 1;
    angle = 45;
  }
    Spring(PVector location) {
    this.location = location;
    size = new PVector(88, 120);
    PImage walkSpriteSheet = loadImage("sprites/game/spring/spring.png");
    sAnim = new Sprite("walk", walkSpriteSheet, 1, 3, 1);
    force = new PVector(20, -40);
    fLength = 1;
    angle = 45;
  }

  void display() {
    sAnim.display(location.x, location.y);
    sAnim.currentFrame = 1;
  }
  
  void update(){
    force = new PVector(fLength * cos(radians(angle)), -fLength * sin(radians(angle)));
    overSpring();
  }
  

  void overSpring() {
    if (location.x < player.location.x && player.location.x < location.x + size.x) {
      if (location.y + size.y >= player.location.y + player.size.y && location.y <= player.location.y + player.size.y) {
        player.jump(force);
      }
    }
  }
}
