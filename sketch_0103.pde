PGraphics pg;
PImage img;
int posterW = 586;
int posterH = 810;
void setup(){
  size(586, 810, P2D);
  pixelDensity(2);
  pg = createGraphics(586, 810, P2D);
  img = loadImage("tsao5.jpg");
  img.resize(0, (int)586);
  background(0);

  translate(width/2, height/2);
  //rectMode(CENTER);
  imageMode(CENTER);
  textMode(SHAPE);
}

void draw(){

  pg.noStroke();
  pg.beginDraw();
  pg.background(255, 0, 0);
  //pg.image(img, width/2, height/2);
  for(int i = 0; i< posterW+10; i+= 1){
    for(int j = 0; j< posterH; j+= 1){
      int c = img.get(i,j);
      //float s = map(brightness(c), 255, 0, 0, 10);
      pg.pushMatrix();
      pg.translate(i, j);
      pg.fill(brightness(c));
      pg.rect(0, 0, 1, 1);
      pg.popMatrix();
    }
  }
  pg.endDraw();
  int tilesX = 10;
  int tilesY = 40;
  int tilesW = posterW/tilesX;
  int tilesH = posterH/tilesY;
  for(int y = 0; y<tilesY; y++){
  for(int x = 0; x<tilesX; x++){
    int waveX = int(sin(radians(frameCount)*(x))*50);
    //source
    int sx = x*tilesW+waveX;;
    int sy = y*tilesH+200;
    int sw = tilesW;
    int sh = tilesH;
    //destination
    int dx = x*tilesW;
    int dy = y*tilesH;
    int dw = tilesW;
    int dh = tilesH;
    copy(pg, sx, sy, sw, sh, dx, dy, dw, dh);
  }
  }
  
  //image(pg, width/2, height/2);
  
}
