class Catcher {
  float r;    //radius
  float x, y; //location

  Catcher(float radius) {
    r = radius;
    x = 0;
    y = 0;
  }

  void setLocation(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void display() {
    stroke(0);
    fill(175);
    PImage cath = loadImage("cubeta.png");
    image(cath,x,y,r*2,r*2);
    //ellipse(x, y, r*2, r*2);
  }

  boolean intersect(FancyRaindrop d) {
    float distance = dist(x, y, d.x, d.y);   // Calcular distancia
    // Compare distance to sum of radio
    if (distance < r) {
      return true;
    } else {
      return false;
    }
  }
}
