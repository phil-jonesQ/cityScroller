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
    yOffset = random (-250, 250);
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
    tower.resize(a,b);
    image(tower, xOff, y);
  }

  void update() {
    xOff = xOff - scl;
  }

  boolean hits(Ship ship) {

    float d = dist(xOff-scl,y,ship.x-scl,ship.y);
    //println ("Tower X = " + xOff + "Tower Y = " + y + "Ship x = " + ship.x + "Ship y = " + ship.y);
    println ("Distance is " +d + "Tower Y = " + y + "Ship y = " + ship.y);
    if ( d < 80 && ship.y > y ) {
      score = score+1;
    }
    if (d < 60 && ship.y > y ) {
      return true;
    }
    return false; 
  }
}

  //if (ship.x > x && ship.x < x + w) {
    //  if ((ship.y < yOffset+25) || (ship.y > (height-25))) {
    //    return true;
    //  }
    //}
    //return false;