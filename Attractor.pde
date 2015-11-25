Lorenz lorenz;

void setup() {
 size(600, 600, P3D);
 background(255);
 lights();
 setupCamera();
 lorenz = new Lorenz(10.0, 28.0, 8.0/3.0);
}

void draw() {
  lorenz.render();
  lorenz.step();
}

void setupCamera() {
  camera(width/2, -75, width * 0.7, 0, 0, 0, 0, 1, 0);
}