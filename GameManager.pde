class GameManager
{
  int sceneIndex = 0;
  boolean playerWon = false; 
  boolean enableSound = false;

  GameManager()
  {
  }

  void ShowInfo(Player player, AI ai)
  {
    if (sceneIndex == 0) 
    {
      fill(#2CE3DE);
      textSize(32);
      text("Agar.Io", 10, 30);
      text("Press [ U P ] to Begin", 200, 200);
    } 
    else if (sceneIndex == 1) 
    {
      fill(#60B5B7);
      rect(0, 0, 800, 40);
      fill(#FA21CB);
      textSize(32);
      text("score:" + player.radius, 10, 30);
      text("Enemy score: " + ai.radius, 500, 30);
      if (player.radius >= 100 && ai.radius < player.radius)
      {
        fill(#ED590E);
        textSize(50);
        text("The player wins the game!", 50, 200);
        enableSound = true;
        playerWon = true;
        player.radius = 99;
      } 
      else if(ai.radius >= 100 && player.radius < ai.radius)
      {
        fill(#ED590E);
        textSize(50);
        text("The ai wins the game!", 50, 200);
      }
    }
  }
}
