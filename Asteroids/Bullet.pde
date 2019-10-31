class Bullet extends GameObject{
  
  
  Bullet(){
    lives = 1;
    location = new PVector(myShip.location.x, myShip.location.y);
    velocity = new PVector(myShip.direction.x, myShip.direction.y);
    velocity.setMag(7);
  }
  void show(){
    fill(255, 0, 0);
    ellipse(location.x, location.y, 10, 10);
  }
  
  void act(){
    location.add(velocity);
    if(location.x > width || location.y < 0 || location.x < 0 || location.y > height){
      lives = 0;
    }
  }
  
  
}

class EnemyBullet extends GameObject{
  
  
  EnemyBullet(float _x, float _y){

    float d = dist(myShip.location.x, myShip.location.y, _x, _y);
    lives = 1;
    location = new PVector(_x, _y);
    velocity = new PVector(myShip.location.x - _x, myShip.location.y - _y);
    
    //FIX THE ANGLE CALC
    //float s = myShip.location.x >= _x? atan((myShip.location.y - _y)/(myShip.location.x - _x)) + atan(myShip.velocity.y/myShip.velocity.x): 180 -atan((myShip.location.y - _y)/(myShip.location.x - _x)) + atan(myShip.velocity.y/myShip.velocity.x);
   // float angleRSB =  atan((myShip.location.y - _y)/(myShip.location.x - _x)) + atan(myShip.velocity.y/myShip.velocity.x);
    float angleRSB = acos(myShip.velocity.dot((velocity.mult(-1)))/velocity.mag() / myShip.velocity.mag());
    float bSpeed = 5;

    
    float a = pow(bSpeed, 2) - pow(myShip.velocity.mag(), 2);
    float b = 2*myShip.velocity.mag()*d*cos(angleRSB);
    float c = -pow(d, 2);
    
    float time = (-b + sqrt( b*b - 4*a*c)) / (2*a);   
    PVector newPos = new PVector(myShip.location.x + myShip.velocity.x * time, myShip.location.y + myShip.velocity.y*time);
    velocity = new PVector(newPos.x - _x, newPos.y- _y);

    velocity.setMag(bSpeed);
    println( myShip.location.x, myShip.location.y, newPos.x, newPos.y);
    //velocity.add(myShip.velocity);
    

  }
  void show(){
    fill(255, 255, 0);
    ellipse(location.x, location.y, 10, 10);
    
  }
  
  void act(){
    location.add(velocity);

    if(dist(location.x, location.y, myShip.location.x, myShip.location.y) < myShip.size/2 + size/2 && myShip.invincible < 0){
      myShip.lives--;
      myShip.location.x = width/2;
      myShip.location.y = height/2;
      myShip.invincible = 180;
    }
    if(location.x > width || location.y < 0 || location.x < 0 || location.y > height){
      lives = 0;
    }
  }
  
  
}
