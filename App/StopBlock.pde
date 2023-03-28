class StopBlock {
  PVector location, size;
  boolean active = true;

  StopBlock(float x, float y, float w, float h) {
    location = new PVector(x, y);
    size = new PVector(w, h);
  }
  
  StopBlock() {
    location = new PVector(880, 410);
    size = new PVector(70, 70);
  }

  void display() {
    fill(255, 100, 100);
    rect(location.x, location.y, size.x, size.y);
  }
}
