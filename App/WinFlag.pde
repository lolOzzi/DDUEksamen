class WinFlag extends StaticObject {
   PVector location, size;
   Sprite winFlagSprite;
   boolean pressed = false;
   StopBlock endBlock;


   //In-game Win flag
   WinFlag(int locX, int locY) {
      super(locX, locY, 96, 128);
      this.location = new PVector(locX, locY);
      this.size = new PVector(104, 176);
      winFlagSprite = new Sprite("flag", loadImage("sprites/game/env/flag/flag.png"), 1, 1);
      endBlock = new StopBlock(locX, locY, this.size.x, this.size.y);
   }
     
   void display() {
      winFlagSprite.display(location.x, location.y);
        
   }
      
}
