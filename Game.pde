void game(){
    if(frameCount % 1000 == 0){
    gList.add(new Asteroid());
  }
  background(0);
  if(myShip.lives > 0){
    myShip.show();
    myShip.act();
  } else{
    //RESET
    mode = 2;
    gList = new ArrayList<GameObject>();
    myShip = new Ship();
    points = 0;
    gList.add(new Asteroid());
    gList.add(new Asteroid());
    gList.add(new Asteroid());

  }

  int i = 0;
  while( i < gList.size()) {

    GameObject g = gList.get(i);
    if (g.lives > 0) {
      g.show();
      g.act();
       i++;
    }else{
      gList.remove(i);
    }
  }
  textSize(30);
  fill(255, 255, 0);
  text(points, 10, 50);
}
