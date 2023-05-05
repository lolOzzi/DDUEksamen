import java.util.Arrays;

class Door extends StaticObject {
   PVector location, size;
   Sprite mainDoorSprite;
   Sprite doorSideSprite;
   Sprite lightSprite;
   boolean pressed = false;
   StopBlock stopBlock;
   String[] doorTypes = {"red", "blue", "green"};
   String type;
   boolean open;


   //In-game door
   Door(int locX, int locY, String type) {
      super(locX, locY, 104, 176);
      this.location = new PVector(locX, locY);
      this.size = new PVector(104, 176);
      if (Arrays.asList(doorTypes).contains(type)) {
         this.type = type;
      } else {
         ;
         this.type = "green";
      }

      mainDoorSprite = new Sprite("door", loadImage("sprites/game/env/door/door.png"), 1, 7, 10, 0);
      doorSideSprite = new Sprite("door", loadImage("sprites/game/env/door/door.png"), 1, 7, 0, 0);
      doorSideSprite.currentFrame = 6;
      lightSprite = new Sprite("doorLight", loadImage("sprites/game/env/door/" + this.type + "blink.png"), 1, 2, 2, 0);
      stopBlock = new StopBlock(locX, locY, 104, 176);

   }
     
   void display() {
      mainDoorSprite.display(location.x, location.y);
      lightSprite.display(location.x, location.y);
      lightSprite.update();

      
      //stopblock
      if (!stopBlock.active && mainDoorSprite.currentFrame < 5){
        mainDoorSprite.update();
      }
      if (mainDoorSprite.currentFrame >= 5) {
        open = true;
      }
        
   }
   
   void displaySide() {
     if (open) {
       doorSideSprite.display(location.x, location.y);
     }

   }

   void collision(Movable other) {
   }
      
}
