boolean active = false;
// Background
PImage bg;
int bgy;
// Perso
PImage perso;
int px = 250;
int py = 500;
// Missiles
int mx;
int my = 500;
int vitesse = 5;
boolean tirer = true;
// Obstacles
float x_carre;
float y_carre;
boolean valide = true;
boolean cons = true;
// Tué ?
boolean tue = false;
// Score
int score = 0;
int score_x = 10;
int score_y = 20;
// Comment jouer 
int comment_x = 15;
int comment_y = 100;
// Base -------------------------------------
void setup()
{
  size(626,626);
  bg = loadImage("bg.jpg");
  perso = loadImage("download.png");
}
void draw()
{
  bg();
  comment();
  perso();
  sortie();
  tirer();
  obstacle();
  collision();
  score();
}

// Jeu -----------------------

void bg()
{
  if (active == false)
  {
    image(bg, 0, bgy);
  }
  if (active == true)
  {
  image(bg, 0, bgy);
  bgy = bgy + 3;
  }
  
  if (bgy > height/4)
  {
    bgy = 0;
  }
}


void perso()
{
  scale(0.85);
  image(perso,px,py);
  
  if (keyPressed == true)
  {
    if (keyCode == RIGHT)
    {
      px = px + 5;
    }
    if (keyCode == LEFT)
    {
      px = px - 5;
    }
  }
}

void sortie()
{
  if (px <= -60)
  {
    px = -60;
  }
  if (px >= width-60)
  {
    px = width-60;
  }
}


void tirer()
{
  if (keyPressed == false)
  {
    if (key == 'p')
      {
        vitesse = 5;
        mx=px+105;
        fill(255,0,0);
        rect(mx,my,10,25);
        my = my - vitesse;
        }
      }
      else
      {
      if (my<0)
      {
        my = py;
        mx = px+60;
      }
      }
  }
  
void obstacle()
{
  if (valide == true)
  {
    x_carre = random(20,width-20);
    y_carre = random(0,height/2);
    valide = false;
  }
  if (cons == false)
  {
    x_carre = 67353;
    y_carre = 8236762;
  }
   fill(255);
   rect(x_carre,y_carre,25,25);
}

void collision()
{
  if ( (mx >= x_carre && mx <= x_carre + 25) && (my >= y_carre && my <= y_carre + 25) ) 
  {
    valide = true;
  }
}

void score()
{
  textSize(20);
  fill(100,100,100);
  text("Votre score: " + score,score_x,score_y);

  if (valide == true)
  {
    score = score + 1;
  }
  
  if (score == 5)
  {
    textSize(70);
    fill(255);
    text("Victoire !",210,200);
    score_x = 270;
    score_y = 230;
    cons = false;
    
    px = 250;
    py = 500;
    
    active = false;
  }
}
void comment()
{
  textSize(20);
  fill(150,150,150);
  text("Appuyez sur les fleches DROITE et GAUCHE de direction pour \nse déplacer et utilisez 'p' pour tirer pour tuer \nles monstres BLANCS",comment_x,comment_y);
  
  if (keyPressed == true)
  {
    if (keyCode == LEFT || keyCode == RIGHT || key == 'p')
    {
      comment_x = 2672;
      comment_y = 83673;
      
      active = true;
    }
  }
}
