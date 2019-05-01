class rect_Particle {
  Body body;
  float r;
  boolean isChange;
  rect_Particle(float x, float y, float r_) {
    r = r_;
    makeBody(x, y, r*8);
    isChange=false;
  }
  void killBody() {
    box2d.destroyBody(body);
  }

  boolean done() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    if ((pos.y > displayHeight*2.5/4)||(pos.y < displayHeight/4)||(pos.x > displayWidth*2.5/4)||(pos.x < displayWidth/4)) {
      killBody();
      return true;
    }
    return false;
  }

  void change() {
    isChange=true;
  }

  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);

    noFill();
    strokeWeight(4);
    stroke(rr[(int)r-3], gg[(int)r-3], bb[(int)r-2], 191);
    rect(0, 0, r*16, r*16);
    popMatrix();
  }

  void makeBody(float x, float y, float r) {
    BodyDef bd = new BodyDef();
    bd.position = box2d.coordPixelsToWorld(x, y);
    bd.type = BodyType.DYNAMIC;
    body = box2d.world.createBody(bd);
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    fd.density = 1;
    fd.friction = 0.01;
    fd.restitution = 0.3;
    body.createFixture(fd);
    body.setLinearVelocity(new Vec2(random(-10f, 10f), random(5f, 10f)));
    body.setAngularVelocity(random(-10, 10));
  }
}
