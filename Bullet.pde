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

    float a = dist(myShip.location.x, myShip.location.y, _x, _y);
    lives = 1;
    location = new PVector(_x, _y);
    velocity = new PVector(myShip.location.x - _x, myShip.location.y - _y);;
    float s = atan((myShip.location.x - _x)/myShip.location.y - _y) + atan(myShip.velocity.y/myShip.velocity.x);

    
     //float c= myShip.velocity.mag() * time;
    //float b = 5 * time;
    
    float angle = acos((pow(c, 2) - pow(b, 2) - pow ( a, 2))/(-2*a*b));
    println(angle);
    velocity.rotate(angle);
    velocity.setMag(5);

  }
  void show(){
    fill(255, 255, 0);
    ellipse(location.x, location.y, 10, 10);
    
  }
  
  void act(){
    location.add(velocity);

    
    if(location.x > width || location.y < 0 || location.x < 0 || location.y > height){
      lives = 0;
    }
  }
  
  
}
