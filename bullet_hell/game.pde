void game() {
  fill(dblue, 100);
  rect(width/2, height/2, width, height);
  addObjects();
  gameEngine();
  debug();
  if (player1.lives <=0 || player1.level >=30) mode=GAMEOVER;
  }


void addObjects() {
  
  objects.add(0, new Star());
  //number of enemy
  if (frameCount % 40 == 0) objects.add(new Enemy());
  if (frameCount % 60 == 0) objects.add(new Enemy2());
  if (frameCount % 80 == 0) objects.add(new Enemy3());
}

void gameEngine() {
  int i = 0;
  while (i < objects.size()) {
    GameObject s = objects.get(i);
    s.show();
    s.act();
    if (s.lives == 0) objects.remove(i);
    else i++;
  }
}

void debug() {
  fill(255);
  textSize(20);
  text("lives ="+player1.lives, 20,60);
  text("level="+player1.level, 20, 100);
}
void gameClicks() {
 mode = PAUSE; 
}
