//-----------------------------------------------------//
// Space Invaders by Killian O'Neachtain 20023634      //
// Idea is based on Reas and Fry (2014) Pong Example   //
//-----------------------------------------------------//
// This is the Bomb class. It sets up a bomb to be     //
// used by the aliens to destory the Spaceship and     //
// take over the World!                                //
//-----------------------------------------------------//

public class Bomb
{
  private int xCoord;   //x coordinate of bomb
  private int yCoord;   // y coordinate of bomb
  private int bombSize;  // size of bomb
  private int speedY;   // speed of bomb down the screen
  private boolean bombCreated; // boolean to check if bomb is created, this prevents the program checking for Mid-Air Collisions at the start of the program
  
  // Getter methods
  public int getXCoord()
    {
      return xCoord;
    }
    
  public int getYCoord()
    {
      return yCoord;
    }
    
  public int getBombSize()
    {
      return bombSize;
    }
    
  public int getSpeedY()
    {
      return speedY;
    }
  
  public boolean getBombCreated()
    {
      return bombCreated;
    }
  
  // Setter methods
  public void setXCoord(int xCoord)
    {
      this.xCoord = xCoord;
    } 
   
  public void setYCoord(int yCoord)
    {
      this.yCoord = yCoord;
    }
    
  public void setBombSize(int bombSize)
    {
      this.bombSize = bombSize;
    }  
   
  public void setSpeedY(int speedY)
    {
      this.speedY = speedY;
    }
    
  public void setBombCreated(boolean bombCreated)
    {
      this.bombCreated = bombCreated;
    }
  
  
  // Default constructor
  public Bomb()
  {
  }
  
  // This constructor sets up the bomb, its size and its speed
  public Bomb(int xCoord, int yCoord, int bombSize, int speedY, boolean bombCreated)
  {
    setXCoord(xCoord);
    setYCoord(yCoord);
    setBombSize(bombSize);
    setSpeedY(speedY);
    setBombCreated(bombCreated);
  }
  
  // Draw the bomb in the display window
  public void display()
  {
    fill(12,125,12);
    noStroke();
    circle(xCoord,yCoord,bombSize);    
  }
  
  // Changes the bomb position
  public void update()
  {
    yCoord = yCoord + speedY;     
  }
  
  private void resetBomb()
  {
    xCoord = 0;
    yCoord = 0;
    bombSize = 0;
    speedY = 0;
    bombCreated = false;
  }
    
}
