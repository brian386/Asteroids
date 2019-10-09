class Bullet extends GameObject{
  
  
  Bullet(){
    location = new PVector(myShip.location.x, myShip.location.y);
    velocity = new PVector(myShip.direction.x, myShip.direction.y);
    velocity.setMag(5);
  }
  void show(){
    fill(255);
    ellipse(location.x, location.y, 10, 10);
  }
  
  void act(){
    location.add(velocity);
  }
  
  
}
