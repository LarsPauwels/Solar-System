class Planet {
  //PVector = Beschrijft een 2 of 3 dimensionale vector (vector is een entiteit die zowel omvang als richting heeft)
  float radius;
  float angle;
  float distance;
  float orbitSpeed;
  
  PVector v;
  PShape globe;
  
  Planet[] planets;
  
  Planet(float r, float d, float o, PImage img) {
    v = PVector.random3D();
    
    radius = r;
    angle = random(TWO_PI);
    distance = d;
    orbitSpeed = o;
    v.mult(distance);
    
    noStroke();
    noFill();
    globe = createShape(SPHERE, radius);
    globe.setTexture(img);
  }
  
  void orbit() {
    angle = angle + orbitSpeed;
    
    if(planets != null) {
      for(int i = 0; i < planets.length; i++) {
        planets[i].orbit();
      }
    }
  }
  
  void spawnMoons(int total, int level) {
    planets = new Planet[total];
    for(int i = 0; i < planets.length; i++) {
      float r = radius/(level*2);
      float d = random((radius + r)*0.5, (radius + r)*2);
      float o = random(-0.07, 0.07);
      int index = int(random(0, textures.length));
      
      planets[i] = new Planet(r, d, o, textures[index]);
      if(level < 2) {
        int num = int(random(0, 2));
        planets[i].spawnMoons(num, level+1);
      }
    }
  }
  
  void show() {
    // sla de translation op
    pushMatrix();
    
    PVector v2 = new PVector(1, 0, 1);
    PVector p = v.cross(v2);
    rotate(angle, p.x, p.y, p.z);
    /*stroke(255);
    line(0, 0, 0, v.x*10, v.y*10, v.z*10);
    line(0, 0, 0, p.x*10, p.y*10, p.z*10);*/
    
    translate(v.x, v.y, v.z);
    fill(255);
    noStroke();
    shape(globe);
    //sphere(radius);
    //ellipse(0, 0, radius*2, radius*2);
    
    if(planets != null) {
      for(int i = 0; i < planets.length; i++) {
        planets[i].show();
      }
    }
    //laat de translation terug vanaf 0 beginnen
    popMatrix();
  }
}
