class Ball{
  private int x,y;
  private float b_h;
  private PImage img;
  private float r;
  boolean flag=false;
  
  Ball(float _h){
    x=-50;
    y=(int)random(180,height-180);
    r=random(-50,50);
    //b_h=60*random(0,6);
    b_h=_h;
    img=loadImage("balls.png");
  }
  
  protected void update(){
    x+=10;
    if(x>(displayWidth+10)){
      flag=true;
    }
  }
  
  protected void b_draw(){
    pushMatrix();
    //fill(b_h,100,100,40);
    //ellipse(x,y,100,100);
    translate(x,y);
    //scale(0.5);
    tint(b_h+r,100,100,40);
    image(img,0,0);
    popMatrix();
  }
  
  protected boolean B_flag(){
    return flag;
  }
  
}
