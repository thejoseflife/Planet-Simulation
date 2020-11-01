import peasy.*;

PImage background;
PeasyCam cam;

PShape sun;
PImage suntex;

PShape mercury;
PImage mercuryTexture;

PShape venus;
PImage venusTexture;

PShape earth;
PImage earthTexture;
PShape earthMoon;
PImage earthMoonTexture;

PShape mars;
PImage marsTexture;
PShape marsMoon1;
PImage marsMoon1Texture;
PShape marsMoon2;
PImage marsMoon2Texture;

final float SPEED = 0.5;
final float EARTH_SPEED = 300;

void setup() {
  size(1400, 800, P3D);
  cam = new PeasyCam(this, 4000);
  cam.setWheelScale(0.02);
  cam.setPitchRotationMode();
  
  background = loadImage("starfield1.jpeg");
  suntex = loadImage("sun.jpg");  
  mercuryTexture = loadImage("mercury.jpg"); 
  venusTexture = loadImage("venus.jpg");
  earthTexture = loadImage("earth.jpg");
  earthMoonTexture = loadImage("earth_moon.jpg");
  marsTexture = loadImage("mars.jpg");
  marsMoon1Texture = loadImage("mars_moon1.jpg");
  marsMoon2Texture = loadImage("mars_moon2.jpg");

  noStroke();
  fill(255);
  sphereDetail(40);

  sun = createShape(SPHERE, 300);
  sun.setTexture(suntex);  

  mercury = createShape(SPHERE, 30);
  mercury.setTexture(mercuryTexture);
  
  venus = createShape(SPHERE, 80);
  venus.setTexture(venusTexture);

  earth = createShape(SPHERE, 90);
  earth.setTexture(earthTexture);
  earthMoon = createShape(SPHERE, 20);
  earthMoon.setTexture(earthMoonTexture);
  
  mars = createShape(SPHERE, 60);
  mars.setTexture(marsTexture);
  marsMoon1 = createShape(SPHERE, 20);
  marsMoon1.setTexture(marsMoon1Texture);
  marsMoon2 = createShape(SPHERE, 20);
  marsMoon2.setTexture(marsMoon2Texture);
}

void draw() {
  background(0);
  translate(-500, -500);
  cam.beginHUD();
  hint(DISABLE_DEPTH_MASK);
  image(background, 0, 0, width, height);
  hint(ENABLE_DEPTH_MASK);
  textSize(30);
  text("TheJosefLife's Planet Simulation!", 50, 50);
  cam.endHUD();
  
  pushMatrix();
  translate(width/2, height/2, -300);  
  rotateX(0);
  
  pushMatrix(); //SUN
  rotateY(SPEED * PI * frameCount / 500);
  shape(sun);
  popMatrix();

  pushMatrix(); //MERCURY
  pointLight(255,  255,  255,  0,  0,  0);  
  rotateY(SPEED * PI * frameCount / (EARTH_SPEED / 4));
  translate(0, 0, 550);
  shape(mercury);  
  popMatrix();
  
  pushMatrix(); //VENUS
  pointLight(255,  255,  255,  0,  0,  0);
  rotateY(SPEED * PI * frameCount / (EARTH_SPEED / 2));
  translate(0, 0, 900);
  shape(venus);  
  popMatrix();

  pushMatrix(); //EARTH
  noLights();
  pointLight(255,  255,  255,  0,  0,  0);
  rotateY(SPEED * PI * frameCount / EARTH_SPEED);
  translate(0, 0, 1400);
  shape(earth);
  rotateY(SPEED * PI * frameCount / (EARTH_SPEED / 10));
  translate(0, 0, 140);
  shape(earthMoon);
  popMatrix();
  
  pushMatrix(); //MARS
  noLights();
  pointLight(255,  255,  255,  0,  0,  0);
  rotateY(SPEED * PI * frameCount / (EARTH_SPEED * 2));
  translate(0, 0, 2200);
  shape(mars);
  pushMatrix(); //MARS MOON 1
  rotateY(SPEED * PI * frameCount / (EARTH_SPEED / 10));
  translate(0, 0, 150);
  shape(marsMoon1);
  popMatrix();
  pushMatrix(); //MARS MOON 2
  rotateY(SPEED * PI * frameCount / (EARTH_SPEED / 20));
  translate(0, 0, 100);
  shape(marsMoon2);
  popMatrix();
  popMatrix();
  
  popMatrix();
  
}
