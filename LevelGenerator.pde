class LevelGenerator
{

  Physics physics;
  ArrayList<Food> food;
  int foodCount = 25;
  Player shiba;
  AI ai;
  boolean enableSound = false;

  LevelGenerator() 
  {
    food = new ArrayList<Food>();
    physics = new Physics();
    shiba = new Player(new PVector(1, 1), 15);
    ai = new AI(new PVector(width / 2, height / 2), 10);
  }

  void GenerateLevel()
  {
    for (int i = 0; i < foodCount; i++)
    {
      Food snack = new Food();
      food.add(snack);
    }
    ai.SeekFood(food);
  }

  void Update()
  {
    shiba.Update();
    ai.Update(shiba.position);
    for (Food snack : food)
    {
      if (physics.Collision(shiba, snack) && shiba.radius >= snack.radius)
      {
        snack.eaten = true;
        shiba.radius += 2;
      } else if (physics.Collision(ai, snack) && ai.radius >= snack.radius)
      {
        snack.eaten = true;
        ai.radius += 2;
        ai.seeking = false;
      }
    }
    for (int i = food.size() - 1; i >= 0; i --)
    {
      Food snack = food.get(i);
      if (snack.eaten)
        food.remove(i);
      ai.detectionRadius = 1000;
      ai.SeekFood(food);
    }


    if (food.size() < foodCount)
    {
      Food snack = new Food();
      food.add(snack);
    }
    if(physics.Collision(shiba, ai))
    {
      if(shiba.radius > ai.radius)
      {
        enableSound = true;
        ai.isAlive = false;
      }
    }
  }
  void RenderLevel()
  {
    for (Food snack : food)
    {
      snack.render();
    }
    shiba.Render();
    ai.Render();
  }
  
}
