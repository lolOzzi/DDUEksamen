public class Movable {
  PVector location, velocity, acceleration, size;
  float mass;
  float cw;
  float area;
  float volume;
  int count;
  boolean onGround;

  Movable()
  {
    size = new PVector(48, 60);
    location = new PVector(random(0, width-size.x), random(100, 200));
    velocity = new PVector(5, 0);
    acceleration = new PVector(0, 0);
    mass = 300;
    cw = 1.4f;
    area = size.x*size.x / pow(80, 2);
    volume =  size.x * size.x *size.y / pow(80, 3);
  }

  void update ()
  {
    onGround = isOnGround(ground);
    applyForce(gravity());
    println("Accel grav: x: " + acceleration.x + " y: " + acceleration.y);
    if (isInside(liquid)) {
      drag(liquid);
      //buoyancy(liquid);
    } else if (isInside(air)) {
      drag(air);
      //buoyancy(air);
    }
    if (onGround) {
      friction(ground.cf);
    }
    velocity.add(acceleration);
    if (onGround) {
      location.y = height - ground.gHeight - size.y;
      if (velocity.y > 0)
      {
        velocity.y = 0;
      }
    }


    location.add(velocity);
    acceleration.mult(0);

    println("Speed: x: " + velocity.x*frameRate / 80 + " y: " + velocity.y*frameRate / 80);
    count++;
  }

  void display ()
  {
    fill(254, 111, 255);
    rect(location.x, location.y, size.x, size.y);
    fill(49, 51, 56);
    rect(location.x +5, location.y +5, size.x-10, size.y-10);
  }

  PVector gravity() {
    PVector grav = new PVector(0, g * this.mass); //N
      println("Gravity: x: " + grav.x + " y: " + grav.y);
    return grav;
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

    PVector drag = velocity.get();
    drag.mult(-1);
    // The force's direction: -1 * velocity
    drag.normalize();

    // Finalize the force: magnitude and direction together.
    drag.mult(dragMagnitude);

    // Apply the force.
    applyForce(drag);
    if (true) {
    }
  }

  void buoyancy(Liquid l) {
    PVector uplift = new PVector(0, -1*l.density * volume*g);
    applyForce(uplift);
    if (count % 5 == 0) {
      //println("Buoyancy: " + uplift.mag());
    }
  }

  void friction(float cf) {
    if (velocity.x != 0) {
      PVector vel = velocity.get();
      PVector temp = vel.div(vel.mag());
      PVector friction = temp.mult(-(acceleration.y / 80 * frameRate*frameRate) * mass*cf);
      println("Friction: x: " + friction.x + " y: " + friction.y);
      println("Accel: x: " + acceleration.x + " y: " + acceleration.y);
      applyForce(friction);
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
  boolean isOnGround(Ground ground) {
    if (location.y + size.y >= height - ground.gHeight) {
      return true;
    } else
      return false;
  }
}
