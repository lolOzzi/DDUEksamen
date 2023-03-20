public class Movable {
  PVector location, velocity, acceleration, size;
  float mass;
  float cw;
  float area;
  float volume;
  int count;
  
  Movable()
  {
    size = new PVector(48, 60);
    location = new PVector(random(0, width-size.x), random(0, 100));
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = random(200, 350);
    cw = 1.4f;
    area = size.x*size.x / pow(80, 2);
    volume =  size.x * size.x *size.y / pow(80, 3);
  }

  void update ()
  {
    applyForce(gravity());
    /*
    if (count == 60) {
      println("Accel: " + round(acceleration.y*frameRate*frameRate));
      println("Speed 1: " + round(velocity.y*frameRate));
      println("framerate: " + frameRate);
    }*/
    if (isInside(liquid)) {
      drag(liquid);
      buoyancy(liquid);
    }
    else if (isInside(air)) {
      drag(air);
      buoyancy(air);
    }
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    /*
    if (count == 120) {
      println("Speed: " + round(velocity.y*frameRate));
      count = 0;
    }*/
    println("Speed: " + velocity.y*frameRate / 80);
    count++;
  }

  void display ()
  {
    fill(254, 111, 255);
    rect(location.x, location.y, size.x, size.y);
    fill(49, 51, 56);
    rect(location.x +5, location.y +5, size.x-10, size.y-10);
  }
  
  PVector gravity(){
    return new PVector(0, g * this.mass);
  }

  void applyForce(PVector force)
  {
    PVector force_ = force.get();
    
    force_.div(this.mass).mult(80).div(frameRate*frameRate);
    acceleration.add(force_);
  }


  void checkEdges() {

    //[full] When it reaches one edge, set location to the other.
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
      velocity.mult(0);
    } else if (location.y < 0) {
      location.y = height;
       
    }
    //[end]
  }

  void drag(Liquid l) {
    float speed = velocity.mag(); // px / frame 
    speed = (speed * frameRate) / 80; // m / s
    float dragMagnitude = 0.5 * cw * area * l.density * speed * speed;
    PVector drag = new PVector(0, -1*dragMagnitude);
    applyForce(drag);
    /*
    PVector drag = velocity.get();
    drag.mult(-1);
    // The force's direction: -1 * velocity
    drag.normalize();

    // Finalize the force: magnitude and direction together.
    drag.mult(dragMagnitude);

    // Apply the force.
    applyForce(drag);
    */
    if (true) {
      println("drag: " + drag.y);
    }
  }
  
  void buoyancy(Liquid l) {
    PVector boing = new PVector(0, -1*l.density * volume*g);
    applyForce(boing);
        if (count % 5 == 0) {
      println("Buoyancy: " + boing.mag());
    }
  }

  boolean isInside(Liquid l) {
    if (location.x>l.loc.x && location.x<l.loc.x+l.size.x && location.y>l.loc.y && location.y<l.loc.y+l.size.y)
    {
      return true;
    } else {
      return false;
    }
  }
}
