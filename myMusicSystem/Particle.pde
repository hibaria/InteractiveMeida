int rr[]={107, 86, 104, 86, 99};
int gg[]={146, 170, 226, 131, 232};
int bb[]={168, 234, 227, 234, 237};
int rr1[]={107, 86, 104, 86};
int gg1[]={146, 170, 226, 131};
int bb1[]={168, 234, 227, 234};
int rr2[]={107, 86, 104, 86};
int gg2[]={146, 170, 226, 131};
int bb2[]={168, 234, 227, 234};
int color_r[][]={rr};

class Particle {
  Body body;
  float r;
  Particle(float x, float y, float r_) {
    r = r_;
    makeBody(x, y, r*2);
  }
  void killBody() {
    box2d.destroyBody(body);
  }
  boolean done() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    if (pos.y > height+r*2) {
      killBody();
      return true;
    }
    return false;
  }
  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    fill(rr[(int)r-2], gg[(int)r-2], bb[(int)r-2], 191);
    noStroke();
    ellipse(0, 0, r*4, r*4);
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
