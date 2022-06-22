PImage[] gif;
int currentPic = 0;

color dark = #000000;
color orange = #F23A08;
color blue = #4DFFFB;
color yellow1 = #FFCD72;
color brown = #813714;



color red = #E63946;
color dblue= #1D3557;
color lblue = #F1FAEE;
color pink = #FF8EFD;
color lightblue = #8EE0FF;
color green = #46FF47;

final int INTRO = 1;
final int GAME = 2;
final int GAMEOVER = 3;
final int PAUSE = 4;
int mode;

boolean up, down, left, right, space;

ArrayList<GameObject> objects;
Starfighter player1;

void setup() {
  size(1200, 800);
  mode = INTRO;
  rectMode(CENTER);
  imageMode(CENTER);
  textMode(CENTER);
  noStroke();
  objects = new ArrayList<GameObject>();
  player1 = new Starfighter();
  objects.add(player1);
  gif = new PImage[8];
  int i = 0;
  while (i<8) {
    gif[i]=loadImage(i+".gif");
    i++;
  }
}

void draw () {
  if (mode == INTRO) intro();
  else if (mode == GAME) game();
  else if (mode == GAMEOVER) gameover();
  else if (mode == PAUSE) pause();
}
