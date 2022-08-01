// Inicializan variables
Catcher catcher;
FancyRaindrop[] raindrops;
Timer timer;
PImage img, img2, img3;
int cont=0, s=0,x=width/2;
boolean gameOver = true, victory = false;

void setup() {
  size(600, 600);
  smooth();
  catcher = new Catcher(30);
  timer = new Timer(.1);
  raindrops = new FancyRaindrop[100];

  //·································
  img = loadImage("background.png");
  img2 = loadImage("gameover.jpeg");
  img3 = loadImage("agua.png");
  catcher.setLocation(x,540);
}

void draw() {
  background(255);

  //·············································
  image(img, 0, 0);
  textSize(35);
  text("Puntuacion "+cont, 15, 26);
  fill(255, 255, 255);
  
  if (s == 0 || gameOver == true && victory == false) {
    image(img2, 0, 0, 600, 600);
    s=0;
  } else if (s <= 2 && cont >= 100) {
    textAlign(CENTER);
    textSize(18);
    text ("PRESS A KEY", width/2, height/2+20);
    textSize(45);
    text ("congratulations!", width/2, height/2);
    s = 0;
    victory = true;
  } else {
    game();
  }
  s = second();
  //·············································
}

void game() {
  if (timer.hasRunOut())
    for (int i = 0; i < raindrops.length; i++)
      if (raindrops[i] == null || raindrops[i].reachedBottom()) {
        raindrops[i] = new FancyRaindrop(random(width), random(5, 10), random(.5, 3), color(0, 0, 255));
        timer.restart();
        break;
      }
  for (int i = 0; i < raindrops.length; i++)
    if (raindrops[i] != null && !raindrops[i].reachedBottom())
      raindrops[i].move();
  //catcher.setLocation(mouseX, 540); //cordenadas de mouse
  keyPressed();
  for (int i = 0; i < raindrops.length; i++) {
    if (raindrops[i] != null && !raindrops[i].reachedBottom()) {
      if (catcher.intersect(raindrops[i])) {
        raindrops[i] = null;
        cont += 1;
        image(img3, x, 480, 50, 50);
      } else {
        raindrops[i].display();
      }
    }
  }
  catcher.display();
}

void keyPressed() {
  if (gameOver == true || victory == true) {
    gameOver = false;
    victory = false;
    cont = 0;
    s=0;
  }
  if(keyCode == 37){
    catcher.setLocation(x=x-5, 540);
    if(x <= 10){  catcher.setLocation(x=10, 540);}
  }
  else if(keyCode == 39){
    catcher.setLocation(x= x+5, 540);
    if(x >= width-63){  catcher.setLocation(x=width-63, 540);}
  }
}
