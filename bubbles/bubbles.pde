//sound files
import processing.sound.*;
SoundFile pop;
SoundFile backgroundSong;

//game state
boolean roundEnd;
int round;

//bubbles
int maxBubbles;
int numberOfBubbles;
int bubblesPopped;
Bubble[] bubbles;

void setup() {
  //fullScreen();
  size(1200, 900);

  //load sounds
  pop = new SoundFile(this, "assets/sound/pop.wav");
  backgroundSong = new SoundFile(this, "assets/sound/burning_purple.wav");

  //starting state
  roundEnd = true;
  round = 0;
  numberOfBubbles = 0;
  bubblesPopped = 0;

  //spawn bubbles
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

  if (round == 0) {
    fill(100, 100);
    textSize(128);
    textAlign(CENTER);
    text("Click me", width/2, height/2);
  } else {
    if(!backgroundSong.isPlaying()) {
      backgroundSong.play();
    }
  }

  if ((bubblesPopped == maxBubbles)&&(round!=0)) {
    fill(250, 100, 150);
    textSize(128);
    textAlign(CENTER);
    text("YOU WIN!", width/2, height/2);
    roundEnd = true;
  }

  fill(250, 100, 150);
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
  if (roundEnd) {

    if (round < 0) {
      round++;
      roundEnd = false;
      maxBubbles*=2;
      numberOfBubbles = 0;
      bubblesPopped = 0;
      bubbles = new Bubble[maxBubbles];
      for (int i = 0; i < bubbles.length; i++) {
        bubbles[i] = new Bubble();
      }
    } else {
      maxBubbles = 10;
      round++;
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
  if ((numberOfBubbles<maxBubbles)&&(round!=0)&&(random(0, 100)<6)) {
    numberOfBubbles++;
  }
}
