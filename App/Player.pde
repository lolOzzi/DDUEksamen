class Player extends Movable {
  PVector speed;
  float jump;

  Player() {
    speed = new PVector(1, 0);
    mass = 2f;
    location = new PVector(50, 100);
    jump = 1200f;
  }

  void moveUpdate() {
    location.add(speed);
    keyCheck();
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
  
  void jump(){
    applyForce(new PVector(0, -jump));
  }
}
