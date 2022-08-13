class Food
{
  PVector position;
  PVector _color;
  float radius;
  boolean eaten;

  PImage menu[];
  PImage texture;
  Food()
  {
    eaten  = false;
    float x = random(0, 800);
    float y = random(0, 600);
    position = new PVector(x, y);
    radius = random(8, 30);

    _color = new PVector(random(0, 255), 
      random(0, 255), 
      random(0, 255));
    menu = new PImage[3];
    menu[0] = loadImage("papas.jpg");
    menu[1] = loadImage("dona.png");
    menu[2] = loadImage("Sushi.png");

    float seed = random(0, 30);
    if (seed <=10) {
      texture = menu[0];
    }
    if (seed >10 && seed <= 20) {
      texture = menu[1];
    }
    if (seed >20 && seed <= 30) {
      texture = menu[2];
    }
  }

  void render()
  {
    fill(_color.x, _color.y, _color.z);
    ellipse(position.x, position.y, radius * 2, radius * 2);
    image(texture, position.x - radius, position.y - radius, radius * 2, radius * 2);
  }
}
