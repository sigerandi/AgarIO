class Physics
{
  Physics() {}
  
  boolean Collision(Player player, Food food)
  {
    //d = sqrt(a*a + b*b);
    PVector r = new PVector(player.position.x - food.position.x,
                            player.position.y - food.position.y);
                            
    float distance = sqrt((r.x * r.x) + (r.y * r.y));
    float sumRadius = player.radius + food.radius;
    
    if(distance <= sumRadius) return true;
    else return false;
  }
  
   boolean Collision(AI ai, Food food)
  {
   
    PVector r = new PVector(ai.position.x - food.position.x,
                            ai.position.y - food.position.y);
                            
    float distance = sqrt((r.x * r.x) + (r.y * r.y));
    float sumRadius = ai.radius + food.radius;
    
    if(distance <= sumRadius) return true;
    else return false;
  }
  boolean Collision(Player player, AI ai)
  {
  PVector r = new PVector(player.position.x - ai.position.x,
                            player.position.y - ai.position.y);
                            
    float distance = sqrt((r.x * r.x) + (r.y * r.y));
    float sumRadius = player.radius + ai.radius;
    
    if(distance <= sumRadius) return true;
    else return false;
 }
}
