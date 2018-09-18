class Planet {
  //PVector = Beschrijft een 2 of 3 dimensionale vector (vector is een entiteit die zowel omvang als richting heeft)
  float radius;
  float angle;
  float distance;
  float orbitSpeed;
  
  Planet[] planets;
  
  Planet(float r, float d, float o) {
    radius = r;
    angle = random(TWO_PI);
    distance = d;
    orbitSpeed = o;
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
      float r = radius/(level*1.2);
      float d = random(50, 150);
      float o = random(-0.1, 0.1);
      planets[i] = new Planet(r, d/level, o);
      if(level < 4) {
        int num = int(random(0, 4));
        planets[i].spawnMoons(num, level+1);
      }
    }
  }
  
  void show() {
    // sla de translation op
    pushMatrix();
    fill(255, 100);
    rotate(angle);
    translate(distance, 0);
    ellipse(0, 0, radius*2, radius*2);
    
    if(planets != null) {
      for(int i = 0; i < planets.length; i++) {
        planets[i].show();
      }
    }
    //laat de translation terug vanaf 0 beginnen
    popMatrix();
  }
}
