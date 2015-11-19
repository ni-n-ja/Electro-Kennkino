PImage logo;
PImage mask;
int x=0;
int y=(int)random(100,height-100);
float h;
color c1,c2;
ArrayList<Ball> balls;
Ball ball;
int flag;

void setup(){
  //size(1280,1024);
  size(displayWidth,displayHeight);
  logo=loadImage("black2.png");
  mask=loadImage("haikei2.png");
  noStroke();
  smooth();
  c1=color(0,0,0,10);
  h=60*random(0,6);
  background(0);
  
  balls=new ArrayList<Ball>();
  balls.add(new Ball(h));
  flag=0;
}

void draw(){
  fill(c1);
  rect(0,0,width,height);
  
  colorMode(HSB,360,100,100,100);
  for(int i=0;i<balls.size()-1;i++){
    ball=balls.get(i);
    ball.update();
    ball.b_draw();
    if(ball.B_flag()){
      balls.remove(i);
    }
  }
  println(balls.size());
  
  colorMode(RGB,256);
  fill(0);
  pushMatrix();
  translate(width/2,height/2);
  scale(0.5);
  colorMode(HSB,360,100,100);
  tint(h,100,100);
  image(mask,-mask.width/2,-mask.height/2);
  colorMode(RGB,256);
  tint(255);
  image(logo,-logo.width/2,-logo.height/2);
  popMatrix();
  
  if(flag>300){
    flag=0;
  }
  if(h>=360){
    h=0.0;
  }
  
  h+=0.3;
  flag++;
  balls.add(new Ball(h));
  
}

void keyPressed(){
  balls.add(new Ball(h));
}
