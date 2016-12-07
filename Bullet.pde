class Bullet extends Floater
{
	public Bullet()
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
	    myPointDirection = 0;
	}
	public Bullet(SpaceShip theShip)
	{
		corners = 4;
	    int[] xS = {-8,16,-8,-2};
	    int[] yS = {-8,0,8,0};
	    xCorners = xS;
	    yCorners = yS;
	    myColor = 255;
	    myCenterX = theShip.getX();
	    myCenterY = theShip.getY();
	    myPointDirection = theShip.getPointDirection();
	    double dRadians = myPointDirection*(Math.PI/180);
	    myDirectionX = 5*Math.cos(dRadians) + theShip.getDirectionX();
	    myDirectionY = 5*Math.sin(dRadians) + theShip.getDirectionY();
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
	public void show()
	{
		ellipse((float)myCenterX,(float)myCenterY,5,5);
	}
	public void move ()  
	{            
	    myCenterX += myDirectionX;    
	    myCenterY += myDirectionY;     

    }   
}