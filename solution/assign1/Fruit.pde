class Fruit{
  int fruitId;
  int score;
  String imgPath;
  PImage img;
  
  Fruit(int fid, int score){
    this.fruitId = fid;
    this.score = score;
    this.imgPath = "data/0"+fruitId+".png";
    this.img = loadImage(imgPath); 
  }
  
  void display(int x, int y, int w, int h){
    image(this.img, x, y, w, h);
  }
  
}
