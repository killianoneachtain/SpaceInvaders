//-----------------------------------------------------//
// Space Invaders by Killian O'Neachtain 20023634      //
// Idea is based on Reas and Fry (2014) Pong Example   //
//-----------------------------------------------------//
// This is the Rocket class. It sets up a rocket that  //
// is used by our spaceship hero to defend the earth   //
// from an alien invasion.                             // 
//-----------------------------------------------------//

public class Rocket
{
  private float xCoord;           //x coordinate of rocket
  private float yCoord;           // y coordinate of rocket
  private float rocketSize;       // size of rocket
  private float speedY;           // speed of rocket 
  private boolean rocketCreated;  // boolean to check if bomb is created, this prevents the program checking for Mid-Air Collisions at the start of the program
    
  // Getter methods
   public float getXCoord()
   {
     return xCoord;
   }
    
   public float getYCoord()
   {
     return yCoord;
   }
    
   public float getRocketSize()
   {
     return rocketSize;
   }
    
   public float getSpeedY()
   {
     return speedY;
   }
    
   public boolean getRocketCreated()
   {
      return rocketCreated;
   }
  
  // Setter methods
   public void setXCoord(float xCoord)
   {
     this.xCoord = xCoord;
   } 
   
   public void setYCoord(float yCoord)
   {
      this.yCoord = yCoord;
   }
   
   public void setRocketSize(float rocketSize)
   {
      this.rocketSize = rocketSize;
   }
    
   public void setSpeedY(float speedY)
   {
      this.speedY = speedY;
   }
    
   public void setRocketCreated(boolean rocketCreated)
   {
      this.rocketCreated = rocketCreated;
   }
  
  // This is the default constructor
  public Rocket()
  {
  }
  
  // Constructor to set up a rocket, including it's size and speed.
  public Rocket(float xCoord, float yCoord, float rocketSize, float speedY, boolean rocketCreated)
  {
    setXCoord(xCoord);
    setYCoord(yCoord);
    setRocketSize(rocketSize);
    setSpeedY(speedY);
    setRocketCreated(rocketCreated);
  }
  
  // Draws the rocket in the display window
  public void display()
  {
    fill(12,35,199);
    noStroke();
    rect(xCoord,yCoord,10,-(rocketSize)); // used negative here to show the rocket firing from the ships nose
    
  }
  
  // Change rocket position.
  public void update()
  {
    yCoord = yCoord - speedY; // THe rocket will be moving up the display window   
  }
  
  private void resetRocket()
  {
    xCoord = 0;
    yCoord = 0;
    rocketSize = 0;
    speedY = 0;
    rocketCreated = false;
  }
}
