class Particle {
  PVector pos;
  PVector vel;
  float size;
  color c;
  
  Particle(float xPos, float yPos, float zPos) {
    pos = new PVector(xPos, yPos, zPos);
    vel = new PVector(0, 0, 0);
    size = 2.0;
  }
  
  private PVector sphericalProjection(PVector v) {
    final float radius = 550.0;
    float len = v.mag();
    return PVector.mult(v, radius/len);
  }

  
  void update(PVector dv) {
    vel.add(dv);
    pos.add(vel);
  }
  
  void render() {
    c = color(random(50,155), random(45, 255), random(0,155));
    PVector proj = sphericalProjection(pos);
    noStroke();
    fill(c);
    pushMatrix();
    //translate(pos.x, pos.y, pos.z);
    translate(proj.x, proj.y, proj.z);
    sphereDetail(2, 2);
        
    sphere(size);
    popMatrix();
  }
}