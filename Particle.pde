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
  
  void update(PVector dv) {
    vel.add(dv);
    pos.add(vel);
  }
  
  void render() {
    c = color(random(50,255), random(45, 155), random(0,55));
    noStroke();
    fill(c);
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    sphereDetail(2, 2);
    sphere(size);
    popMatrix();
  }
}