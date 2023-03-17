public class Movable {
  PVector location, velocity, acceleration, size;
  float speed;
  float mass;
  float cw;
  float area;
  
  Movable()
  {
    location = new PVector(random(0, 960), random(0, 580));
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    size = new PVector(48, 60);
    speed = 1f;
    mass = 1f;
    cw = 1.1f;
    area = 1 / size.y*size.y;
  }

  void update ()
  {
    applyForce(gravity());
    if (isInside(liquid)) {
      drag(liquid);
    }
    else if (isInside(air)) {
      drag(air);
    }
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    print(velocity);
  }

  void display ()
  {
    rect(location.x, location.y, size.x, size.y);
  }
  
  PVector gravity(){
    return new PVector(0, g * this.mass);
  }

  void applyForce(PVector force)
  {
    acceleration.add(force);
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
    } else if (location.y < 0) {
      location.y = height;
    }
    //[end]
  }

  void drag(Liquid l) {
    float speed = velocity.mag();
    
    float dragMagnitude = 0.5 * cw * area * l.density * speed * speed;

    PVector drag = velocity.get();
    drag.mult(-1);
    // The force's direction: -1 * velocity
    drag.normalize();

    // Finalize the force: magnitude and direction together.
    drag.mult(dragMagnitude);

    // Apply the force.
    applyForce(drag);
    
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
