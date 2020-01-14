/* Reflection

Name : Killian O'Neachtian

Student Number: 20023634

Link to Video:  https://youtu.be/IuqTJFqnj28


Part A - Mark (X /5)
-----------------------------

Includsion of completed Readme and Reflection, and Video 

<just a mark needed here>
5


Part B - Mark (X /5)
-----------------------------

Comments, indentation, naming, structure of code, etc.

<just a mark needed here>

4


Part C - Mark (X /5)
-----------------------------
Use of if and loop statements:

line 116 to validate number of bombs inputted from user is less than 16
line 123 if the number of bombs is entered is 0 a message is displayed
line 157 to validate rockets inputted from user
line 163 to validate rocket amount is under 5
line 223 to validate the alien is an attacker
line 227 to validate that the x-coordinate of the alien is +-1 to the bomb drop point
line 234 to validate that if there are no free bombs, do nothing else create a bomb and shorten the freeBombs array
line 253 to check if bomb goes off the screen, and if it does then lengthen the freeBombs array and assign the last number its own index
line 261 checks if the bomb and spaceship collided
line 264 if there are no more lives left then display scores and exit
line 283 if the rocket goes off the screen it adds to the freeRocket array and assigns the last entry as its index
line 292 checks if bombs or rockets were created, as initialising to 0 lead to errors as 0 values satisfied collision rules
line 296 checks for a mid air collision and acts if true
line 316 checks if rocket hits an alien
line 320 checks if the alien is destroyed and if it is does nothing, as there were bugs in code where this expanded the freeRockets array
line 322 the else part performs scoring, and exapanding of arrays
line 333 checks if the alien has any lives left and if not then destroys it
line 338 checks if the all aliens are destroyed and displays scores to screen and exit

Collision detection methods(these are all the same, but checking different entities):
Bomb Hit Spaceship
      line 388 checks distance between bomb and spaceship
      line 393 checks distance between bomb and spaceship
      line 398 checks if disatnce from origins is less than width
      line 403 checks if disatnce from origins is less than height
      line 412 checks if the square of the hypotenuse is greater than the sum of the square of the other two sides
      line 416 else if it is not it returns false
      
Rocket Hit Alien
      line 428 checks distance between rocket and alien
      line 433 checks distance between rocket and alien
      line 438 checks if disatnce from origins is less than width
      line 443 checks if disatnce from origins is less than height
      line 452 checks if the square of the hypotenuse is greater than the sum of the square of the other two sides
      line 456 else if it is not it returns false
      
Rocket Hits Bomb
      line 467 checks distance between bomb and rocket
      line 472 checks distance between bomb and rocket
      line 477 checks if disatnce from origins is less than width
      line 483 checks if disatnce from origins is less than height
      line 492 checks if the square of the hypotenuse is greater than the sum of the square of the other two sides
      line 496 else if it is not it returns false

line 511 checks if SPACE is pressed to trigger rockets launching adn manipulating the rockets
line 513 checks if there are free Rocket objects available to display on screen. If there are no free rockets, then pressing
the SPACE bar will perform no task. The else option means that there are free Objects of type rocket to be created and so
we create a rocket to be displayed on screen and launch it.

Alien
line 155 checks if alien is on last life and changes colour to red if so
line 191 to ensure aliens stay in the display window and reverse direction and create new drop points
line 199 to ensure when aliens reach the bottom of the display window,dispaly scores and game over 

Spaceship
line 49 to make sure ship height is between 20 and 25
line 62 to have constraints on shipWidth of betweeen 100 and 120 and set a default value of 100
line 124 ensures ship doesnt go left off-screen
line 129 ensures ship doesnt go right off-screen
line 138 if there is only one life left, the ships chassis turns green


for loops used on:
line 123 to draw aliens
line 164 to initialise Rocket array
line 174 to fill freeRockets array
line 184 to initialise Bomb array
line 196 to fill freeBombs array
line 209 to iterate through the aleins and display/update them on screen
line 216 to inerate through the drop points array and check it against the x-coordinate
line 238 to iterate through each bomb
line 264 to iterate through each rocket 
line 276 to iterate through each bomb from each rocket to check for mid-air collisions
line 295 to iterate through the aliens from each iteration of rocket to check for collision
line 331 to fill an array of drop points with random values to be used as x-coordinates
line 342 to build an array of numbers to be used as an index to attach aliens with 'attacker' tags
line 349 to assign a true value to the aliens who are attackers

use of try and catch loop on:
line 90 / line 93 to alert the user that minimum name entry is 6 characters
line 103 / line 106 to alert the user that an unexpected character was entered
line 

use of do while loop on:
line 90 to keep the program going (resetting)

5

Part D - Mark (x /5)
-----------------------------
Working game with inclusion of bespoke methods in the main sketch.

bespoke method:

line 330 to line 338 void fillArray() - random x-coordinates for drop points
line 340 to line 354 void alienAttackArray() - assign random aliens with 'attacker' status
line 358 to line 395 boolean hitSpaceship(Bomb bomb, Spaceship spaceship) - collision detection
line 398 - line 435 boolean hitAlien(Alien alien, Rocket rocket) - collision detection
line 437 - line 475 boolean rocketHitsBomb(Rocket rocket, Bomb bomb) - collision detection
line 508 - line 524 void keyPressed() - after spacebar is released a rocket is launched
line 527 - line 532 void gamePlayerDisplay() - to display the player details and information to the display window 
line 534 - line 539 void showScore() - to display the current score in the display window
line 541 - line 547 void showLives() - to display the current lives in the display window
line 563 - line 569 void showName() - to display the name of player in the display window



Part E1 - Mark (x /10)
-----------------------------
User-defined class with appropriate fields, constructors, getters, setters
There are 5 classes:
1. Alien
i.)Getter and setter methods for all:
   1. float xCoord;  
   Getter: Line 23
     Setter: Line 76
   2. float yCoord; 
   Getter: Line 28
     Setter: Line 81
   3. boolean alienDestroyed; 
   Getter: Line 33
     Setter: Line: 86
   4. float speedX;
   Getter: Line 38
     Setter: Line 91
   5. boolean alienAttacker = false;
   Getter: Line 43
     Setter: Line 96
   6. int colour = 100;
   Getter: Line 48
     Setter: Line 101
   7. int hitCount;
   Getter: Line 53
     Setter: Line 106
   8. int alienLives;
   Getter: Line 70
     Setter: Line 111
   
There are 2 getter methods for Height and Width that return set values
 float getAlienWidth()
 Getter: Line 58
  
 float getAlienHeight()
 Getter: Line 64
   
ii.) Concstructors
    1. Alien() - the default constructor with initialised values
    Line 120
    
    2. Alien(float xCoord, float yCoord,float speedX) - sets an alien and gives it
    origins and a speed
    line 125  
    
    3. Alien(float xCoord, float yCoord,float speedX, int alienLives)
    - This constructor sets the values for the parameters above
    Line 133
   
2. Bomb
i.)Getter and setter methods for all:
   1. int xCoord;   
   Getter: Line 19
     Setter: Line 45
   2. int yCoord;  
   Getter: Line 24
     Setter: Line 50
   3. int bombSize; 
   Getter: Line 29
     Setter: Line 55
   4. int speedY;  
   Getter: Line 34
     Setter: Line 60
   5. boolean bombCreated; 
   Getter: Line 39
     Setter: Line 65
   
   
ii.) Concstructors
    1. Bomb() - the default constructor with initialised values
    Line 72
    
    2. Bomb(int xCoord, int yCoord, int bombSize, int speedY, boolean bombCreated)
    - This constructor sets the values for the parameters above
    Line 77
    
3. Player
i.) Getter methods
   String playerName;
   Getter: Line 24
     Setter: Line 46 
     Mutator: Line 47
   int bombsHit;
     Mutator: Line 29 
   int numberAliensDestroyed;
     Mutator: Line 35 
   int score;
     Setter: Line 40 
   
ii.) Constructor
      1. Player(String playerName)
      Line 18




4. Rocket
i.)Getter and setter methods for all:
  1. float xCoord;
  Getter: Line 19
    Setter: Line 45
  2. float yCoord;
  Getter: Line 24
     Setter: Line 50
  3. float rocketSize;
  Getter: Line 29
     Setter: Line 55
  4. float sppedY; 
  Getter: Line 34
     Setter: Line 60  
  5. boolean rocketCreated;
  Getter: Line 39
     Setter: Line 65

ii.) Concstructors
    1. Rocket() - the default constructor with initialised values
    Line 71
    
    2. Rocket(float xCoord, float yCoord, float rocketSize, float speedY, boolean rocketCreated)
    - The contsructor sets the values for the parameters listed above
    Line 76
  

5. Spaceship
i.)Getter and setter methods for all:
     1. float xCoord;
     Getter: Line 20
       
     2. private float yCoord;
     Getter: Line 25
            
     3. private float shipHeight;
     Getter: Line 30
       Setter: Line 46
     4. private float shipWidth;
     Getter: Line 35
       Setter: Line 59
     5. private int numberOfLaunchers;
     Getter: Line 40
       Setter: Line 73
       
ii.) Concstructors
    1. Spaceship() - the default constructor with initialised values
    Line 82
    
    2. Spaceship(float shipWidth, float shipHeight, int numberOfLaunchers)
    - The contsructor sets the values for the parameters listed above
    Line 98
       
10


Part E2 - Mark (x /15)
-----------------------------

Class bespoke methods:

1. Alien

i.   void display() on line 142 to 147
ii.  void drawAlien() on line 151 to 178
iii. void update() on line 183 to 210

2. Bomb
i.   void display() on line 87 to 92
ii.  void update() on line 95 to 103
iii. void resetBomb() on line 105 to line 112

3. Player
i. String toString() on line 56 to 66 

4. Rocket
i.   void display() on line 76 to 83
ii.  void update() on line 95 to 103
iii. void resetRocket() on line 105 to 113

5. Spaceship
i.   void display() on line 111 to 116
ii.  void update() on line 120 to 133
iii. void drawSpaceship() on line 136 to 154

10



Part E3 - Mark (x /10)
-----------------------------

The user-defined class(es) are used in an appropriate manner

10



Part F1 - Mark (x /20)
-----------------------------
- Use of a data structure to store information i.e. array

There are two types of arrays:
1. Primitive Arrays:
    i.   freeRockets
           declared on line 61
           initialized on lines 174 -177
           used on lines 272, 273, 290, 291, 303, 304, 488, 495, 496
    ii.  freeBombs
           declared on line 63
           initialized on line 194 - 199
           used on lines 225-232, 247, 248, 256, 257, 286, 287
    iii. dropPoints
           declared on line 78
           initialized on line 330 - 338
           used on lines 218
    iv.  attackerIndex
           declared on line 342
           initialized on line 342-348
           used on lines 350-353
           
    
2. Object Arrays:
    i.   aliens of type Alien
           declared on line 50
           initialized on lines 122
           used on lines 123-130, 209-236, 295 - 321, 342, 345, 352
    ii.  bombs of type Bomb
           declared on line 51
           initialized on lines 183-190
           used on lines 194, 238-259, 276-293, 358-395, 437-475
    iii. rockets of type Rocket
           declared on line 53
           initialized on lines 163-168
           used on lines 172, 264- 326, 495


20

Part F2 - Mark (x /20)
-----------------------------
- Calculations performed on the information stored

Input from user:
  1. Name
  2. Number of Bombs
  3. Number of Rockets
  
1.Name
    Player Class - Line 20 - trim() substring()

2. Number of Bombs
    Main Program -  Line 108 - Input is taken from user
                  Line 128 - used to make drop points array a specific size
                  Line 195 - used to declare size of object array bombs
                  
  Spaceship Class - Line 138 - 160 Used to determine colour of spaceship
  
3. Number of Rockets
   Main Program - Line 15 - Taken from user
                  Line 175 - to declore the object array Rockets
                  Line 332 - to set colour for aliens
                  
4. Players Scores are out putted at the end of the game
As there is only 1 level, scores don't need to be in an array.
                  
5

*/
