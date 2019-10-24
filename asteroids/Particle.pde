class Particle extends GameObject{
  int t = 0;
  int a = 255;
  Particle(float _x, float _y){
    lives = 1;
    location = new PVector(_x, _y);
    velocity = new PVector(random(-1, 1), random(-1, 1));
    velocity.setMag(random(5));
    size = 5;
  }
  void show(){
    fill(255, a);
    ellipse(location.x, location.y, size, size);
  }
  void act(){
    a -= 5;
    location.add(velocity);
    t++;
    if(t > 100){
      lives = 0;
    }
  }
  
}
