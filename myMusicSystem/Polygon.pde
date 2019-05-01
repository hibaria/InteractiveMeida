class Polygon {
  float xx[]={random(700, 800), random(400, 600), random(800, 900), random(300, 600), random(700, 900), random(400, 600), random(700, 900)};
  float yy[]={random(500, 600), random(600, 800), random(400, 600), random(500, 700), random(600, 800), random(700, 1000), random(300, 800)};
  float r=0;
  int num=(int)random(3, 5);
  float dire[]={-1, -0.5, 0, 0.5, 1};
  int colorIndex;
  float xDire[]={0, 0, 0, 0, 0, 0};
  float yDire[]={0, 0, 0, 0, 0, 0};
  int type;
  Polygon(int tt) {
    colorIndex=(int)random(0, 8);
    this.type=tt;
    for (int i=0; i<num; i++) {
      xDire[i]=dire[(int)random(0, 4)];
      yDire[i]=dire[(int)random(0, 4)];
    }
  }

  float getR() {
    return this.r;
  }

  void display() {
    color mycolor[]={#f94279, #20a99d, #138898, #f4d4c9, #cdeeee, #8dd9eb, #312b2d, #ffffff};
    if (type==0) {
      strokeWeight(8);
      noFill();
      stroke(mycolor[this.colorIndex]);
    } else {
      noStroke();
      fill(mycolor[this.colorIndex]);
    }
    r=r+0.03;
    if (r<1.6) {
      pushMatrix();
      translate(displayWidth/2, displayHeight/2);
      beginShape();
      for (int i=0; i<num; i++) {
        vertex(xDire[i]*xx[i]*sin(r)/3, yDire[i]*yy[i]*sin(r)/3);
      }
      vertex(xDire[0]*xx[0]*sin(r)/3, yDire[0]*yy[0]*sin(r)/3);
      endShape();
      translate(-displayWidth/2, -displayHeight/2);
      popMatrix();
    }
  }
}
