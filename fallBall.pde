final int FPS = 60;
final int SCREEN_WIDTH = 1024;
final int SCREEN_HEIGHT = 768;
final color BG_COLOR = color(20, 50, 90);
final int TEXT_COLOR = 200;
final int TEXT_SIZE = 36;
int ballLength = 15;
int ballInterval = 6;
float ballDiameter = SCREEN_WIDTH / ballLength - ballInterval;
float[] ballYArray = new float[ballLength];
float[] ballSpeedArray = new float[ballLength];
int ballStartYMin = -500;
int ballStartYMax = 0;
int ballSpeedMin = 5; //perFrame
int ballSpeedMax = 10; //perFrame

void settings() {
  size(SCREEN_WIDTH, SCREEN_HEIGHT);
}

void setup() {
  frameRate(FPS);
  for(int i=0; i<ballLength; i++) {
    initBall(i);
  }
}

void draw() {
  background(BG_COLOR);
  for(int i=0; i<ballLength; i++) drawBall(i);
  drawFPS();
}

void drawBall(int ballId) {
  float circleX = ballDiameter/2 + (ballDiameter+ballInterval)*ballId + ballInterval;
    float circleY = ballYArray[ballId];
    circle(circleX, circleY, ballDiameter);
    ballYArray[ballId] += ballSpeedArray[ballId] * 60 / FPS;

    if(ballYArray[ballId] > SCREEN_HEIGHT) initBall(ballId);
}

void initBall(int ballId) {
  ballYArray[ballId] = random(ballStartYMin, ballStartYMax);
  ballSpeedArray[ballId] = random(ballSpeedMin, ballSpeedMax);
}

void drawFPS() {
  fill(TEXT_COLOR);
  textSize(TEXT_SIZE);
  textAlign(LEFT, CENTER);
  text("FPS: " + frameRate, 20, height/2);
}
