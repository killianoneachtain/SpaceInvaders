//************************************************************************************************//
// SPACE INVADERS by Killian O'Neachtain 20023634                                                 //
// Idea is based on Pong by Reas and Fry (2014) example                                           //
//************************************************************************************************//
// EXISTING FUNCTIONALITY:                                                                        //
// The Alien class for the Space Invaders game is written. An alien object is created. The draw() //
// method continually updates the alien's position and re-displays it.                            //
//                                                                                                //
// The Spaceship class is written. A spaceship object is created. The draw() method continually   //
// updates the ship's position based on the cursor location and re-displays it.                   //
//                                                                                                //
// The Bomb class is written. An object array of bombs is created. A primitive array of           //
// x-coordinates is randomly generated for each alien 'line', and when the alien passes these     //
// a bomb is dropped by the alien. The draw() method continually updates each bomb's position and //
// re-displays it. The collision detection method can tell if the bomb has hit the ship. The bomb //
// will remove one life from the player, if it hits the spaceship.                                //
//                                                                                                //
// The Rocket class is written. An object array of rockets is created. The rockets are displayed  //
// when the use clicks a mouse or spacebar key. The x-value is taken at the time the key/mouse is //
// released. The explosion detection method can tell if a rocket has hit an alien. The alien has  //
// can abosrb 5 impacts before it is destroyed. If it is destroyed, then game over, end the       //
// program.                                                                                       //
//                                                                                                //
// The Player class is written. This allows us to store the player name and the score for each    //
// game in the tournament.                                                                        //
//                                                                                                //
// The Rocket display is full functioning so that there are only 5 rockets allowed on screen at   //
// any time, and there is a primitive array created to hold the index of the free object indexes  //
// in the rockets Object array.                                                                   //
//                                                                                                //
// Collisions of the rockets and the bombs will be dealt with here, and the two will cancel each  //
// other out and the two will be destroyed.                                                       //
//                                                                                                //
// An object array of Aliens is created. These start as a shade of green and get brighter on each //
// hit. When there is only one alien life left, it turns RED.                                     //
//                                                                                                //
// Once the lives lost of the alien equals the hit count, the alien is destroyed and no longer    //
// seen or is active in the display window for the current level/game. Once the aliens reach the  //
// bottom of the screen or all the aliens are destroyed, GAME OVER.                               //
//                                                                                                //
// The bombs behave similar to the rockets with a set amount of bombs allowed to be on screen at  //
// the same time. There is an  array created that is expanded()ed and shorten()ed to allow        //
// index numbers of destroyed bombs be re-used.                                                   //
//                                                                                                //
// Take in the amounts of bombs allowed to drop from the user.                                    //
//                                                                                                //
// Display how many bombs were hit, number of aliens destroyed and final score at end of game.    //
//                                                                                                //
//************************************************************************************************//


import javax.swing.*;

Alien[] aliens;        // an array of Alien objects
Bomb[] bombs;          // an array of Bomb objects 
Spaceship spaceship;   // an instance of Spaceship class
Rocket[] rockets;      // an array of Rocket objects
Player player;         // an instance of Player class

int bombX;             // To hold the int values of the bomb drop x-coordinates
int bombY;             // To hold the int values of the bomb drop y-coordinates

int rocketAmount;

int[] freeRockets;     // Primitive array to hold the index number of the available indices to fire a new rocket

int[] freeBombs;       // Primitive array to hold the index number of the available indices to drop a new bomb

int aliensDestroyed;   // Global variable to hold the amounts of aliens destroyed in the level

// Gameplay global variables to control and keep score of the game.
int livesLost = 0;
int score = 0;
int maxLivesPerGame = 3;

int numberOfBombs;    // number of bombs per allowed on screen changed by user input

int[] dropPoints; // declares up an array of dropPoints to conatain x coordinate values for the alien to drop bombs

//-----------------------------------------------------------------------------------------------------------------------------------------------

void setup()
{
  size(800,800);
  noCursor();
  
  // Sets object of type spaceship.
  spaceship = new Spaceship(100,25);
    
  // The try/catch scenarios are there to catch any erroneous input, e.g. a character input for number of bombs. If there is an error
  // in the first 'try' statements, then the 'catch' statements are executed, as well as an Error dialg box displayed to the user.
  try
  {
    player = new Player(JOptionPane.showInputDialog("Hello and Welcome to You Chance to Save the Earth from Aliens!!\n\nPlease Enter Your Name (min 6 chars): ","Buzz Lightyear"));
  } catch(StringIndexOutOfBoundsException e)
    {
      // If the first name entered is less than 6 characters this will lead to a error as shown above in the catch statement
      // An Error message is displayed to the user and another dialog box is displayed to take in an acceptable length name into the player String.
      // The player constructor is used with the input value of name from the user, and number of games from the user.
      JOptionPane.showMessageDialog(
         null, "ErrorMsg\n Please enter a Name of least 6 Characters!!!", "Failure", JOptionPane.ERROR_MESSAGE);     
      player = new Player(JOptionPane.showInputDialog("Enter the player name (min 6 chars): ","Buck Rogers"));
    }
       
  try
   // Asks the usere how many bombs the aliens have, and if a character is entered, a error message is displayed and asks the question again
  {
     numberOfBombs = Integer.parseInt(JOptionPane.showInputDialog("How many bombs would you like the Aliens to drop? : ","6"));
  } catch(NumberFormatException e)
   {
     JOptionPane.showMessageDialog(
         null, "ErrorMsg\n A character was Entered!! \n\nPlease enter a NUMBER (0 - 15)!!!", "Failure", JOptionPane.ERROR_MESSAGE); 
      numberOfBombs = Integer.parseInt(JOptionPane.showInputDialog("How many bombs would you like the Aliens to drop? : ","6"));
   }
   
   if(numberOfBombs >= 15)
   {
     JOptionPane.showMessageDialog(
         null, "ErrorMsg\n You do not have JEDI reflexes!!! \n\nPlease enter a NUMBER (0 - 15 )!!!", "Failure", JOptionPane.ERROR_MESSAGE);
      numberOfBombs = Integer.parseInt(JOptionPane.showInputDialog("How many bombs would you like the Aliens to drop? : ","6"));;
   }
      
  if(numberOfBombs == 0)
    {
      JOptionPane.showMessageDialog(null, "So, YOU " + player.getPlayerName() + ", want to shoot fish in a barrel? Please go ahead! ", "Failure", JOptionPane.ERROR_MESSAGE);
    }
    
  dropPoints  = new int[numberOfBombs]; // sets the number of drop points to number of bombs

  aliensDestroyed = 0;   // Initialise the amount of aliens destroyed to 0
  
  // Initialises all the objects in the Alien Object array 
  // and sets out the gaps between aliens, and initialises the lives for the aliens to 3 and set destroyed to false
  aliens = new Alien[8];
  
  for (int i=0; i < aliens.length; i++)
  {
    int alienGap = 10;
    aliens[i] = new Alien(alienGap+(50*i),50,2,3);
    aliens[i].setAlienDestroyed(false);
    aliens[i].setHitCount(0);
  }
   
  // This array creates random indices for the aliens Object Array to be 'attacker' aliens
  // These aliens will drop the bombs, while the others will not.
  alienAttackArray();
    
  // Initialises the amount of rockets that the ship can fire to the users input. Initialises the rockets to default values. 
  try
  {
    rocketAmount = Integer.parseInt(JOptionPane.showInputDialog("Please enter the number of rocket launchers you would like to have on your ship : \n\n(Hit the Spacebar to Launch Rockets)","3"));
  } catch(NumberFormatException e)
     {
       JOptionPane.showMessageDialog(
           null, "ErrorMsg\n Please enter a NUMBER!!!", "Failure", JOptionPane.ERROR_MESSAGE);
       rocketAmount = Integer.parseInt(JOptionPane.showInputDialog("Please enter the number of rocket launchers you would like to have on your ship : \n\n(Hit the Spacebar to Launch Rockets)","3"));          
     }
     
   if(rocketAmount == 0)
     {
       JOptionPane.showMessageDialog(null, "So, YOU " + player.getPlayerName() + ", don't want to save the Earth!! \n\n Enjoy being ruled by ZURG! ", "Failure", JOptionPane.ERROR_MESSAGE);
        exit();
      }
         
   if(rocketAmount > 5)
   {
     JOptionPane.showMessageDialog(
         null, "ErrorMsg\n You can't Handle that amount of Rockets, ROOKIE!!! \n\nPlease enter a NUMBER (1 - 5)!!!", "Failure", JOptionPane.ERROR_MESSAGE);
     rocketAmount = Integer.parseInt(JOptionPane.showInputDialog("Please enter the number of rocket launchers you would like to have on your ship : ","3"));
   }
  
  // This creats an object array using the length inputted from the user and initialises the rockets to the default value
  
   
  rockets = new Rocket[rocketAmount];
  for (int i = 0;i < rockets.length ; i++)
  {
    rockets[i] = new Rocket();
    rockets[i].setRocketCreated(false);
  }
  
  // This creates the primitive array to hold the indices of the free Rockets available, and initialises the values from 0 to 
  // the length of the Rocket array.
  freeRockets = new int[rockets.length];
  
  for(int i=0;i < freeRockets.length;i++)
    {
      freeRockets[i] = i;
    } 
    
  // Fill the array with the x-coordinate drop points for the bombs.
  fillArray(); 
  
  // Creates an object array of type Bomb. The size of the array is determined by the amount of bombs on each trigger line.
  bombs = new Bomb[numberOfBombs];
  for(int i=0;i<bombs.length;i++)
  {
    bombs[i] = new Bomb(); //initialises object of type bomb to the default constructor
    bombs[i].setBombSize(2);
    bombs[i].setBombCreated(false);  
  }
  
  // This creates the primitive array to hold the indices of the free Bombs available, and initialises the values from 0 to 
  // the length of the bomb array.
  freeBombs = new int[bombs.length];
  
  for(int i=0;i <freeBombs.length;i++)
    {
      freeBombs[i] = i;
    } 
}
//-----------------------------------------------------------------------------------------------------------------------------------------------

void draw()
{
  background(0);
  
  gamePlayerDisplay();
   
  for(int i=0;i<aliens.length;i++)
    {
      aliens[i].update();
      aliens[i].display();
      
      if(aliens[i].getAlienAttacker() == true)
      {
        for(int k=0;k < dropPoints.length;k++)
          {
           if((dropPoints[k]+1 >= aliens[i].xCoord) && (dropPoints[k]-1<=aliens[i].xCoord)) 
           //As the speed is a factor here we have some discretion for exact co-ordinate matching
           // If the x-coordinate is between +-1 to drop point then we drop a bomb
           {
             bombX = int(aliens[i].xCoord)+ 25;
             bombY = int(aliens[i].yCoord)+ 50;
             
             if(freeBombs.length == 0)
             {      
              }
              else
              {
                bombs[freeBombs[freeBombs.length-1]] = new Bomb(bombX,bombY,10,2,true);
                freeBombs = shorten(freeBombs); 
              }
            }
          }
       }
     }
 
for(int i=0;i < bombs.length;i++)
  {
    bombs[i].update();
    bombs[i].display();
    
    // If the bomb leaves the end of the display screen, the index is added to the free bombs array
    if(bombs[i].getYCoord() + bombs[i].getBombSize() > height)
      {
        bombs[i].resetBomb();
        freeBombs = expand(freeBombs, freeBombs.length+1);
        freeBombs[freeBombs.length-1] = i;
      }
      
    boolean collision = hitSpaceship(bombs[i], spaceship);
    if (collision == true)
    {
        livesLost++;
        if(livesLost == maxLivesPerGame)
        {
          player.addScore(score);
          gameOver();
        }
        bombs[i].resetBomb();
        freeBombs = expand(freeBombs, freeBombs.length+1);
        freeBombs[freeBombs.length-1] = i;
    }
  } 

  spaceship.update();
  spaceship.display();
  
  for (int i=0; i< rockets.length;i++)
  {
    rockets[i].update();
    rockets[i].display();
    
    if(rockets[i].getYCoord() + rockets[i].getRocketSize() < 0)
      {
        rockets[i].resetRocket();
        freeRockets = expand(freeRockets, freeRockets.length+1);
        freeRockets[freeRockets.length-1] = i;
      }
    
    for (int j=0; j < bombs.length;j++)
    {
      if((rockets[i].rocketCreated == true) || (bombs[j].bombCreated == true))
      {
        boolean midAirCollision = rocketHitsBomb(rockets[i], bombs[j]);
        
        if (midAirCollision == true)
        {
          textSize(32);
          text("20",bombs[j].getXCoord(),bombs[j].getYCoord());
          score+=20;
          player.addBombsHit(1);
          bombs[j].resetBomb();
          freeBombs = expand(freeBombs,freeBombs.length+1);
          freeBombs[freeBombs.length-1] = j;
         
          rockets[i].resetRocket();
          freeRockets = expand(freeRockets,freeRockets.length+1);
          freeRockets[freeRockets.length-1] = i;
        }
    }
    
    for(int k = 0; k<aliens.length;k++)
    {
      boolean explosion = hitAlien(aliens[k], rockets[i]); // checks current rocket against all aliens for collision
      
      if (explosion == true)
      // if rocket hits alien then add to score, expand freeRockets array by 1, put free rocket index in the  freeRockets array
      // increment the green shading of the alien, increase the alien hit count by 1, if alien is detroyed increase alienDestroyed count
       {
         if(aliens[k].getAlienDestroyed() == true)
         {}
         else
         {
            score +=200;
            
            rockets[i].resetRocket();
            freeRockets = expand(freeRockets, freeRockets.length+1);
            freeRockets[freeRockets.length-1] = i;
            
            aliens[k].setColour((rocketAmount*25) % 255);
            aliens[k].setHitCount((aliens[k].getHitCount()+1));
          
              if(aliens[k].getHitCount() == aliens[k].getAlienLives())
                {
                  aliensDestroyed++; 
                  player.addAliensDestroyed(1);
                  
                  if(aliensDestroyed == aliens.length)
                    {
                      player.addScore(score);
                      gameOver();                     
                    }
      
                  aliens[k]= new Alien();
                  aliens[k].setAlienDestroyed(true);
                  
                }
          }
        } 
      }
    }
  }            
}

void fillArray()
{
  for(int i=0;i < dropPoints.length;i++)
  {
    float f = random(10,width-10);
    int k = int(f);
    dropPoints[i] = k;
  }
}

void alienAttackArray()
{
  int[] attackerIndex = new int[aliens.length/2];
  for (int k=0; k< attackerIndex.length;k++)
  {
    float f = random(0,(aliens.length));
    int g = int(f);
    attackerIndex[k] = g;
  }
  
  for (int h = 0;h < attackerIndex.length;h++)
  {
    aliens[attackerIndex[h]].setAlienAttacker(true);
  }
}

 
 // method returns true if the bomb and spaceship overlap false otherwise
 boolean hitSpaceship(Bomb bomb, Spaceship spaceship)
 {
   float bombDistanceX = abs(bomb.getXCoord() - spaceship.getXCoord() - spaceship.getShipWidth()/2);
   float bombDistanceY = abs (bomb.getYCoord() - spaceship.getYCoord() - spaceship.getShipHeight()/2);
   
   if(bombDistanceX > (spaceship.getShipWidth()/2 + bomb.bombSize/2))
   {
     return false;
   }
   
   if (bombDistanceY > (spaceship.getShipHeight()/2) + bomb.bombSize/2)
   {
     return false;
   }
   
   if(bombDistanceX <= (spaceship.getShipWidth()/2))
   {
     return true;
   }
   
   if(bombDistanceY <= (spaceship.getShipHeight()/2))
   {
     return true;
   }
   
   // Pythagoras Theorem (a2 + b2 = c2) 
   float cornerDistance = pow(bombDistanceX - spaceship.getShipWidth()/2, 2) +
                          pow(bombDistanceY - spaceship.getShipHeight()/2, 2);
                          
   if (cornerDistance <= pow(bomb.bombSize/2, 2))
   {
     return true;
   }
   else
   {   
     return false;
   }
 }
 
 
boolean hitAlien(Alien alien, Rocket rocket)
 {
   float rocketDistanceX = abs(rocket.getXCoord() - alien.getXCoord() - alien.getAlienWidth()/2);
   float rocketDistanceY = abs (rocket.getYCoord() - alien.getYCoord() - alien.getAlienHeight()/2);
   
   if(rocketDistanceX > (alien.getAlienWidth()/2 + rocket.rocketSize/2))
   {
     return false;
   }
   
   if (rocketDistanceY > (alien.getAlienHeight()/2) + rocket.rocketSize/2)
   {
     return false;
   }
   
   if(rocketDistanceX <= (alien.getAlienWidth()/2))
   {
     return true;
   }
   
   if(rocketDistanceY <= (alien.getAlienHeight()/2))
   {
     return true;
   }
   
   // Pythagoras Theorem (a2 + b2 = c2) 
   float cornerDistance = pow(rocketDistanceX - alien.getAlienWidth()/2, 2) +
                          pow(rocketDistanceY - alien.getAlienHeight()/2, 2);
                          
   if (cornerDistance <= pow(rocket.rocketSize/2, 2))
   {
     return true;
   }
   else
   {   
     return false;
   }
 }
 
boolean rocketHitsBomb(Rocket rocket, Bomb bomb)
 {
   float bombDistanceX = abs(bomb.getXCoord() - rocket.getXCoord() - rocket.getRocketSize()/2);
   float bombDistanceY = abs (bomb.getYCoord() - rocket.getYCoord() - rocket.getRocketSize()/2);
   
   if(bombDistanceX > (bomb.getBombSize()/2 + rocket.rocketSize/2))
   {
     return false;
   }
   
   if (bombDistanceY > (bomb.getBombSize()/2) + rocket.rocketSize/2)
   {
     return false;
   }
   
   if(bombDistanceX <= (rocket.getRocketSize()/2))
   {
     return true;
     
   }
   
   if(bombDistanceY <= (rocket.getRocketSize()/2))
   {
      return true;
   }
   
   // Pythagoras Theorem (a2 + b2 = c2) 
   float cornerDistance = pow(bombDistanceX - rocket.getRocketSize()/2, 2) +
                          pow(bombDistanceY - rocket.getRocketSize()/2, 2);
                          
   if (cornerDistance <= pow(bomb.bombSize/2, 2))
   {
      return true;
   }
   else
   {   
     return false;
   }
 }

                                                          
                                                          
// This method only is activated after any of the Spacebar is pressed.
// it creates a new rocket and puts it into the rockets array.


void keyPressed()
{
  // Press Spacebar(unicode displayed below) from the keyboard can be used to fire rockets from the spaceship
  if (key == '\u0020')
  {
    if((freeRockets.length == 0))
    // If the maximum number of rockets are in the air, pressing space will perform no task
    {      
    }
    else
    // else a rocket with be launched using the index of the last destroyed rocket. Then it will shorten the length of the free rockets array.
    {
      rockets[freeRockets[freeRockets.length-1]] = new Rocket((spaceship.getXCoord()+(spaceship.getShipWidth()/2)-5),spaceship.getYCoord(),10,3, true);
      freeRockets = shorten(freeRockets);       
    }
   }
}
 
// Point scoring and game display methods during gameplay
void gamePlayerDisplay()
{
   showScore(); //Displays player score, lives and games 
   showLives();
   showName();
}

 void showScore()
{
  fill(200,10,10);
  textSize(16);
  text("Score : ",30,20); // Shows player's score in top left of window
  text(score,100,20);
}

void showLives()
{
  fill(125);
  textSize(16);
  text("Lives : ",180,20); // Shows how many lives are left in display area 
  text((maxLivesPerGame - livesLost),230,20);
}

void showName()
{  
  fill(125);
  textSize(16);
  text("Player Name : ",550,20);
  text(player.getPlayerName(),700,20);
}

void resetGame()
{
  livesLost = 0;
  score = 0;
}

void gameOver()
{
   JOptionPane.showMessageDialog(null, player.getPlayerName() + ", your Game is over! \n\n"  
                                 + "\n\n"                     + player.toString()
                                 + "\n\nPlease come back and play again in the future!");
   exit();            
}

/*void startNewLevel()
{
  reset Aliens with more lives
  make ship stronger more hit points
  more launchers
  score stays same
  lives lost go to zero
  reset bombs
  reset rockets
}*/
