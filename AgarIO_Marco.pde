
import processing.sound.*;
SoundFile fileEnemy;
SoundFile fileWin;


LevelGenerator controller;
GameManager manager;

void setup()
{
  size(800, 600);
  background(0);
  controller = new LevelGenerator();
  controller.GenerateLevel();
  manager = new GameManager();
  fileEnemy = new SoundFile(this, "Uff_tona_01.mp3");
  fileWin = new SoundFile(this,"Wii_tona.mp3");
}
    void draw()
    {
      background (0);
      if (manager.sceneIndex == 1)
      {
        controller.Update();
        controller.RenderLevel();
      }
      manager.ShowInfo(controller.shiba, controller.ai);

      if (!controller.ai.isAlive && controller.enableSound)
      {
        fileEnemy.play();
        controller.enableSound = false;
      }
      if(manager.playerWon && manager.enableSound)
      {
        fileWin.play();
        manager.enableSound = false;
        manager.playerWon = false;
      }
    }
    

    void keyPressed()
    {
      if (key == CODED )
      {
        if (keyCode == UP)
        {
          manager.sceneIndex = 1;
        }
      }
    }
