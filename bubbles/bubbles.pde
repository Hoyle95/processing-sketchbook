boolean hasClicked;
int maxBubbles;
int numberOfBubbles;
Bubble[] bubbles;

void setup() {
  //fullScreen();
  size(1200, 900);

  hasClicked = false;

  maxBubbles = 1000;
  numberOfBubbles = 0;
  bubbles = new Bubble[maxBubbles];

  for (int i = 0; i < bubbles.length; i++) {
    bubbles[i] = new Bubble();
  }
}

void draw() {
  stroke(0);
  fill(250);
  rect(0, 0, width, height);

  grid(100);

  if (!hasClicked) {
    fill(100, 100);
    textSize(128);
    text("Click me", width/2 - 200, height/2);
  }

  for (int i = 0; i < numberOfBubbles; i++) {
    bubbles[i].animate();
  }
}

void mousePressed() {
  if (!hasClicked) {
    hasClicked = true;
  }

  if (!clickedOnBubble()) {
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
    }
  }
  return clicked;
}
