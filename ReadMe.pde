/*
Name : Killian O'Neachtain
Student Number: 20023634

Brief description of the game developed: 
I have developed a 'Space Invaders' style game. There is a spaceship
at the bottom of the display window controled by the mouse, that shoots rockets at the oncoming aliens from an
unchartered planet, in unchartered space!
These aliens are trying to destroy the space ship by shooting bombs at the ship. If a bomb hits the ship, 
the player loses a life. If a rocket hits an alien a certain amount of times, it is destroyed.

Justification of spec: 
I have created 5 custom classes, one for each the elements of the game.
There are Object arrays for rockets, bombs and aliens. I have used primitive arrays to assign drop points for 
the alien bomb. I also used primitive arrays for the amount of free rockets available to the player, and free
bombs available to aliens.

The rockets available to the player is limited to 5. This means there are only 5 rockets to be displayed on the 
screen at any one time. I do this by using a version of a 'Stack'. I create an array called 'freeRockets' which
will vary in length from 0 to the amount of rocket objects in the Object Array 'Rockets'. This can be changed 
to allow for greater or lesser amounts of rockets and the code should hold true. 
At the beginning of the game. The freeRockets array is at capacity with default rocket constructor values. Once
this array is full, then pressing the fire button will not perform any actions. 
The rockets can be 'destroyed' by 3 different situations : hitting a bomb, hitting an alien, or leaving the display
window. If any of these events occur then the index number of the Object array is passed to the freeRocket array,
by using the expand() array function of processing. This is similar to a 'pop on' method in a Stack. Once a new
rocket is fired, it will take the index number from the freeRocket array and use the index to create a new
object of type Rocket at the destroyed rockets index number in the Object array rockets[]. This is similar to 
the 'pop-off' method in a Stack. It is using a primitive array value, to use as an object array's index.

There are many selection and iteration loops to implement the game.

Known bugs/problems: The attacker aliens are chosen at random when the aliens drop down a line. Sometimes the
attacker aliens, which are chosen by index number, are not there and no bombs are dropped for that line.

I coded for either mouse click or space bar for firing but my Apple Magic Mouse 2 wasn't responding appropriately
so i decided to take the mouse click option out of the program. It is viewable in earlier versions.

It is a stand alone level dictated by the user, i had hoped to design levels, but beyond the scope of the project.
I believe the code is written in such a way as to facilitate level coding in the future, as most variables are linked
through my code to allow expandability in the program. 

Any sources referred to during the development of the assignment (be precise and specific with references)
{there no need to reference lecture/lab materials}:

My sources are : https://processing.org/reference/expand_.html
                 https://processing.org/reference/shorten_.html
                 
                 I used the lecture and lab materials for everything else, heavily used PONG V9 for collision detection
                 , and my own logical reasoning for the rockets and bombs arrays for expanding and shortening.
                 
                 Bug fixing was carried out by myself through println() at particular points of effected code.

*/
