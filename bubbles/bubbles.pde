boolean hasClicked;
int maxBubbles;
int numberOfBubbles;
int bubblesPopped;
Bubble[] bubbles;

void setup() {
  //fullScreen();
  size(1200, 900);

  hasClicked = false;

  maxBubbles = 1000;
  numberOfBubbles = 0;
  bubblesPopped = 0;
  bubbles = new Bubble[maxBubbles];

  for (int i = 0; i < bubbles.length; i++) {
    bubbles[i] = new Bubble();
  }
}

void draw() {
  noStroke();
  fill(250);
  rect(0, 0, width, height);

  grid(100);

  for (int i = 0; i < numberOfBubbles; i++) {
    bubbles[i].animate();
  }
  
  //UI
  if (!hasClicked) {
    fill(100, 100);
    textSize(128);
    textAlign(CENTER);
    text("Click me", width/2, height/2);
  }
  
  if (bubblesPopped == maxBubbles) {
    fill(250 ,100, 150);
    textSize(128);
    textAlign(CENTER);
    text("YOU WIN!", width/2, height/2);
  }
  
  fill(250 ,100, 150);
  textSize(40);
  textAlign(LEFT);
  text("Bubbles: "+numberOfBubbles, 20, 50);
  textAlign(RIGHT);
  text(bubblesPopped + " Popped!", width-20, 50);
}

void mousePressed() {
  if (!hasClicked) {
    hasClicked = true;
  }

  if ((!clickedOnBubble())&&(numberOfBubbles<maxBubbles)) {
    numberOfBubbles++;
  }
}

void grid(int size) {
  for (int y = 0; y < height; y += size) {
    for (int x = 0; x < width; x += size) {
      fill(240);
      stroke(100);
      rect(x, y, size, size);
    }
  }
}

boolean clickedOnBubble() {
  boolean clicked = false;
  for (int i = 0; i < numberOfBubbles; i++) {
    if (bubbles[i].clicked()) {
      clicked = true;
      bubblesPopped++;
    }
  }
  return clicked;
}
