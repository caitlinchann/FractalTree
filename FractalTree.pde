private double fractionLength = .7; 
private int smallestBranch = 5; 
private double branchAngle = .15;  
int growth = 0;
public void setup() 
{   
	size(640,480);    
	frameRate(3);
} 
public void draw() 
{   
	background(0);   
	stroke(168, 255, 165); 
  strokeWeight(2);
	line(320,480,320,380-growth);   
	drawBranches(320, 400-growth, growth, 3*Math.PI/2);
  growth = (int)(Math.abs(100*sin(frameCount)));
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1, angle2;
  angle1 = angle + branchAngle;
  angle2 = angle - branchAngle;
  
  branchLength = branchLength*fractionLength;
  
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);
  
  if(branchLength > smallestBranch){
    drawBranches(endX1, endY1, branchLength - 3, angle1 + PI/5);
    drawBranches(endX2, endY2, branchLength - 3, angle2 - PI/5);
  }
} 