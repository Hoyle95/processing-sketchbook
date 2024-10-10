Bubble[] bubbles = new Bubble[1000];

void setup() {
  fullScreen();
  //size(1200,900);
  
  for (int i = 0; i < bubbles.length; i++) {
    bubbles[i] = new Bubble();
  }
}

void draw() {
  stroke(0);
  fill(250);
  rect(0,0,width,height);
  
  grid(100);
  line(100,0, 100,height);
  
  for (int i = 0; i < bubbles.length; i++) {
    bubbles[i].animate();
  }
}

void grid(int size) {
  stroke(100);
  
  for (int y = 0;y < height; y += size) {
    for (int x = 0;x < width; x += size) {
      fill(240);
      rect(x,y, size,size);
    } 
  } 
}
