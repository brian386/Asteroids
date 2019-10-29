class Particle extends GameObject{
  int t = 0;
  int a = 255;
  color pFill;
  Particle(float _x, float _y){
    int c = (int)random(3);
    if(c == 0) pFill = #FF0000;
    if(c ==1) pFill = #FFFF00;
    if(c==2) pFill = #EAC321;
    lives = 1;
    location = new PVector(_x, _y);
    velocity = new PVector(random(-1, 1), random(-1, 1));
    velocity.setMag(random(4));
    size = 5;
    
  }
  void show(){
    fill(pFill, a);
    ellipse(location.x, location.y, size, size);
  }
  void act(){
    a -= 7;
    location.add(velocity);
    t++;
    if(t > 100){
      lives = 0;
    }
  }
  
}
