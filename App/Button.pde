class Button extends StaticObject {
   PVector location, size;
   Sprite sprite;
   float minForce;
   float maxForce;
   boolean pressed = false;
   String[] buttonTypes = {"red", "blue", "green"};
   String type;

   //Basic in-game Button 
   Button(int locX, int locY, float minForce, float maxForce, String type) {
      super(locX, locY, 176, 40);
      this.location = new PVector(locX, locY);
      this.size = new PVector(176, 40);
      this.minForce = minForce;
      this.maxForce = maxForce;

      if (Arrays.asList(buttonTypes).contains(type)) {
         this.type = type;
      } else {
         ;
         this.type = "green";
      }
      sprite = new Sprite("button", loadImage("sprites/game/button/" +this.type+ "button.png"), 1, 2, 0);
   }
   
   void display() {
      sprite.display(location.x, location.y);
   }

   void collision(Movable other) {
      if (other.mass * other.g > minForce && other.mass * other.g < maxForce) {
      sprite.currentFrame = 1;
      other.location = new PVector(other.location.x, location.y - other.size.y + 8);
      other.velocity = new PVector(0, 0);
      pressed = true;
      }
   }
      
}
