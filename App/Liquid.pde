class Liquid {
  PVector loc, size;
  float c;

  Liquid(float x, float y, float w, float h, float c_) {
    loc = new PVector(x, y);
    size = new PVector(w, h);
    c = c_;
  }

  void display() {
    noStroke();
    fill(175);
    rect(loc.x,loc.y,size.x,size.y);
  }

}
