class StaticObject {
     PVector location, size;
     PImage texture;
     Sprite sprite;

     //Basic static objects
     StaticObject(int locX, int locY, int sizeX, int sizeY) {
         this.location = new PVector(locX, locY);
         this.size = new PVector(sizeX, sizeY);
     }

     //Textured static objects
     StaticObject (int locX, int locY, int sizeX, int sizeY, PImage texture) {
         this.location = new PVector(locX, locY);
         this.size = new PVector(sizeX, sizeY);
         this.texture = texture;
     }
     
     //Animated static objects
     StaticObject (int locX, int locY, int sizeX, int sizeY, Sprite sprite) {
         this.location = new PVector(locX, locY);
         this.size = new PVector(sizeX, sizeY);
         this.sprite = sprite;
     }

     void display() {
         if (texture != null) {
             image(texture, location.x, location.y, size.x, size.y);
         } else if (sprite != null) {
             sprite.draw(location.x, location.y);
             sprite.update();
         } else {
             fill(124, 0, 168);
             rect(location.x, location.y, size.x, size.y);
         }
     }


}
