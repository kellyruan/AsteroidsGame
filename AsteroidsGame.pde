SpaceShip bob = new SpaceShip();
Asteroid[] aSky = new Asteroid[(int)(Math.random()*8)+15];
Star[] sky = new Star[(int)(Math.random()*25)+75];
public void setup() 
{
  size(800,800);
  for(int i = 0; i<sky.length; i++)
  {
    sky[i] = new Star();
  }
  for(int i = 0; i<aSky.length; i++)
  {
    aSky[i] = new Asteroid();
  }
}
public void draw() 
{
  background(0);
  bob.show();
  bob.move();
  for (int i = 0; i<sky.length; i++)
  {
    sky[i].show();
  }
  for (int i = 0; i<aSky.length; i++)
  {
    aSky[i].show();
    aSky[i].move();
  }
}
public void keyPressed(){
  if (key == 'h') {
    bob.setDirectionX(0);
    bob.setDirectionY(0);
    bob.setX((int)(Math.random()*800));
    bob.setY((int)(Math.random()*800));
  }
  if (key == 'w') {
    bob.accelerate(.3);
  }
  if (key == 'a') {
    bob.rotate(-20);
  }
  if (key == 's') {
    bob.deaccelerate(.3);
  }
  if (key == 'd') {
    bob.rotate(20);
  }

}

class Star 
{
  private int mySX, mySY;
  public Star()
  {
    mySX=(int)(Math.random()*800);
    mySY=(int)(Math.random()*800);
  }
  public void show()
  {
    ellipse(mySX,mySY,1,1);
  }
}
class SpaceShip extends Floater  
{   
  public SpaceShip()
  {
    corners = 4;
    int[] xS = {-8,16,-8,-2};
    int[] yS = {-8,0,8,0};
    xCorners = xS;
    yCorners = yS;
    myColor = 255;
    myCenterX = 400;
    myCenterY = 400;
    myDirectionX = 2;
    myDirectionY = 3;
    myPointDirection = 10;
  }
  public void setX(int x){myCenterX=x;}  
  public int getX(){return (int)myCenterX;}   
  public void setY(int y){myCenterY=y;}   
  public int getY(){return (int)myCenterY;}   
  public void setDirectionX(double x){myDirectionX=x;}   
  public double getDirectionX(){return myDirectionX;} 
  public void setDirectionY(double y){myDirectionY=y;}     
  public double getDirectionY(){return myDirectionY;}   
  public void setPointDirection(int degrees){myPointDirection=degrees;}   
  public double getPointDirection(){return myPointDirection;} 
}
class Asteroid extends Floater
{
  private int rotSpeed;
  public Asteroid()
  {
    corners = 6;
    int[] xS = {-9,5,10,6,-9,-15};
    int[] yS = {-15,-15,0,17,20,0};
    xCorners = xS;
    yCorners = yS;
    myColor = 255;
    myCenterX = (int)(Math.random()*800);
    myCenterY = (int)(Math.random()*800);
    myDirectionX = Math.random()-.5;
    myDirectionY = Math.random()-.5;
    myPointDirection = (int)(Math.random()*360);
    rotSpeed = (int)(Math.random()*6)-3;
  }
  public void setX(int x){myCenterX=x;}  
  public int getX(){return (int)myCenterX;}   
  public void setY(int y){myCenterY=y;}   
  public int getY(){return (int)myCenterY;}   
  public void setDirectionX(double x){myDirectionX=x;}   
  public double getDirectionX(){return myDirectionX;} 
  public void setDirectionY(double y){myDirectionY=y;}     
  public double getDirectionY(){return myDirectionY;}   
  public void setPointDirection(int degrees){myPointDirection=degrees;}   
  public double getPointDirection(){return myPointDirection;} 
  public void move() 
  {
    rotate(rotSpeed);
    super.move();
  }
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void deaccelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX -= ((dAmount) * Math.cos(dRadians));    
    myDirectionY -= ((dAmount) * Math.sin(dRadians));       
  } 
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 
