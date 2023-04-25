class Spike {

  PVector location, size;
  PImage sprite;
  float slope;


  Spike() {
    size = new PVector(56, 88);
    slope = size.y / (size.x / 2);
    location = new PVector(650, 720);
    sprite = loadImage("sprites/game/env/spikes/spike0.png");
  }


  void update() {
    isInside();
  }
  void display() {
    image(sprite, location.x, location.y);
  }

  void isInside() {

    float transX = (player.location.x) - (location.x + size.x/2);
    float transY = player.location.y + player.size.y;

    if (size.x/2 >= transX && transX >= -size.x/2) {
      if (location.y + size.y + (slope * abs(transX) - size.y) <= transY && transY <= location.y + size.y) {
        noLoop();
        println("INSIDE THE SPIKE");
        //player.initDeath = true;
      }
    }

    transX += player.size.x;
    if (size.x/2 >= transX && transX >= -size.x/2) {
      if (location.y + size.y + (slope * abs(transX) - size.y) <= transY && transY <= location.y + size.y) {
        noLoop();
        println("INSIDE THE SPIKE");
        //player.initDeath = true;
      }
    }
  }
}