class StopBlock {
  PVector location, size;

  StopBlock(PVector location, PVector size) {
    this.location = location;
    this.size = size;
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
