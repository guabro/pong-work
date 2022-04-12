//Global Variables and Objects
int NumberOfStars = 5; //Verseion of a Static Variable in Pure Java, final here
Ball[] stars = new Ball[NumberOfStars]; //Processing Requires #, Pure Java allows static variable
//
int appWidth, appHeight; //final variables
int smallerDisplayDimension; //final variable
//
Boolean redo=true;
//
void setup() {
  size (500, 600); //fullScreen, displayWidth, displayHeight
  //Protrait, not landscape or square
  println (width, height, displayWidth, displayHeight);
  appWidth = width; // switch with displayWidth
  appHeight = height; // switch with displayHeight
  smallerDisplayDimension = ( appWidth <= appHeight ) ? appWidth : appHeight;
  //
  while (redo==true) {
    for (int i=0; i<stars.length; i++) {
      //Randomly choose parameters
      float diameterRandom = random ( smallerDisplayDimension*1/8, smallerDisplayDimension*1/4); //Consider user Input (eye sentitivity)
      float xRandom = random ( diameterRandom*1/2, appWidth-diameterRandom*1/2 ); //No stars in net
      float yRandom = random ( diameterRandom*1/2, appHeight-diameterRandom*1/2 ); //Entire appHeight OK
      stars[i] = new Ball (xRandom, yRandom, diameterRandom);
      int j=i;
      // Pick variables, then test to previous picks
      // IF doesn't work, then pick new
      while (j>=0) {
        if ( xRandom-diameterRandom*1/2 > stars[j].ballX && xRandom+diameterRandom*1/2 < stars[j].ballX ) {
          xRandom = random ( diameterRandom*1/2, appWidth-diameterRandom*1/2 );
        }//End WHILE-X
        j--;
      }//End WHILE
      stars[i] = new Ball (xRandom, yRandom, diameterRandom);
      j=i;
      while (j>=0) {
        if ( yRandom-diameterRandom*1/2 > stars[j].ballY && yRandom+diameterRandom*1/2 < stars[j].ballY ) {
          yRandom = random ( diameterRandom*1/2, appHeight-diameterRandom*1/2 );
        }//End WHILE-Y
        j--;
      }//End WHILE
      //
      stars[i] = new Ball (xRandom, yRandom, diameterRandom);
      //
    }//End FOR
    redo=false;
    //Check only works for 1/2 so some mistakes will slip through
    for ( int i=0; i<stars.length; i++ ) {
      for ( int j=stars.length-1; j>i; j-- ) {
        if (stars[i].ballX+stars[i].ballDiameter < stars[j].ballX && stars[i].ballX-stars[i].ballDiameter > stars[j].ballX) redo=true;
        if (stars[i].ballY+stars[i].ballDiameter < stars[j].ballY && stars[i].ballX-stars[i].ballDiameter > stars[j].ballY) redo=true;
      }//End nested FOR
    }//End Final Check
  }//End WHILE
}//End setup
//
void draw() {
  for ( int i=0; i<stars.length; i++ ) {
    stars[i].drawStar();
  }//End FOR
}//End draw
//
void keyPressed() {
}//End keyPressed
//
void mousePressed() {
}//End mousePressed
//
//End Main Driver
