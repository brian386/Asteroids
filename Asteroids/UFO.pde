class UFO extends GameObject{
  int threshold;
  int reload = 0;
  UFO(){
    lives = 3;
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    threshold = 60;
    size = 40;
    
  }
  
  void show(){
      //UFO structure 
    stroke(0);
    fill(255);
    ellipse(location.x, location.y-size/4, size * 0.8, size);
     
    noStroke(); 
    fill(#6BBC3D); 
    ellipse(location.x, location.y, size*1.5, size*0.6); 
      
  
    noStroke(); 
    fill(255); 
    ellipse(location.x, location.y-size/4, size*0.8,size*0.25); 
    
  }
  
  void act(){
    //Shoot
    reload ++;
    if(reload >= threshold){
      gList.add(new EnemyBullet(location.x, location.y));
      reload = 0;
    }
    
    //Collision
      for (int j = 0; j<gList.size(); j++) {
      GameObject g = gList.get(j);
      if (g instanceof Bullet && dist(g.location.x, g.location.y, location.x, location.y) < size/2) {
        lives--;
        points += 10;
        g.lives = 0;
        for(int k= 0; k < 300; k++){
          gList.add( new Particle(location.x, location.y));
        }
      }
    }
  }
  
}
