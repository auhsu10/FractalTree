private double fractionLength = 0.8;
private int smallestBranch = 10;
private double branchAngle = 0.2;
private int colormode = 0;

public void setup(){   
  size(800,600);    
  noLoop(); 
} 

public void draw(){   
  background(0);
  noStroke();
  fill(30,120,20);
  rect(0,550,800,50);
  stroke(0,255,0);
  line(200,550,200,480);
  line(600,550,600,480);
  line(400,550,400,450);
  drawBranches(200,480,60,3*Math.PI/2);
  drawBranches(600,480,60,3*Math.PI/2);
  drawBranches(400,450,86,3*Math.PI/2);
} 

public void drawBranches(int x,int y, double branchLength, double angle){   
  double angle1=angle-branchAngle;
  double angle2=angle+branchAngle;
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  if(colormode==0)
    stroke((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
  else if(colormode==1)
    stroke(mouseX,mouseY,(int)(Math.random()*150)+105);
  line(x,y,endX1,endY1);
  line(x,y,endX2,endY2);
  if(branchLength>smallestBranch){
    drawBranches(endX1,endY1,branchLength*fractionLength,angle1);
    drawBranches(endX2,endY2,branchLength*fractionLength,angle2);
  }
}

public void keyPressed(){
  if(key=='r' && colormode==0){
    colormode=1;
    redraw();
  }
  else if(key=='r' && colormode==1){
    colormode=0;
    redraw();
  }
}
