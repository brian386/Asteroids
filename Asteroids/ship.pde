class Ship extends GameObject{
  
  int lives;
  PVector location;
  PVector velocity;
  PVector direction;
  int shotTimer;
  int threshold;
  int invincible;
  Ship(){
    lives = 5;
    location = new PVector(400, 300);
    velocity = new PVector(0,0);
    direction = new PVector(0, -0.1);
    threshold = 12;
    size = 40;
  }
  
  void show(){
    if(invincible >= 0){
      stroke(255);
      noFill();
      ellipse(location.x, location.y, 2*size, 2*size);
      noStroke();
    }
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    image(ship, 0, 0, 2*size, size);
    
    popMatrix();
  }
  void act(){
    invincible--;
    location.add(velocity);
    
    if(upkey) velocity.add(direction);
    if(downkey) velocity.sub(direction);
    if(leftkey) direction.rotate(radians(-3));
    if(rightkey) direction.rotate(radians(3));
    shotTimer ++;
    if(spacekey && shotTimer > threshold) {
      gList.add(new Bullet());  
       shotTimer = 0;
    }
    
    if(location.x > width +size) location.x = 0-size;
    if(location.x < 0-size) location.x = width+size;
    if(location.y > height+size) location.y = 0-size;
    if(location.y < 0-size) location.y = height+size;
  }
  
}
