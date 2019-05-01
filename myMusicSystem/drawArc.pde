class drawArc {
  float r;
  int index;
  float size;
  int type;
  float begin;
  drawArc(int type) {
    r=0;
    index=(int)random(0, 8);
    size=random(200, 500);
    this.type=type;
    this.begin=random(0, 2*PI);
  }
  float getR() {
    return this.r;
  }
  void display() {
    color mycolor[]={#f94279, #20a99d, #138898, #f4d4c9, #cdeeee, #8dd9eb, #312b2d, #ffffff};
    if (type==0) {      
      noStroke();
      fill(mycolor[this.index]);
    } else {
      noFill();
      stroke(mycolor[this.index]);
      strokeWeight(4);
    }
    pushMatrix();
    translate(displayWidth/2, displayHeight/2);
    r=r+0.06;
    if (r<=2*PI) {
      arc(0, 0, size, size, begin, begin+sin(r)*2*PI);
    }
    translate(-displayWidth/2, -displayHeight/2);
    popMatrix();
  }
}
