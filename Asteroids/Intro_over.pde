void intro(){
  background(0);

    gList = new ArrayList<GameObject>();
    myShip = new Ship();
    points = 0;
    gList.add(new Asteroid());
    
    //TEXT
    fill(255, 255, 0);
    textSize(50);
    text("Asteroids", 300, 300);
    
}

void gameover(){
    background(255, 0, 0);
   textSize(30);
    text("YOU LOSE", 300, 300);
    text("Your score is: " + points, 300, 200);
}
