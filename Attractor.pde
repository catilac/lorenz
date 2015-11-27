Lorenz lorenz;
ArrayList<Particle> particles;

void setup() {
 fullScreen(P3D);
 background(0);
 lights();
 setupCamera();
 lorenz = new Lorenz(10.0, 28.0, 8.0/3.0);
 particles = new ArrayList<Particle>();
 generateSphere(250);
}

void draw() {
  background(0);
  lorenz.render();
  lorenz.step();
  drawParticles();
}

void setupCamera() {
  camera(0, 75, -width * 0.7, 0, 0, 0, 0, 1, 0);
}

PVector calculateForce(Particle p) {
  PVector force;
  PVector pos = lorenz.pos;
  
  force = PVector.sub(pos, p.pos);
  float mag = force.mag();
  force.div(mag);
  
  return force;
}

void drawParticles() {
  for(int i = 0; i < particles.size(); i++) {
    Particle p = particles.get(i);
    PVector force = calculateForce(p);
    p.update(force);
    p.render();
  }
}

void generateSphere(float radius) {
  
  for (int theta = 0; theta <= 360; theta += 2) {
    for (int phi = -90; phi <= 90; phi += 2) {
      float thetaRad = radians(theta);
      float phiRad = radians(phi);
      float x = radius * cos(thetaRad) * cos(phiRad);
      float y = radius * cos(thetaRad) * sin(phiRad);
      float z = radius * sin(thetaRad);
      particles.add(new Particle(x, y, z));
    }
  }
  
  println("NUM PARTICLES: ", particles.size());
      
}