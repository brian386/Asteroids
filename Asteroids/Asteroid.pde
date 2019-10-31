class Asteroid extends GameObject {


  float speed;

  Asteroid() {
    
    size = random(120, 14);
    speed = 5/map(size, 0, 130, 0, 5);
    lives = 1;
    do{
    location = new PVector(random(width), random(height));
    velocity = new PVector(random(-5, 5), random(-5, 5));
    } while(dist(location.x, location.y, myShip.location.x, myShip.location.y) < myShip.size/2 + size/2 + 100);
    velocity.setMag(speed);
  }

  Asteroid(float _x, float _y, float _s) {
    size = _s/2;
    speed = 3.4/map(size, 0, 130, 0, 5);
    lives = 1;
    location = new PVector(_x, _y);

    velocity = new PVector(random(-5, 5), random(-5, 5));
    velocity.setMag(speed);
  }

  void show() {
    fill(#A58735);
    ellipse(location.x, location.y, size, size);
  }

  void act() {
    location.add(velocity);
    // off edge
    if (location.x > width+size/2) location.x = 0-size/2;
    if (location.x < 0-size/2) location.x = width+size/size;
    if (location.y > height+size/2) location.y = 0-size/2;
    if (location.y < 0-size/2) location.y = height+size/2;

    //check collision with bullet
    for (int j = 0; j<gList.size(); j++) {
      GameObject g = gList.get(j);
      if (g instanceof Bullet && dist(g.location.x, g.location.y, location.x, location.y) < size/2) {
        lives--;
        points ++;
        g.lives = 0;
        for(int k= 0; k < 300; k++){
          gList.add( new Particle(location.x, location.y));
        }
        if (size > 35) {
          gList.add(new Asteroid(location.x, location.y, size));
          gList.add(new Asteroid(location.x, location.y, size));
        }
      }
    }
    
    if(dist(location.x, location.y, myShip.location.x, myShip.location.y) < myShip.size/2 + size/2 && myShip.invincible < 0){
      myShip.lives--;
      myShip.location.x = width/2;
      myShip.location.y = height/2;
      myShip.invincible = 180;
    }
  }
}
