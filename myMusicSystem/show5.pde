class show5 {
  float circle = 200;
  float rot;
  float col;
  float freq = 0.00003; 
  float cont = 0;
  float r;
  int tt;
  color mycolor[]={#f94279, #20a99d, #138898, #f4d4c9, #cdeeee, #8dd9eb, #312b2d, #ffffff};
  int colorIndex;

  show5(int tt) {
    this.tt=tt;
    colorIndex=(int)random(8);
  }
  int getTt() {
    return this.tt;
  }
  void display() {
    pushMatrix();
    translate(displayWidth/2, displayHeight/2);
    rotate(radians(rot));
    for (int i=0; i<220; i ++) {
      fill(mycolor[colorIndex]);
      stroke(mycolor[colorIndex]);
      circle= 250 + 50*sin(millis()*freq*i);
      r=map(circle, 150, 250, 10, 3);
      ellipse(circle*cos(i), circle*sin(i), r, r);    
      rot=rot+0.00005;
    }
    translate(-displayWidth/2, -displayHeight/2);
    popMatrix();
  }
}
