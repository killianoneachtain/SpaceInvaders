//-----------------------------------------------------//
// Space Invaders by Killian O'Neachtain 20023634      //
// Idea is based on Reas and Fry (2014) Pong Example   //
//-----------------------------------------------------//
// This is the Spaceship class. It sets up a ship that //
// is used by our hero to defend the earth  from an    //
// alien invasion.                                     // 
//-----------------------------------------------------//


public class Spaceship
{
  private float xCoord;           // x coordinate of the ship
  private float yCoord;           // y Coordinate of the ship
  private float shipHeight;       // height of the ship
  private float shipWidth;        // width of the ship
  private int numberOfLaunchers;  // nunmber of rocket launchers on ship
  
  // Getter methods
  public float getXCoord()
  {
    return xCoord;
  }
  
  public float getYCoord()
  {
    return yCoord;
  }
  
  public float getShipHeight()
  {
    return shipHeight;
  }
  
  public float getShipWidth()
  {
    return shipWidth;
  }
  
  public int getNumberOfLaunchers()
  {
    return numberOfLaunchers;
  }
  
  // Setter methods
  public void setShipHeight(float shipHeight)
  {
    // the ship height must be between
    if ((shipHeight >=20) && (shipHeight <= 25))
      {
        this.shipHeight = shipHeight;
      }
    else
      {
        this.shipHeight = 25;
      }
  }
    
  public void setShipWidth(float shipWidth)
  {
    // the ship width must be between 100 and 120
    if((shipWidth >= 100) && (shipWidth <= 120))
      {
        this.shipWidth = shipWidth;
      }
    else
      {
        // if an invalid parameter is passed, then a default value of 100 is imposed.
        this.shipWidth = 100;
      }
  }
  
  public void setNumberOfLaunchers(int numberOfLaunchers)
  {
    this.numberOfLaunchers = numberOfLaunchers;
  }
  
  
 
  
  // This is the default Constructor
  public Spaceship()
  {
  }
  
  // This will set up the spacewhip with width and height as parameters. 
  // It stays static along a y value line, with the x values changing from the mouse input.
  public Spaceship(float shipWidth, float shipHeight)
    {
      setShipWidth(shipWidth);
      setShipHeight(shipHeight);
      
      yCoord = height - (10 + shipHeight);
      
      xCoord = mouseX;
    }
    
  public Spaceship(float shipWidth, float shipHeight, int numberOfLaunchers)
    {
       setShipWidth(shipWidth);
       setShipHeight(shipHeight);
        
       yCoord = height - (10 + shipHeight);
        
       xCoord = mouseX;
       
       setNumberOfLaunchers(numberOfLaunchers);
    }
  
  // Draws the spaceship in the display window.
  public void display()
  {
    fill(10,125,65);
    noStroke();
    drawSpaceship();
  }
  
  // Changes the spaceship position. It has the left and right side of the display window +-10 as delimiters. 
  // This stops it from leaving the display window, and leaving the earth exposed to aliens.
  public void update()
  {
    xCoord = mouseX;
    
    if (xCoord < 10)
    {
      xCoord = 10;
    }
    
    if (xCoord > (width - shipWidth - 10))
    {
      xCoord = width - shipWidth - 10;
    }
  }
  
  // This method constructs the spaceship to save the world from destruction.  
  private void drawSpaceship()
  {
    if (livesLost == maxLivesPerGame -1)
    { 
      fill(numberOfBombs*2,125,numberOfBombs*2);
    }
    else
    {
      fill(125,numberOfBombs*2,numberOfBombs*2);
    }
    
    noStroke();
    rect(xCoord,yCoord+15,100,10); // Base
    
    fill(200,numberOfBombs*2,numberOfBombs*2);
    
    rect(xCoord,yCoord+10,20,5); // left wing #1
    rect(xCoord+(shipWidth-20),yCoord+10,20,5); //right wing #1
    
    fill(240,numberOfBombs*2,numberOfBombs*2);
    rect(xCoord,yCoord+5,10,5); // left wing #2
    rect(xCoord +(shipWidth-10),yCoord+5,10,5); // right wing #2
    
    fill(200,numberOfBombs*8,numberOfBombs*8);
    rect(xCoord+(shipWidth/2-5),yCoord,10,15); // center column/nose with canon
  }

}
