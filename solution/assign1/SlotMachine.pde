class SlotMachine{
  int initX = 170;
  int initY = 200;
  int m=3, n=1;
  int [] fruitNumbers = {0,1,2,3,4,5};
  int [] fruitScores = {60,10,20,30,40,50};
  Fruit [] fruits; 
  Fruit [][] animatedSlots;  // this one is for animation
  Fruit [][] slots;          // this one is for assignment use,
                             // students can only access "slots"
  
  SlotMachine(){
    // setup fruits
    fruits = new Fruit[fruitNumbers.length];
    for (int i=0; i<fruitNumbers.length; i++){
      fruits[i] = new Fruit(fruitNumbers[i], fruitScores[i]);
    }
    // init slots
    animatedSlots = new Fruit[m][n];
    slots = new Fruit[m][n];

    initSlot();
  }
  
  void initSlot(){
    for (int i=0; i<m; i++){
      for (int j=0; j<n; j++){
        setSlotFruit(i,0); 
      }
    }
  }
  
  // easy version
  void setSlotFruit(int x, int fid){
    slots[x][0] = fruits[fid];
  }
  
  void displaySlots(){
    for (int i=0; i<m; i++){
      for (int j=0; j<n; j++){
        slots[i][j].display(initX+i*100,initY+j*100,100,100);
      }
    }
  }
  
  void roll(){
    for (int i=0; i<m; i++){
      for (int j=0; j<n; j++){
        int rnd = int(random(fruitNumbers.length));
        animatedSlots[i][j] = fruits[rnd];
        animatedSlots[i][j].display(initX+i*100,initY+j*100,100,100);
      }
    }
  }
  
  void stop(){
    displaySlots();
  }
  
  int getSlotScore(int num){
    return fruitScores[num];
  }
  
  int getFruitCount(int fid){
    int count=0;
    for (int i=0; i<m; i++){
      for (int j=0; j<n; j++){
        if ( slots[i][j].fruitId == fid){
          count++;
        }
      }
    }
    return count;
  }
  
  int probability(float p){
    return ( random(1) < p ? 1 : 0);
  }
  
}
