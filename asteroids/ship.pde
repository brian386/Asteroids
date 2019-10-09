class Ship extends GameObject{
  
  int lives;
  PVector location;
  PVector velocity;
  PVector direction;
  float s = 50;
  Ship(){
    lives = 3;
    location = new PVector(400, 300);
    velocity = new PVector(0,0);
    direction = new PVector(0, -0.1);
  }
  
  void show(){
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    image(ship, 0, 0, 2*s, s);
    
    popMatrix();
  }
  void act(){
    location.add(velocity);
    
    if(upkey) velocity.add(direction);
    if(downkey) velocity.sub(direction);
    if(leftkey) direction.rotate(radians(-2));
    if(rightkey) direction.rotate(radians(2));
    
    if(spacekey) gList.add(new Bullet());
    
    if(location.x > width) location.x = 0;
    if(location.x < 0) location.x = width;
    if(location.y > height) location.y = 0;
    if(location.y < 0) location.y = height;
  }
  
}
