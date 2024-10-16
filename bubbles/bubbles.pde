//sound files
import processing.sound.*;
SoundFile pop;
SoundFile backgroundSong;

//game state
boolean roundEnd;
int round;

//tiles
int tileSize = 100;

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
}

void draw() {
  //clear screen
  noStroke();
  fill(250);
  rect(0, 0, width, height);
  
  //draw background tiles
  for (int y = 0; y < height; y += tileSize) {
    for (int x = 0; x < width; x += tileSize) {
      fill(240);
      stroke(100);
      rect(x, y, tileSize, tileSize);
    }
  };
  
  //draw click me prompt at start
  if (round == 0) {
    fill(100, 100);
    textSize(128);
    textAlign(CENTER);
    text("Click me", width/2, height/2);
  } else {
    //start music once round 1 starts
    if (!backgroundSong.isPlaying()) {
      backgroundSong.play();
    }
  }
  
  //draw and update active bubbles
  for (int i = 0; i < numberOfBubbles; i++) {
    bubbles[i].animate();
  }
  
  //bubble machine
  if ((numberOfBubbles<maxBubbles)&&(round!=0)&&(random(0, 100)<6)) {
    numberOfBubbles++;
  }

  //if all bubbles are popped, show victory screen
  if ((bubblesPopped == maxBubbles)&&(round!=0)) {
    fill(250, 100, 150);
    textSize(128);
    textAlign(CENTER);
    text("YOU WIN!", width/2, height/2);
    roundEnd = true;
  }

  //UI text
  fill(250, 100, 150);
  textSize(40);
  textAlign(LEFT);
  text("Bubbles "+(numberOfBubbles-bubblesPopped), 20, 50);
  textAlign(RIGHT);
  text(bubblesPopped + " Popped", width-20, 50);
  textAlign(CENTER);
  text("Round "+round, width/2, 50);
  
  //UI buttons
  noFill();
  stroke(0);
  rect(width-70,height-70,50,50);
  rect(width-140,height-70,50,50);
  rect(width-210,height-70,50,50);
}

void mousePressed() {
  //if round has ended
  if (roundEnd) {
    //waits for click to start game, or starts the next round
    if (round!=0) {
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
      roundEnd = false;
      maxBubbles = 10;
      round++;
      bubbles = new Bubble[maxBubbles];
      for (int i = 0; i < bubbles.length; i++) {
        bubbles[i] = new Bubble();
      }
    }
  } else {
    //chick if click is inside of a bubble
    for (int i = 0; i < numberOfBubbles; i++) {
      if (bubbles[i].clicked()) {
        bubblesPopped++;
        pop.play(map(bubbles[i].size, 15, 100, 2.5, 0.5));
      }
    }
  }
}
