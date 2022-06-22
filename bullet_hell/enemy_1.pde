class Enemy extends GameObject {

  int cooldown, threshold;
  
  Enemy() {
    super(random(width), 0, 3, 3, 40, pink, 1, 0);
    threshold = 20;
    cooldown = threshold;
  }

  void act() {
    super.act();
    
    //managing guns
    cooldown++;
    
    if (cooldown >= threshold) {
      //shoot
      objects.add(new EnemyBullet(x, y, 0, 10));
      cooldown = 0;
    }
    

    //collisions
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof Bullet) {
        if (collidingWith(obj)) {
          lives--;
          obj.lives = 0;
         objects.add(new Level_up());
         objects.add(new Explosion(x,y));
        }
      }
      i++;
    }
  }
}
