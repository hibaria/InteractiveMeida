class Surface {
  ArrayList<Vec2> surface;
  Body body;

  Surface(float x1, float y1, float x2, float y2) {
    surface = new ArrayList<Vec2>();
    surface.add(new Vec2(x1, y1));
    surface.add(new Vec2(x2, y2));
    ChainShape chain = new ChainShape();
    Vec2[] vertices = new Vec2[surface.size()];
    for (int i = 0; i < vertices.length; i++) {
      vertices[i] = box2d.coordPixelsToWorld(surface.get(i));
    }
    chain.createChain(vertices, vertices.length);
    BodyDef bd = new BodyDef();
    body = box2d.world.createBody(bd);
    body.createFixture(chain, 1);
  }
  void kill() {
    box2d.destroyBody(body);
  }

  void display() {
    strokeWeight(2);
    stroke(255);
    fill(255);
    beginShape();
    for (Vec2 v : surface) {
      vertex(v.x, v.y);
    }
    endShape(CLOSE);
  }
}
