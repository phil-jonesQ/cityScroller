//Black and White Horizontal Scrolling

//Objects
ArrayList<Tower> towerblock = new ArrayList<Tower>();
Ship ship;

public final int scl = 60;
public final int damageThreshold=500;
float damage;
int rows;
int cols;
int start;
boolean hit = false;
PFont f;
boolean debug = false;

void setup() {
  frameRate(15);
  size(900, 450);
  start = millis();
  cols = width/scl;
  rows = height/scl;
  f = createFont("Arial", 50, true);
  populateCity(width);
  ship = new Ship();
}


void mousePressed() {
  if (debug) {
    removeTower();
    shiftLeft();
    addTower();
  } else {
    init();
    loop();
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      ship.up();
    }
    if (keyCode == DOWN) {
      ship.down();
    }
  }
}

void draw() {
  background(0);
  drawCity();
  if (!debug) {
    removeTower();
    shiftLeft();
    addTower();
  }
  drawShip();
  ship.update();
  displayDamage();
  displayTimer();
  if (damage > damageThreshold) {
    damage=damageThreshold;
    crashed();
    if (!debug) {
      noLoop();
    }
  }
}

void populateCity(float amount)
{
  for (int i=0; i < amount; i=i+scl) {
    towerblock.add(new Tower(i));
  }
}

void drawCity()
{
  for (int i=0; i < towerblock.size(); i++) {   
    towerblock.get(i).show();
    if (towerblock.get(1).hits(ship)) {
      hit=true;
      damage=damage+0.5;
    } else {
      hit=false;
    }
  }
}


void removeTower()
{
  towerblock.remove(0);
}

void shiftLeft() {
  for (int i=0; i < towerblock.size(); i++) {   
    towerblock.get(i).update();
  }
}

void addTower() {
  towerblock.add(new Tower(width-scl));
}

void drawShip() {
  if (hit) {
    ship.show(true);
  } else {
    ship.show(false);
  }
}


void displayDamage() {
  textFont(f, 12);                  
  fill(255, 0, 0);
  textAlign(CENTER);
  text("DAMAGE:" + floor(damage), width-100, 40);
  stroke(255);
}

void displayTimer() {

  int timer = millis()-start;
  text("TIME:" + timer, width-200, 40);
}


void crashed() {
  textFont(f, 12);                  
  fill(255, 0, 0);
  textAlign(CENTER);
  text("GAME OVER!!", width/2, height/2);
  stroke(255);
}

void init() {

  damage=0;
  start=0;
  start = millis();
  populateCity(width);
  ship = new Ship();
}