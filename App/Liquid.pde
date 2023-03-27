class Liquid {
  PVector loc, size;
  float density;
  color c;

  Liquid(float x, float y, float w, float h, float density_, color c_) {
    loc = new PVector(x, y);
    size = new PVector(w, h);
    density = density_;
    c = c_;
  }

  void display() {
    noStroke();
    fill(c);
    rect(loc.x,loc.y,size.x,size.y);
  }

}
