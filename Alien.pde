//-----------------------------------------------------//
// Space Invaders by Killian O'Neachtain 20023634      //
// Idea is based on Reas and Fry (2014) Pong Example   //
//-----------------------------------------------------//
// This is the Alien class. It sets up an alien that   //
// will try to take over the world!                    //
//-----------------------------------------------------//


public class Alien

{  
  private float xCoord;            // x coord of the alien
  private float yCoord;            // y coord of the alien
  private boolean alienDestroyed;   // boolean condition to see if alien is destroyed
  private float speedX;            // speed of alien towards the earth
  private boolean alienAttacker = false;
  private int colour = 100;
  private int hitCount;
  private int alienLives;
     
// Getter methods
  public float getXCoord()
  {
    return xCoord;
  }
  
  public float getYCoord()
  {
    return yCoord;
  }
  
  public boolean getAlienDestroyed()
  {
    return alienDestroyed;
  }
  
  public float getSpeedX()
  {
    return speedX;
  }
  
   public boolean getAlienAttacker()
  {
    return alienAttacker;
  }
  
  public int getColour()
  {
    return colour;
  }
  
  public int getHitCount()
  {
    return hitCount;
  }
  
  public float getAlienWidth()
  // this returns the width of the alienn image inside the 50x50 size of the alien construction
  {
    return 44;
  }
  
  public float getAlienHeight()
  // this returns the height of the alien image inside the 50x50 size of the alien construction
  {
    return 40;
  }
    
  public int getAlienLives()
  {
    return alienLives;
  }
  
  // setter methods  
   public void setXCoord(float xCoord)
  {
    this.xCoord = xCoord;
  }
  
  public void setYCoord(float yCoord)
  {
    this.yCoord = yCoord;
  }
  
  public void setAlienDestroyed(boolean alienDestroyed)
  {
    this.alienDestroyed = alienDestroyed;
  }
  
  public void setSpeedX(float speedX)
  {
    this.speedX = speedX;
  }
  
   public void setAlienAttacker(boolean alienAttacker)
  {
    this.alienAttacker = alienAttacker;
  }
  
  public void setColour (int colour)
  {
    this.colour = colour;
  }
  
  public void setHitCount(int hitCount)
  {
    this.hitCount = hitCount;
  }
  
  public void setAlienLives(int alienLives)
  {
    this.alienLives = alienLives;
  }
  
  
  // constructor methods
  
  // this is the default constructor
  public Alien()
  {
  }
      
  // this contructor is to set up the alien and its speed
  public Alien(float xCoord, float yCoord,float speedX)
  {
    setYCoord(yCoord);
    setXCoord(xCoord);
    setSpeedX(speedX);
  }
    
  // this contructor is to set up the alien, its speed, and the amount of lives it has
  public Alien(float xCoord, float yCoord,float speedX, int alienLives)
  {
    setYCoord(yCoord);
    setXCoord(xCoord);
    setSpeedX(speedX);
    setAlienLives(alienLives);
  }
  
  // Draw the alien in the display window using a method for drawing the shape
  public void display()
  {
    fill(255);
    noStroke();
    drawAlien(xCoord, yCoord);
  }
  
  // This method draws the alien in 50x50 box. The alien doesn't fill the entire 50x50
  // box, and this is reflected in the getter methods.
  private void drawAlien(float xCoord, float yCoord)
  {
     fill(255);
          
     if (hitCount == alienLives-1)
     // this fill colour of red indiactes to the player that the alien has only 1 life left
     {
       fill(200,30,25);
     }
     else
     {
     fill((hitCount+1), 255/(alienLives+1)*(hitCount+1) % 255,(hitCount+1));
     }
     rect(xCoord+5,yCoord+5,5,5);      // left ear
     rect(xCoord+10,yCoord+10,30,23);  //body
     rect(xCoord+40,yCoord+5,5,5);     // right ear
     rect(xCoord+7,yCoord+33,5,9);     // left leg long
      
     rect(xCoord+3,yCoord+38,5,7);     // left leg short
     rect(xCoord+42,yCoord+38,5,7);    // right leg short
      
     rect(xCoord+38,yCoord+33,5,9);    // right leg long
      
     fill(125,125,125);
     rect(xCoord+15,yCoord+15,5,4);    // left eye
     rect(xCoord+30,yCoord+15,5,4);    // right eye
     rect(xCoord+15,yCoord+24,20,6);   // mouth
  }
  
  // Change alien position. If the alien reaches the side of the display window
  // then it drops down on the next line of movement, and reverses direction.
  // If it gets down to the line of the spaceship, then a life is lost.
  public void update()
  {
    // updates the x coordinates so the alien travels across the display window
    xCoord = xCoord + speedX;
    
    // if the alien reaches the left or right of the display window
    // the alien drops down by 50 and changes direction. It will also
    // create a new array of random drop points for the Bomb objects. 
    if((xCoord <= 10) || xCoord >= (width - 60))
    {
      yCoord = yCoord + 50; 
      speedX = speedX * -1;
      fillArray();     
    }
        
    // if the alien reaches the end of spaceship line, then a life is lost
    if((yCoord >= (height - spaceship.shipHeight - 100) && (alienDestroyed == false))) 
    {
      player.addScore(score);
      gameOver();     
    }
    
  }   
}
