import peasy.*;

Planet sun;

PeasyCam cam;

PImage sunTexture;
PImage[] textures = new PImage[4];

void setup() {
  // P3D zet je werkveld in 3D
  size(600, 600, P3D);
  
  sunTexture = loadImage("sun.jpg");
  textures[0] = loadImage("mars.jpg");
  textures[1] = loadImage("earth.jpg");
  textures[2] = loadImage("mercury.jpg");
  textures[3] = loadImage("venus.jpg");
  
  cam = new PeasyCam(this, 500);
  sun = new Planet(50, 0, 0, sunTexture);
  sun.spawnMoons(4, 1);
}

void draw() {
  background(0);
  //Een lichtbron van uit de zon ==> red, green, blue, x, y, z
  int z = 100;
  for (int i = 0; i < 2; i++){
    z = -z;
    pointLight(255, 255, 255, -100, -100, z);
    pointLight(255, 255, 255, 100, -100, z);
    pointLight(255, 255, 255, 100, 100, z);
    pointLight(255, 255, 255, -100, 100, z);
  }
  //Plaats het object in het midden
  //translate(width/2, height/2);
  sun.show();
  sun.orbit();
}
