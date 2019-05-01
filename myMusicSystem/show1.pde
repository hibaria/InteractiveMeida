class show1 {
  float t;
  float theta;
  int maxFrameCount = 200; // frameCount, change for faster or slower animation
  int tt;
  float xOffset;
  float yOffset;
  int colorIndex;
  show1( int tt) {
    this.tt=tt;
    xOffset=random(-500, 500);
    yOffset=random(-500, 500);
    colorIndex=(int)random(8);
  }
  int getTt() {
    return this.tt;
  }
  void init(float temp) {
    color mycolor[]={#f94279, #20a99d, #138898, #f4d4c9, #cdeeee, #8dd9eb, #312b2d, #ffffff};
    pushMatrix();
    fill(mycolor[colorIndex]);
    noStroke();
    translate(displayWidth/2, displayHeight/2);
    translate(xOffset, yOffset);
    t = (float)frameCount/maxFrameCount*4;
    theta = TWO_PI*t;
    for ( int x= -175; x <= 175; x += 25) {
      for (int y= -100; y <= 155; y += 50) {
        float offSet = 50*x+y+y;   // play with offSet to change map below
        float x2 = map(cos(-theta+offSet), 0, 1, 0, 25); // map x position
        float y2 = map(cos(-theta+offSet), 0, 1, 25, 0); // map y position

        float sz2 = map(sin(-theta+offSet), 0, 1, 15, 45); // map size off the ellipse
        ellipse((x+x2), (y-y2), temp*sz2, temp*sz2);
      }
    }
    translate(-displayWidth/2, -displayHeight/2);
    popMatrix();
  }
}
