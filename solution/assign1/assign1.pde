SlotMachine machine;
boolean rolling = false;
// button information
boolean button = false;
int x = 640/2;
int y = 440;
int w = 150;
int h = 50;

// declare variables
// --------------------------------------------
// put your code inside here
int totalScore = 500;
int slot0, slot1, slot2;
// --------------------------------------------

void setup() {
  size(640,480);
  textFont(createFont("fonts/Square_One.ttf", 20));
  machine = new SlotMachine();
}

void draw() {
  background(245,229,124);
  fill(64,162,171);
  rect(320,248,396,154,25);
  fill(253,253,253);
  rect(220,247,97,114,2);
  rect(320,247,97,114,2);
  rect(420,247,97,114,2);
  // draw button
  fill(64,162,171);
  noStroke();
  rectMode(CENTER);
  rect(x,y,w,h,105);
  // show title
  fill(64,64,63);
  textAlign(CENTER, CENTER);
  textSize(32);
  text("Slot Machine",x,49);
  textSize(20);
  text("Score"+" "+":"+" "+totalScore,x, 89);

  // event handler
  if (button) {
    if (!rolling){
      rolling = true;
      // start rolling
      // -------------------------------------------------
      // put your code inside here
      totalScore -=50;
      // -------------------------------------------------
    }
    machine.roll();
    textSize(19);
    text("Stop",x,y);

  } else {
    if (rolling){
      rolling = false;
      // stop rolling
      // -------------------------------------------------
      // put your code inside here

      // random
      slot0 = int(random(6));
      slot1 = int(random(6));
      slot2 = int(random(6));

      // version A:
      // 10% chance to get 777
      int luckySeven = 1-machine.probability(.1);
      //println(luckySeven);
      slot0 = int(random(6))*luckySeven;
      slot1 = int(random(6))*luckySeven;
      slot2 = int(random(6))*luckySeven;

      println(slot0+","+slot1+","+slot2);

      // assign fruit into slot
      machine.setSlotFruit(0,slot0);
      machine.setSlotFruit(1,slot1);
      machine.setSlotFruit(2,slot2);


      // caculate total score
      int fruitScore;
      fruitScore = machine.getSlotScore(slot0)+
                   machine.getSlotScore(slot1)+
                   machine.getSlotScore(slot2);

      // version B:
      // Need to change to machine.getSlotScore(slot0)
      fruitScore = (slot0*machine.getFruitCount(slot0)+
                    slot1*machine.getFruitCount(slot1)+
                    slot2*machine.getFruitCount(slot2))*10;

      totalScore += fruitScore;

      // -------------------------------------------------
    }
    machine.stop();
    fill(253,253,253);
    textSize(19);
    text("Roll",x,y);
  }

}

// When the mouse is pressed, the state of the button is toggled.
void mousePressed() {
  if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
    button = !button;
  }
}
