// Joueur
float px1 = 20;
float py1 = 275;
float px2 = 570;
float py2 = 275;
// Balle
float x_balle = 300;
float y_balle = 300;
float speed = 5;
// Score
int score1 = 0;
int score2 = 0;
// Debut
int x_text = 25;
int y_text = 300;
// Temps
int p;


// Base
void setup()
{
  size(600,600);
}
void draw()
{
  background(0);
  middle();
  tige();
  sortie();
  balle();
  contact();
  bot();
  bas();
  score();
  victoire();
}

// Jeu --------------------------------------

void middle()
{
  fill(100,100,100);
  rect((width/2)-12.5,25,10,550);
}

void tige()
{
  fill(255);
  rect(px1,py1,10,50);
  rect(px2,py2,10,50);
  
  if (keyPressed == true)
  {
    if (key == 'a')
    {
      py1 = py1 - 5;
    }
    if (key == 'q')
    {
      py1 = py1 + 5;
    }
  }
}

void sortie()
{
  if (py1 <= 0)
  {
    py1 = 0;
  }
   if (py2 <= 0)
  {
    py2 = 0;
  }
  if (py1 >= 555)
  {
    py1 = 555;
  }
    if (py2 >= 555)
  {
    py2 = 555;
  }
}

void balle()
{
  fill(100,255,100);
  ellipse(x_balle,y_balle,35,35);
  x_balle = x_balle - speed;
}

void contact()
{
  
  
  // Joueur 1
  if ( (px1+10 >= x_balle-17.5 && px1+10 <= x_balle) && (y_balle == py1+25) )
  {
    speed = -10;
  }
    if ( (px1+10 >= x_balle-17.5 && px1+10 <= x_balle) && (y_balle<py1+25 && y_balle>=py1) )
    {
      
      speed = -10;
      y_balle = y_balle - 70;
    }
        if ( (px1+10 >= x_balle-17.5 && px1+10 <= x_balle) && (y_balle>py1+25 && y_balle<=py1+50) )
    {
      speed = -10;
      y_balle = y_balle + 70;
    }

    
    
    // Joueur 2
    
  if ( (px2 <= x_balle+17.5 && px2 >= x_balle) && (y_balle == py2+25) )
  {
    speed = -speed;  }
  if ( (px2 <= x_balle+17.5 && px2 >= x_balle) && (y_balle<py2+25 && y_balle>=py2) )
   {
    speed = -speed;
    y_balle = y_balle - 65;

   }
   if ( (px2 <= x_balle+17.5 && px2 >= x_balle) && (y_balle>py2+25 && y_balle<=py2+50) )
   {
    speed = -speed;
    y_balle = y_balle + 65;

   }
}

void bot()
{
  if (py2+25 < y_balle)
  {
    py2 = py2 + 1.15;
    if (py2 == y_balle)
    {
      py2 = py2 + 0;
    }
  }
  if (py2+25 > y_balle)
  {
    py2 = py2 - 1.15;
    if (py2 == y_balle)
    {
      py2 = py2 - 0;
    }
  }
}

void bas()
{
  if (y_balle - 17.5 <= 0)
  {
      y_balle = 70;
  }
  if (y_balle + 17.5 >= 600)
  {
    y_balle = 530;
  }
  
  
  if (x_balle < px1)
  {
    score2 = score2 + 1;
    x_balle = 300;
    y_balle = 300;
    
    py1 = 275;
    py2 = 275;
    
    speed = 5;
  }
  if (x_balle > px2)
  {
    score1 = score1 + 1;
    x_balle = 300;
    y_balle = 300;
    
    py1 = 275;
    py2 = 275;
    
    speed = 5;
  }
}

void score()
{
  textSize(100);
  fill(200,200,175);
  text(score1,100,150);
  text(score2,400,150);
}

void victoire()
{
  if (score1 == 5 || score2 == 5)
  {
    background(0);
    fill(200,200,175);
    text("Victoire", 100,350);
  }
}
