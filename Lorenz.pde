class Lorenz {
  boolean DEBUG = false;
  float x = 0.1;
  float y = 0;
  float z = 0;
  float sigma = 10.0;
  float rho = 28.0;
  float beta = 8.0 / 3.0;
  float t = 0.01;
  
  PVector prevCoord = new PVector(x, y, z);
  PVector currCoord = new PVector(x, y, z);
  
  Lorenz(float sigma, float rho, float beta) {
    this.sigma = sigma;
    this.rho = rho;
    this.beta = beta;
  }
  
  PVector sphericalProjection(PVector v) {
    final float radius = 250.0;
    float len = v.mag();
    return PVector.mult(v, radius/len);
  }
  
  void step() {
    float xt = x + t * sigma * (y - x);
    float yt = y + t * (x * (rho - z) - y);
    float zt = z + t * (x * y - beta * z);
    
    prevCoord = new PVector(x, y, z);
    currCoord = new PVector(xt, yt, zt);
    
    x = xt;
    y = yt;
    z = zt;
    
    if (DEBUG) {
      println(currCoord);
    }
  }
  
  void render() {
    PVector a = sphericalProjection(prevCoord);
    PVector b = sphericalProjection(currCoord);
    line(a.x, a.y, a.z, b.x, b.y, b.z);
  }
  
}