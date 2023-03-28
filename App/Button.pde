class Button extends StaticObject {
    PVector location, size;
     Sprite sprite;
    float minForce;
    float maxForce;
    boolean pressed = false;

     //Basic in-game Button 
     Button(int locX, int locY, float minForce, float maxForce) {
         super(locX, locY, 176, 40);
         this.location = new PVector(locX, locY);
         this.size = new PVector(176, 40);
         this.minForce = minForce;
         this.maxForce = maxForce;
         sprite = new Sprite("pog", loadImage("sprites/game/button/button.png"), 1, 2, 0);
     }
     
     void display() {
        sprite.display(location.x, location.y);
     }

     void collision(Movable other) {
      sprite.currentFrame = 1;
      other.location = new PVector(other.location.x, location.y - other.size.y + 8);
      other.velocity = new PVector(0, 0);
      pressed = true;
     }
      
}
