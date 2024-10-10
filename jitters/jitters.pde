float circleX;
float circleY;
float circleSize;
float circleSpeed;
float r;
float g;
float b;
float lifeSpan;
float alive;

void jitter() {
  circleSize = random(10, 200);
  circleSpeed = random(2, circleSize/4);
  circleX = random(circleSize/2, width-(circleSize/2));
  circleY = random(circleSize/2, height-(circleSize/2));
  r = random(255);
  g = random(255);
  b = random(255);
  lifeSpan = random(100, 600);
  alive = 0;
}

void mouseClicked () {
  jitter();
}

void setup() {
  //fullScreen();
  size(1200,900);
  background(0);
  jitter();
}

void draw() {
  stroke(0, 0);
  fill(10, 1);
  rect(0, 0, width, height);

  stroke(0, 0);
  fill(r, g, b);
  ellipse(circleX, circleY, circleSize, circleSize);

  alive++;

  if (alive > lifeSpan) {
    jitter();
  }

  if (circleX > width-(circleSize/2)) {
    circleX = circleX - circleSpeed;
  } else if (circleX < 0+(circleSize/2)) {
    circleX = circleX + circleSpeed;
  } else if (circleY < 0+(circleSize/2)) {
    circleY = circleY + circleSpeed;
  } else if (circleY > height-(circleSize/2)) {
    circleY = circleY - circleSpeed;
  } else {
    circleX = circleX + random(-circleSpeed, circleSpeed);
    circleY = circleY + random(-circleSpeed, circleSpeed);
  }
  
  delay(100);
}
