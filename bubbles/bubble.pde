class Bubble {
  float x;
  float y;
  float size;
  float speed;
  float delay;
  float r;
  float g;
  float b;
  
  Bubble() {
    delay = random(0,height);
    speed = random(5);
    size = random(10,100);
    x = random(0+(size/2), width-(size/2));
    y = height+(size/2)+delay;
    r = random(150,200);
    g = random(100,200);
    b = random(200,250);
  }
  
  void animate() {
    stroke(r,g,b);
    fill(r, g, b, 100);
    ellipse(x,y,size,size);
    y -= random(speed);
    x += random(-speed/2, speed/2);
    
    if (x < 0+(size/2)) {
      x += speed;
    }
    
    if (x > width-(size/2)) {
      x -= speed;
    }
    
    if (y < 0-(size/2)) {
      y = height + (size/2);
    }
  }
}
