class drawEllipse2 {
  float r;
  int index;
  float size;
  float x;
  float y;
  int type;

  drawEllipse2(int type) {
    r=0;
    index=(int)random(0, 8);
    size=random(0.7, 1.3);
    this.type=type;
    x=random(-displayWidth/2+20, displayWidth/2-20);
    y=random(-displayWidth/2+20, displayHeight/2-20);
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
    r=r+0.14;
    if (r<3.2) {
      ellipse(x, y, size*100*sin(r), size*100*sin(r));
    }
    translate(-displayWidth/2, -displayHeight/2);
    popMatrix();
  }
}
