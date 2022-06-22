class Starfighter extends GameObject {

  int cooldown, threshold;

  Starfighter() {
    super(width/2, height/2, 0, 0, 40, #FF0000, 20, 1);
    threshold = 20;
    cooldown = threshold;
  }

  void act() {
    super.act();

    //managing guns
    cooldown++;

    if (space && cooldown >= threshold) {
      objects.add(new Bullet());
      cooldown = 0;
    }

    //starfighter
    if (up) vy = -5;
    if (y<=size/2)y =size/2+1;
    if (down) vy = 5;
    if (y>=height -size/2) y=height -size/2-1;
    if (left) vx = -5;
    if (x<=size/2)x =size/2+1;
    if (right) vx = 5;
    if (x>=width -size/2) x=width-size/2-1;
    if (!up && !down) vy *= 0.5;
    if (!left && !right) vx *= 0.5;
    super.act();

    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof EnemyBullet) {
        if (collidingWith(obj)) {
          lives--;
          obj.lives = 0;
        }
      }
      i++;
    }
  }
}
