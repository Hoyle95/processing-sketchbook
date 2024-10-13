class Bubble {
  float x;
  float y;
  float size;
  float speed;
  float r;
  float g;
  float b;
  boolean enabled = true;
  
  Bubble() {
    speed = random(0.5,5);
    size = random(15,100);
    x = random(0+(size/2), width-(size/2));
    y = height+(size/2);
    r = random(150,200);
    g = random(100,200);
    b = random(200,250);
  }
  
  void animate() {
    if (enabled) {
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
    
  boolean clicked() {
    float distance = dist(mouseX, mouseY, x, y);
    if ((distance < size/2)&&enabled) {
      enabled = false;
      return true;
    } else {
      return false;
    }
  }
}
