import processing.sound.*;
SoundFile pop;
SoundFile backgroundSong;
boolean hasClicked;
boolean roundEnd;
int maxBubbles;
int numberOfBubbles;
int bubblesPopped;
int round;
Bubble[] bubbles;

void setup() {
  //fullScreen();
  size(1200, 900);
  pop = new SoundFile(this, "assets/sound/pop.wav");
  backgroundSong = new SoundFile(this, "assets/sound/burning_purple.wav");
  hasClicked = false;
  round = 1;
  roundEnd = false;
  maxBubbles = 10;
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
    roundEnd = true;
  }
  
  fill(250 ,100, 150);
  textSize(40);
  textAlign(LEFT);
  text("Bubbles "+(numberOfBubbles-bubblesPopped), 20, 50);
  textAlign(RIGHT);
  text(bubblesPopped + " Popped", width-20, 50);
  textAlign(CENTER);
  text("Round "+round, width/2, 50);
  
  spawnBubbles();
}

void mousePressed() {
  if (!hasClicked) {
    hasClicked = true;
    backgroundSong.play();
  }
  
  if (roundEnd) {
    round++;
    roundEnd = false;
    maxBubbles*=2;
    numberOfBubbles = 0;
    bubblesPopped = 0;
    bubbles = new Bubble[maxBubbles];
    for (int i = 0; i < bubbles.length; i++) {
      bubbles[i] = new Bubble();
    }
  }
  
  clickedOnBubble();
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
      pop.play(map(bubbles[i].size, 15, 100, 2.5, 0.5));
    }
  }
  return clicked;
}

void spawnBubbles() {
  if ((numberOfBubbles<maxBubbles)&&(hasClicked)&&(random(0,100)<6)) {
    numberOfBubbles++;
  }
}
