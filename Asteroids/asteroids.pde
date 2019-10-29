PImage ship;
boolean upkey, downkey, leftkey, rightkey, spacekey;
ArrayList<GameObject> gList;
int reload = 0;
Ship myShip = new Ship();
int points = 0;

int mode = 0;
void setup() {
  noStroke();
  size(800, 600);
  ship = loadImage("ship.png");
  imageMode(CENTER);
  gList = new ArrayList<GameObject>();
  
  //gList.add(new Asteroid());
  //gList.add(new Asteroid());
  //gList.add(new Asteroid());
  gList.add(new UFO());

} 

void draw() {
  if(mode == 0)
    intro();
  else if(mode == 1)
    game();
  else if(mode == 2)
   gameover();
}

void keyPressed() {
  if (keyCode == UP) upkey = true;
  if (keyCode == DOWN) downkey = true;
  if (keyCode == LEFT) leftkey = true;
  if (keyCode == RIGHT) rightkey = true;
  if (key == ' ') spacekey = true;
}

void keyReleased() {
  if (keyCode == UP) upkey = false;
  if (keyCode == DOWN) downkey = false;
  if (keyCode == LEFT) leftkey = false;
  if (keyCode == RIGHT) rightkey = false;
  if (key == ' ') spacekey = false;
}

void mouseReleased(){
  if(mode == 0){
    mode = 1;
  }  else if(mode == 1){
    
  } else if(mode == 2){
    mode = 0;
  }
}
