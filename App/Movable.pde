class Movable {
  PVector location, velocity, acceleration, size, start;
  float mass;

  float cw;

  float areaX;
  float areaY;

  float volume;
  int count;
  boolean onGround;
  Liquid liquid;
  Liquid air;

  ArrayList<Liquid> liquidList;
  float g;

  Ground ground;

  Movable( ArrayList<Liquid> liquidList, float g, Ground ground)
  {
    size = new PVector(48, 60);
    location = new PVector(random(0, width-size.x), random(100, 200));
    //location = new PVector(50, liquidList.get(0).loc.y - size.y / 2);
    //location = new PVector(locX, locY);
    start = location.get();
    velocity = new PVector(5, 0);
    acceleration = new PVector(0, 0);
    mass = 250;
    cw = 1.4f;
    areaX = size.x*size.x / pow(80, 2);
    areaY = size.y*size.x / pow(80, 2);
    volume =  size.x * size.x *size.y / pow(80, 3);
    this.liquidList = liquidList;
    this.g = g;
    this.ground = ground;

  }
  Movable(float locX, float locY, ArrayList<Liquid> liquidList, float g, Ground ground)
  {
    size = new PVector(48, 60);
    //location = new PVector(random(0, width-size.x), random(100, 200));
    //location = new PVector(50, liquidList.get(0).loc.y - size.y / 2);
    location = new PVector(locX, locY);
    start = location.get();
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = 250;
    cw = 1.4f;
    areaX = size.x*size.x / pow(80, 2);
    areaY = size.y*size.x / pow(80, 2);
    volume =  size.x * size.x *size.y / pow(80, 3);
    //println(currLevel);
    this.liquidList = liquidList;
    this.g = g;
    this.ground = ground;

  }
  void update ()
  {

    /*
    liquidList = currLevel.liquidList;
    g = currLevel.g;
    ground = currLevel.ground;
    */

    onGround = isOnGround(ground);
    applyForce(gravity());
    /*if (isInside(liquid)) {
     drag(liquid);
     buoyancy(liquid);
     } else if (isInside(air)) {
     drag(air);
     buoyancy(air);
     }*/

    for (int i = 0; i < currLevel.liquidList.size(); i++) {
      buoyancy(currLevel.liquidList.get(i));
      if (isInside(liquidList.get(i))) {
        //println("liquid" + i + " " + liquidList.get(i).density);
        drag(liquidList.get(i));
      }
    }

    //velocity.add(acceleration);

    //println("Accel 1: x: " + acceleration.x + " y: " + acceleration.y);
    if (onGround) {
      PVector temp_accel = acceleration.get();
      friction(ground.cf);
      //print("den er på jorden!?!?!?");

      velocity.add(acceleration.sub(temp_accel));
    }

    if (onGround) {
      location.y = height - ground.size.y - size.y;
      if (velocity.y > 0)
      {
        velocity.y = 0;
      }
    }
    for (StaticObject obj : staticObjectList) {
      Collision(obj);
    }
     
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);


    //println("Speed: x: " + velocity.x*frameRate / 80 + " y: " + velocity.y*frameRate / 80);
    count++;


  }

  void display (int i)
  {
    fill(254, 111, 255);
    rect(location.x, location.y, size.x, size.y);
    fill(49, 51, 56);
    rect(location.x +5, location.y +5, size.x-10, size.y-10);
    fill(255);
    text(i, location.x + size.x/2, location.y + size.y/2);
  }
  void display()
  {
    fill(254, 111, 255);
    rect(location.x, location.y, size.x, size.y);
    fill(49, 51, 56);
    rect(location.x +5, location.y +5, size.x-10, size.y-10);
  }

  PVector gravity() {
    PVector grav = new PVector(0, currLevel.g * this.mass); //N
    //println("Gravity: x: " + grav.x + " y: " + grav.y);
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
    speed = (speed * frameRate) / 80; // m / 
    float velx = velocity.x * frameRate / 80;
    float vely = velocity.y * frameRate / 80;

    float dragMagX= 0.5 * cw * areaY * l.density * velx * velx;
    float dragMagY = 0.5 * cw * areaX * l.density * vely * vely;

    float dragMagnitude = sqrt(dragMagX*dragMagX + dragMagY*dragMagY); 

    PVector drag = velocity.get();

    // Get drag direction
    drag.mult(-1);
    drag.normalize();

    // Extend the force by the drag magnitude.
    drag.mult(dragMagnitude);

    // Apply the force.
    applyForce(drag);

    //println("Drag: x: " + drag.x + " y: " + drag.y);
  }

  void buoyancy(Liquid l) {
    float vol = volume * (location.y + size.y - l.loc.y) / size.y;
    if (vol > volume) {
      vol = volume;
    } else if (vol < 0) {
      vol = 0;
    }
    PVector upthrust = new PVector(0, -1*l.density * vol*g);
    
    applyForce(upthrust);
    //println("Buoyancy: " + upthrust.mag());
  }

  void friction(float cf) {
    if (velocity.x != 0) {
      PVector vel = velocity.get();
      PVector temp = vel.div(vel.mag());
      PVector friction = temp.mult(-(acceleration.y / 80 * frameRate*frameRate) * mass*cf);
      //println("Friction: x: " + friction.x + " y: " + friction.y);
      //println("Accel: x: " + acceleration.x + " y: " + acceleration.y);
      applyForce(friction);
    }
  }

boolean isInside(Liquid l) {
    if (location.x>l.loc.x && location.x<l.loc.x+l.size.x && location.y + size.y / 2>l.loc.y && location.y + size.y / 2<l.loc.y+l.size.y)
    {
      return true;
    } else {
      return false;
    }
  }
  
boolean isOnGround(Ground ground) {
  if (location.y + size.y >= height - ground.size.y) {
    return true;
  } else
    return false;
}

  boolean isColliding(StaticObject other) {
    return location.x < other.location.x + other.size.x &&
           location.x + size.x > other.location.x &&
           location.y < other.location.y + other.size.y &&
           location.y + size.y > other.location.y;
  }

  void Collision(StaticObject other) {
    if (isColliding(other)) {

      fill(0);
      text(detectCollisionSide(this, other), 1000, 100);
      String side = detectCollisionSide(this, other);
      if (side == "bottom") {
        location.y = other.location.y - size.y;
        //velocity.y = velocity.y * -1 *0.5f;
        if (velocity.y > 0) {
          velocity.y = 0;
        }
        if (other instanceof Button) {
          other.collision(this);
        }
        //velocity.y = 0;
      } else if (side == "top") {
        location.y = other.location.y + other.size.y;
        //velocity.y = velocity.y * -1 *0.5f;
        velocity.y = 0;
      } else if (side == "left") {
        location.x = other.location.x + other.size.x;
        velocity.x = velocity.x * -1 *0.5f;
      } else if (side == "right") {
        location.x = other.location.x - size.x;
        velocity.x = velocity.x * -1 *0.5f;
      }
    }
  }
// Check collision between two rectangles
// and return the side of collision
  String detectCollisionSide(Movable movingRect, StaticObject stationaryRect) {
    // Check if there is no collision
    
    // Get the centers of both rectangles
    float movingRectCenterX = movingRect.location.x + movingRect.size.x / 2;
    float movingRectCenterY = movingRect.location.y + movingRect.size.y / 2;
    float stationaryRectCenterX = stationaryRect.location.x + stationaryRect.size.x / 2;
    float stationaryRectCenterY = stationaryRect.location.y + stationaryRect.size.y / 2;

    // Calculate the distance between the centers of the rectangles
    float dx = movingRectCenterX - stationaryRectCenterX;
    float dy = movingRectCenterY - stationaryRectCenterY;
    
    // Calculate the half widths and half heights of both rectangles
    float movingRectHalfWidth = movingRect.size.x / 2;
    float movingRectHalfHeight = movingRect.size.y / 2;
    float stationaryRectHalfWidth = stationaryRect.size.x / 2;
    float stationaryRectHalfHeight = stationaryRect.size.y / 2;
    
    // Calculate the minimum and maximum distances between the centers
    // that can occur during a collision
    float minDistX = movingRectHalfWidth + stationaryRectHalfWidth;
    float minDistY = movingRectHalfHeight + stationaryRectHalfHeight;
    float maxDistX = minDistX * 1.2; // 20% tolerance added to handle near-miss cases
    float maxDistY = minDistY * 1.2;
    
    // Determine the side of collision
    if (abs(dx) < minDistX && abs(dy) < minDistY) {
      float offsetX = minDistX - abs(dx);
      float offsetY = minDistY - abs(dy);
      if (offsetX < offsetY) {
        if (dx > 0) {
          return "left";
        } else {
          return "right";
        }
      } else {
        if (dy > 0) {
          return "top";
        } else {
          return "bottom";
        }
      }
    } else {
      // No collision detected
      return "none";
    }
  }

  void setMass(float m) {
    this.mass = m;
  }
}
