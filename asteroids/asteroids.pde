PImage ship;
boolean upkey, downkey, leftkey, rightkey, spacekey;
ArrayList<GameObject> gList;

Ship myShip = new Ship();
void setup(){
  size(800, 600);
  ship = loadImage("ship.png");
  imageMode(CENTER);
  gList = new ArrayList<GameObject>();
  
} 

void draw(){
  background(0);
  myShip.show();
  myShip.act();
  for(int i = 0; i < gList.size(); i++){
    GameObject g = gList.get(i);
    g.show();
    g.act();
  }
  
  
}

void keyPressed(){
  if(keyCode == UP) upkey = true;
  if(keyCode == DOWN) downkey = true;
  if(keyCode == LEFT) leftkey = true;
  if(keyCode == RIGHT) rightkey = true;
  if(key == ' ') spacekey = true;
  
}

void keyReleased(){
  if(keyCode == UP) upkey = false;
  if(keyCode == DOWN) downkey = false;
  if(keyCode == LEFT) leftkey = false;
  if(keyCode == RIGHT) rightkey = false;
  if(key == ' ') spacekey = false;
}
