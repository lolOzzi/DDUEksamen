class Player extends Movable{
  PVector speed;
  
  
  Player(){
    speed = new PVector(0, 1);
    mass = 2f;
    location = new PVector(50, 400);
  }
  
  
  
  void moveUpdate(){
    velocity.add(speed);
    update();
  }
  
  void display(){
    rect(location.x, location.y, size.x, size.y);
  }







}
