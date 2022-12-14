PImage img;
ArrayList<PVector>spots;
ArrayList<Square>squares;


void setup() {

  size(700, 700);

  initiate();
}
void initiate() {
  spots=new ArrayList<PVector>();
  squares=new ArrayList<Square>();

  img=loadImage("img.png");
  img.resize(width, height);
  for (int x=0; x<img.width; x++)
  {
    for (int y=0; y<img.height; y++)
    {
      spots.add(new PVector(x, y));
    }
  }
}
void draw()
{
  for (int i=0; i<20; i++)
  {
    newCircle();
  }

  background(255);
  for (Square c : squares) {
    if (c.growing) 
    {
      for (Square other : squares)
      {
        if (c!=other)
        {
          float d=dist(c.x, c.y, other.x, other.y);
          if (d< c.r + other.r)
          {
            c.growing=false;
            other.growing=false;
            break;
          }
        }
      }
    }
    c.grow();
    c.show();
  }
}
void newCircle() {
  PVector spot=spots.get((int)random(spots.size()));
  float x=spot.x;
  float y=spot.y;
  boolean valid=true;
  for (Square c : squares)
  {
    float d=dist(x, y, c.x, c.y);
    if (d<c.r) {
      valid=false;
      break;
    }
  }
  if (valid) {
    squares.add(new Square(x, y));
  }
}
