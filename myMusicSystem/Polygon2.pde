class Polygon2 {
  float xx[]={0, 1, 2, 1, 0, -1, -1};
  float yy[]={1, 1, 1, -1, -1, -1, 1};
  float r=0;
  int num=(int)random(3, 6);
  int colorIndex;
  float xDire[]={0, 0, 0, 0, 0, 0};
  float yDire[]={0, 0, 0, 0, 0, 0};
  int type;
  Polygon2(int t) {
    this.type=t;
    colorIndex=(int)random(0, 8);
    xDire[0]=random(-1, -0.8);
    yDire[0]=random(-1, -0.8);
    for (int i=1; i<num; i++) {
      xDire[i]=random(xDire[i-1], xDire[i-1]+0.6);
      yDire[i]=random(yDire[i-1], yDire[i-1]+0.6);
    }
  }

  float getR() {
    return this.r;
  }

  void display() {
    color mycolor[]={#f94279, #20a99d, #138898, #f4d4c9, #cdeeee, #8dd9eb, #312b2d, #ffffff};
    r=r+0.07;
    if (r<3) {
      pushMatrix();
      translate(displayWidth/2, displayHeight/2);
      if (type==1) {
        fill(mycolor[this.colorIndex]);
        noStroke();
      } else {
        strokeWeight(r*4);
        noFill();
        stroke(mycolor[this.colorIndex]);
      }
      beginShape();
      for (int i=0; i<num; i++) {
        vertex(100*xDire[i]*xx[i]*r*r, 100*yDire[i]*yy[i]*r*r);
      }
      vertex(100*xDire[0]*xx[0]*r*r, 100*yDire[0]*yy[0]*r*r);
      endShape();
      translate(-displayWidth/2, -displayHeight/2);
      popMatrix();
    }
  }
}
