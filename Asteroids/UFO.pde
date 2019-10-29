class UFO extends GameObject{
  int threshold;
  int reload = 0;
  UFO(){
    lives = 3;
    location = new PVector(100,100);
    velocity = new PVector(0,0);
    threshold = 20;
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
