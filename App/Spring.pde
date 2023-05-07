class Spring {

  PVector location, size, force;
  Sprite sAnim;
  float fLength;
  float angle;
  PImage springSpriteSheet;
  boolean activated;


  Spring() {
    this(new PVector(230, 770), "default");
  }

  Spring(PVector location) {
    this(location, "default");
  }
  
  Spring(PVector location, String type) {
    this.location = location;
    size = new PVector(88, 120);
    if (type == "default") {
      springSpriteSheet = loadImage("sprites/game/env/springs/spring/spring.png");
      angle = 0;
    } else if (type == "right") {
      springSpriteSheet = loadImage("sprites/game/env/springs/springdiagonal/springdiagonal.png");
      angle = 45;
    } else if (type == "left") {
      springSpriteSheet = loadImage("sprites/game/env/springs/springdiagonal/springdiagonalleft.png");
      angle = 135;
    }

    sAnim = new Sprite("spring", springSpriteSheet, 1, 3, 9);
    force = new PVector(20, -40);
    fLength = 1;

  }

  void display() {
    sAnim.display(location.x, location.y);
    if (activated && sAnim.currentFrame != 2) {
      sAnim.update();
    }
  }
  
  void update(){
    force = new PVector(fLength * cos(radians(angle)), -fLength * sin(radians(angle)));
    overSpring();
  }
  

  void overSpring() {
    if (location.x < player.location.x && player.location.x < location.x + size.x) {
      if (location.y + size.y >= player.location.y + player.size.y && location.y <= player.location.y + player.size.y) {
        activated = true;
        player.jump(force);
      }
    }
  }
}
