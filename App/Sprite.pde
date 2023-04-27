class Sprite {
  String name;      
  PImage[] frames; 
  float spriteRate;    // The frame rate of the animation
  int currentFrame;
  int frameCount;
  int frameWidth, frameHeight;
  int cooldown;
  int waitTimer = 0;

  
  
  Sprite(String name, PImage spriteSheet, int rows, int cols) {
    this(name, spriteSheet, rows, cols, 0, 0);
  }

  Sprite(String name, PImage spriteSheet, int rows, int cols, float spriteRate) {
    this(name, spriteSheet, rows, cols, spriteRate, 0);

  }


  Sprite(String name, PImage spriteSheet, int rows, int cols, float spriteRate, int cooldown) {
    this.name = name;
    this.spriteRate = spriteRate;
    this.currentFrame = 0;
    this.frameCount = 0;
    this.cooldown = cooldown;
    
    //Calculate size of frame from cols and rows
    this.frameWidth = (int) (spriteSheet.width / cols);
    this.frameHeight = (int) (spriteSheet.height / rows);
    
    // Frame array from splitting spritesheet
    this.frames = new PImage[rows * cols];
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        int x = c * this.frameWidth;
        int y = r * this.frameHeight;
        PImage frame = spriteSheet.get(x, y, frameWidth, frameHeight);
        this.frames[r * cols + c] = frame;
      }
    }


  }
  
  // Update the current frame of the animation based on the frame rate
  
  void update() {
    if (waitTimer < cooldown && (currentFrame+1) % frames.length == 1) {
      waitTimer++;
    } else {
      if (waitTimer >= cooldown && cooldown != 0) {
        currentFrame = (currentFrame + 1) % frames.length;
        waitTimer = 0;

      }

      if (frameCount >= ((float) frameRate / (float) spriteRate)) {
        currentFrame = (currentFrame + 1) % frames.length;
        frameCount = 0;
      }
      frameCount++;
    }

  }
  
  // Draw the current frame of the animation
  void display(float x, float y) {
    PImage frame = frames[currentFrame];
    image(frame, x, y);
  }
}
