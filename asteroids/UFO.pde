class UFO extends GameObject{
  int threshold = 30;
  int reload = 0;
  UFO(){
    lives = 3;
    location = new PVector(400, 300);
    velocity = new PVector(0,0);
    threshold = 10;
    size = 40;
    
  }
  
  void show(){
    fill(255, 0, 0);
    ellipse(location.x, location.y, size, size);
    
  }
  
  void act(){
    reload ++;
    if(reload >= threshold){
      gList.add(new EnemyBullet(location.x, location.y));
      reload = 0;
    }
  }
  
}
