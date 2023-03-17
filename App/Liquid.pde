class Liquid {
  PVector loc, size;
  float density;

  Liquid(float x, float y, float w, float h, float density_) {
    loc = new PVector(x, y);
    size = new PVector(w, h);
    density = density_;
  }

  void display() {
    noStroke();
    fill(0, 175, 255);
    rect(loc.x,loc.y,size.x,size.y);
  }

}
