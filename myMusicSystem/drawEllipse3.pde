class drawEllipse3 {
  float r;
  int index;
  float size;
  float x;
  float y;
  int type;
  float rr;
  float xx[]={0, 1, sqrt(2), 1, 0, -1, -sqrt(2), -1};
  float yy[]={sqrt(2), 1, 0, -1, -sqrt(2), -1, 0, 1};
  float offset;
  float xDire;
  float yDire;
  drawEllipse3(int type, int i, float rr, int c, float s) {
    r=0;
    offset=0;
    size=s;
    this.type=type;
    x=xx[i]*rr;
    y=yy[i]*rr;
    this.rr=rr;
    this.index=c;
    xDire=random(-1, 1);
    yDire=random(-1, 1);
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
    r=r+0.07;
    //ellipse(x,y,50,50);

    if (r<3.2) {
      if (r<1.6)
        ellipse(x, y, size*100*sin(r), size*100*sin(r));
      else {
        offset+=0.1;
        ellipse(x+xDire*offset*200, y+yDire*offset*200, size*100*sin(r), size*100*sin(r));
      }
    }
    translate(-displayWidth/2, -displayHeight/2);
    popMatrix();
  }
}
