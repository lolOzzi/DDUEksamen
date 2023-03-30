class Spring {

  PVector location, size, force;
  Sprite sAnim;


  Spring() {
    location = new PVector(230, 770);
    size = new PVector(88, 120);
    PImage walkSpriteSheet = loadImage("sprites/game/spring/spring.png");
    sAnim = new Sprite("walk", walkSpriteSheet, 1, 3, 1);
    force = new PVector(20, -40);
  }

  void display() {
    sAnim.display(location.x, location.y);
    sAnim.currentFrame = 1;
  }
  
  void update(){
    overSpring();
  }
  

  void overSpring() {
    if (location.x < player.location.x && player.location.x < location.x + size.x) {
      println();
      if (location.y + size.y >= player.location.y + player.size.y && location.y <= player.location.y + player.size.y) {
        println("INSIDE JUMP");
        player.jump(force);
      }
    }
  }
}
