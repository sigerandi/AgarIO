class Player
{
  PVector position;
  float radius;
  PImage texture;

  Player(PVector _position, float _radius)
  {
    position = _position;
    radius = _radius;
    texture = loadImage("tenor.png");
  }
  void Update()
  {
    PVector d = new PVector (mouseX -position.x, 
      mouseY - position.y);
    float magnitude = sqrt (pow(d.x, 2) + pow(d.y, 2));
    d =  new PVector(d.x / magnitude, d.y / magnitude);
    d= new PVector(d.x * 10, d.y * 10);
    position.add(d);

    if (radius >+100)
    {
      radius = 100;
    }
  }

  void Render()
  {
    fill(#00FFB0);
    noStroke();
    ellipse(position.x, position.y, 2 * radius, 2 * radius);
    image(texture, position.x - radius, position.y - radius, radius * 2, radius * 2);
  }
}
