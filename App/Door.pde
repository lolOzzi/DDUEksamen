class Door extends StaticObject {
   PVector location, size;
   Sprite mainDoorSprite;
   Sprite lightSprite;
   boolean pressed = false;
   StopBlock stopBlock;

     //In-game door
     Door(int locX, int locY) {
         super(locX, locY, 104, 176);
         this.location = new PVector(locX, locY);
         this.size = new PVector(104, 176);
         mainDoorSprite = new Sprite("door", loadImage("sprites/game/button/button.png"), 1, 7, 10, 0, false);
         lightSprite = new Sprite("doorLight", loadImage("sprites/game/button/greenblink.png"), 1, 2, 2, 0);
         stopBlock = new StopBlock(locX, locY, 104, 176);
         currLevel.blockArr.add(stopBlock);

     }
     
     void display() {
        mainDoorSprite.display(location.x, location.y);
        lightSprite.display(location.x, location.y);
        lightSprite.update();
        
        //stopblock
        if (!stopblock.active){
         mainDoorSprite.update();
        }
     }

     void collision(Movable other) {
     }
      
}
