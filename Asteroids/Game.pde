void game(){
    if(frameCount % 800 == 0){
    gList.add(new Asteroid());
  }
  
  if(frameCount % 1000 == 0){
    gList.add(new UFO());
  }
  background(0);
  if(myShip.lives > 0){
    myShip.show();
    myShip.act();
  } else{
    //RESET
    mode = 2;


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
  text("Points: " + points, 10, 50);
  text("Lives: " + myShip.lives, 680, 50);
}
