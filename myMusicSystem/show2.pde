class show2 {
  int num=20;
  float step, sz, offSet, theta, angle;
  int tt;
  int k;
  float angleOffset;
  int colorIndex;

  show2(int t, int n) {
    this.step = 22;
    this.tt=t;
    this.k=0;
    this.angleOffset=random(0, 2);
    this.num=n;
    colorIndex=(int)random(7);
  }
  int getTt() {
    return this.tt;
  }
  void setK(int kk) {
    this.k=kk;
  }
  void init() {
    color mycolor[]={#f94279, #20a99d, #138898, #f4d4c9, #cdeeee, #8dd9eb, #ffffff};
    pushMatrix();
    translate(displayWidth/2, displayHeight/2);
    rotate(angleOffset*PI);
    stroke(mycolor[colorIndex]);
    noFill();
    strokeWeight(5);
    angle=100;
    for (int i=k; i<num; i++) {
      sz = i*step;
      float offSet = TWO_PI/num*i;
      float arcEnd = map(sin(theta+offSet), -1, 1, PI, TWO_PI);
      arc(0, 0, sz, sz, PI, arcEnd);
    }
    translate(-displayWidth/2, -displayHeight/2);
    popMatrix();
    colorMode(RGB);
    resetMatrix();
    theta += .15;
  }
}
