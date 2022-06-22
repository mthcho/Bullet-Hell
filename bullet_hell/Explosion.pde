class Explosion extends GameObject {
  int i;
  Explosion (float x, float y) {
    super(x, y, 0, 0, 100, 0, 1, 0);
    i=0;
  }
  void act() {
    i++;
    if (i>7) lives = 0;
  }

  void show() {
    image(gif[i], x, y, size, size);
    }
}
