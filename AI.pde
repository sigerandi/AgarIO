class AI
{
  PVector position;
  float radius;
  boolean scared = false;
  Food currentSnack;
  boolean seeking = false;
  PImage img;
  boolean isAlive = true;
 
  AI(PVector _position, float _radius)

  {
    position = _position;
    radius =_radius;
    img = loadImage("pan.jpg");
  }

  void Update(PVector playerPos)
  {
   if (isAlive) 
    {
     PlayerPerception(playerPos); 
     

    if (seeking)
    {
      PVector d = new PVector(currentSnack.position.x - position.x, currentSnack.position.y -position.y);
      float magnitude = sqrt(pow(d.x, 2) + pow(d.y, 2));
      d = new PVector(d.x/magnitude, d.y/magnitude);
      position.add(d);
    }
  }
}

void Render()
{
  if(isAlive)
    {
    fill(#D83232);
    noStroke();
    ellipse(position.x, position.y, radius * 2, radius *2);
    image(img, position.x - radius, position.y - radius, radius * 2, radius * 2); 
    }
}
    

    
  

  void PlayerPerception (PVector playerPos)
  {
    PVector d = new PVector(playerPos.x - position.x, playerPos.y - position.y);
    float magnitude = sqrt (pow(d.x, 2) + pow(d.y, 2));

    if (magnitude <= 100)
    {
      scared = true;
    } else if (magnitude > 100) 
    {
      scared = false;
    }
    if (scared)
    {

      d = new PVector(d.x / magnitude, d.y / magnitude);
      d= new PVector(d.x * 2, d.y * 2);
      position.sub(d);
    }
  }
  float detectionRadius = 1000;
  void SeekFood(ArrayList<Food> snacks)
  {
    for (Food snack : snacks)
    {
      PVector dir = new PVector(snack.position.x - position.x, snack.position.y - position.y);
      float distance = sqrt(dir.x * dir.x + dir.y * dir.y);
      if (distance < detectionRadius && snack.radius < radius)
      {
        detectionRadius = distance; 
        currentSnack = snack;
      }
    }
    seeking = true;
  }
}
