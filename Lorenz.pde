class Lorenz {
  boolean DEBUG = false;
  float x = 0.1;
  float y = 0;
  float z = 0;
  float sigma = 10.0;
  float rho = 28.0;
  float beta = 8.0 / 3.0;
  float t = 0.01;
  float scale = 10.0;
  
  PVector prevCoord = new PVector(x, y, z);
  PVector currCoord = new PVector(x, y, z);
  
  Lorenz(float sigma, float rho, float beta) {
    this.sigma = sigma;
    this.rho = rho;
    this.beta = beta;
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
    prevCoord.mult(scale);
    currCoord.mult(scale);
    line(prevCoord.x, prevCoord.y, prevCoord.z, currCoord.x, currCoord.y, currCoord.z);
  }
  
}