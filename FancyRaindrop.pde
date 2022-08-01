class FancyRaindrop {
  float x, y;
  float speed;
  color col;
  float diameter;

  FancyRaindrop(float x, float diameter, float speed, color col) {
    this.x = x;
    this.diameter = diameter;
    this.speed = speed;
    this.col = col;
    this.y = 0;
  }

  void move() {
    y += speed;
  }

  void display() {
    stroke(col);
    fill(col);
    for (int i=0; i < 4; i++)
      ellipse(x, y-i, diameter-2*i, diameter+2*i);
  }

  boolean reachedBottom() {
    return (y > height);
  }
  
}
