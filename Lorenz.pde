class Lorenz {
  boolean DEBUG = false;
  float x = 0.1;
  float y = 0;
  float z = 0;
  float sigma = 10.0;
  float rho = 28.0;
  float beta = 8.0 / 3.0;
  float t = 0.01;
  color c = color(255, 120, 123);
  
  PVector pos = new PVector(x, y, z);
  
  Lorenz(float sigma, float rho, float beta) {
    this.sigma = sigma;
    this.rho = rho;
    this.beta = beta;
  }
  
  private PVector sphericalProjection(PVector v) {
    final float radius = 250.0;
    float len = v.mag();
    return PVector.mult(v, radius/len);
  }
  
  void step() {
    float xt = x + t * sigma * (y - x);
    float yt = y + t * (x * (rho - z) - y);
    float zt = z + t * (x * y - beta * z);
    
    pos = sphericalProjection(new PVector(xt, yt, zt));
    
    x = xt;
    y = yt;
    z = zt;
    
    if (DEBUG) {
      println(pos);
    }
  }
  
  void render() {
    stroke(c);
    fill(c);
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    sphere(1);
    popMatrix();
  }
  
}