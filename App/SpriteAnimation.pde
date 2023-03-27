// A SpriteAnimation class, for handling sprite animations
class SpriteAnimation {
  HashMap<String, Sprite> sprites; // A hashmap of sprite animations by name
  Sprite currentSprite;            // The current sprite animation
  
  SpriteAnimation() {
    sprites = new HashMap<String, Sprite>();
  }
  
  // Add a new sprite animation to the collection
  void addSprite(String name, PImage spriteSheet, int rows, int cols, float spriteRate) {
    Sprite sprite = new Sprite(name, spriteSheet, rows, cols, spriteRate);
    sprites.put(name, sprite);
  }
  
  // Set the current sprite animation by name
  void setSprite(String name) {
    currentSprite = sprites.get(name);
  }
  
  // Update the current sprite animation
  void update() {
    currentSprite.update();
  }
  
  // Draw the current sprite animation
  void draw(float x, float y) {
    currentSprite.draw(x, y);
  }
}
