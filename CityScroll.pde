//Black and White Horizontal Scrolling

//Objects
ArrayList<Tower> towerblock = new ArrayList<Tower>();
Ship ship;

public final int scl = 60;
public int score;
public float damage;
int rows;
int cols;
boolean hit = false;
PFont f;

void setup() {
  frameRate(15);
  size(1200, 400);
  cols = width/scl;
  rows = height/scl;
  f = createFont("Arial", 50, true);
  populateCity(width);
  ship = new Ship();
}


void mousePressed() {
  removeTower();
  shiftLeft();
  addTower();
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
  //removeTower();
  //shiftLeft();
  //addTower();
  drawShip();
  ship.update();
  displayScore();
  displayDamage();
  if (damage > 1000) {
   
     score = 0;
     damage = 0;
    
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
      //print ("hitDetected");
      damage=damage+0.1;
    } else {
      hit=false;
      //print ("NoHit!!");
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
  }else{
    ship.show(false);
}
}

void displayScore(){
  textFont(f, 12);                  
  fill(255,0,0);
  textAlign(CENTER);
  text("SCORE:" + score, width-200, 40);
  stroke(255);
}

void displayDamage(){
   textFont(f, 12);                  
  fill(255,0,0);
  textAlign(CENTER);
  text("DAMAGE:" + floor(damage), width-100, 40);
  stroke(255); 
}