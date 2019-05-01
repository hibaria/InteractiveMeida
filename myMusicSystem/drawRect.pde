class drawRect {
  float r;
  int index;
  float size;
  float xdire;
  float ydire;
  int type;
  drawRect(int type) {
    r=0;
    index=(int)random(0, 8);
    size=random(0.7, 1.3);
    xdire=random(-3, 3);
    ydire=random(-3, 3);
    this.type=type;
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
    if (r<3.2) {
      rect(xdire*100*(1-(r-1)*r-1), ydire*100*(1-(r-1)*r-1), size*100*sin(r), size*100*sin(r));
    }
    translate(-displayWidth/2, -displayHeight/2);
    popMatrix();
  }
}
