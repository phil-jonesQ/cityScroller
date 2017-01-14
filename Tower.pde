class Tower {
  float x;
  float y;
  float x1;
  float y1;
  float w;
  float h;
  float xOff;
  float yOffset;
  PImage tower;

  Tower(float xOffset) {
    tower = loadImage("Tower.jpg");
    yOffset = random (-250, 350);
    // Not probably the best way to make "buildings more interesting.."
    w=5;
    if (yOffset > 15) {
      w = 15;
    }
    if (yOffset > 45) {
      w = 45;
    }
    if (yOffset > 150) {
      w = 60;
    } 
    if (yOffset > 200) {

      w = 30;
    }
    h = y+yOffset;
    y = height-yOffset;
    xOff = xOffset;
  }

  void show() {
    noStroke();
    fill(255);
    //rect(xOff, y, w, h);
    int a = Math.round(w);
    int b = Math.round(h);
    if (h < 0) {
      b =1;
    }
    tower.resize(a, b);
    image(tower, xOff, y);
  }

  void update() {
    xOff = xOff - scl;
  }

  boolean hits(Ship ship) {
    float shipX = ship.x+10;
    float shipY = ship.y+20;
    float d = dist(xOff, y, shipX, shipY);
    //println ("Tower X = " + xOff + "Tower Y = " + y + "Ship x = " + shipX + "Ship y = " + shipY);
    //println ("Distance is " +d);

    //Game mechanic.. If close to the tower we get points
    //Not if we're getting damage
    //Collision detection is hacky and hard wired but works for this game.

    if (d < 30 || ship.y > y || ship.y < 1) {
      return true;
    }
    return false;
  }
}