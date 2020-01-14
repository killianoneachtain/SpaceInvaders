//-----------------------------------------------------//
// Space Invaders by Killian O'Neachtain 20023634      //
// Idea is based on Reas and Fry (2014) Pong Example   //
//-----------------------------------------------------//
// This is the Player class. It sets up a player that  //
// is the hero of our story and the last defender of   //
// the Earth from an alien invasion.                   // 
//-----------------------------------------------------//

public class Player
{
  private String playerName;
  private int bombsHit = 0;
  private int numberAliensDestroyed = 0;
  private int score;
  
  //Constructor to create a player with a starting name as entered by the player.
  public Player(String playerName)
  {
     this.playerName = playerName.trim().substring(0,6);     
  }
  
  //accessors
  public String getPlayerName()
  {
    return playerName;
  }
  
  //mutators
  public void addBombsHit(int hit)
  {
    this.bombsHit = bombsHit+hit;
  }
  
  public void addAliensDestroyed(int killed)
  {
    this.numberAliensDestroyed = numberAliensDestroyed+ killed;
  }
  
  //setter
  public void addScore(int score)
  {
    this.score = score;
  }
    
  //mutator for player name
  public void setPlayerName(String playerName)
  {
     this.playerName = playerName.substring(0,6);  
  }
  
  
  
  //method builds a nice String representation of the player name and their scores.
  //This string is then returned
  public String toString()
  {
     String str = "Scores for " + playerName + "\n";
     
     str = str + "     Bombs Destroyed " + ": " + bombsHit + "\n\n" + "     Aliens Destroyed : " + numberAliensDestroyed + "\n\n"
               + "     Score : " + score;
       
     return str;  
  }

}
