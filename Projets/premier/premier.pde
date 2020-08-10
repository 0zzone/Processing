
// Joueur -------------------
int x = 290;
int y = 300;
int size1 = 40;
int size2 = 40;
// Comment jouer ------------------
int x_text = 15;
int y_text = 100;
// Cercle pour manger -----------------------
float x_cercle;
float y_cercle;
// Score ----------------------
int score = 0;
int score_x = 20;
int score_y = 20;
int ancien_score;
int x_scoref = 240;
int y_scoref = 235;
// Victoire -------------------
int x_vic = 200;
int y_vic = 200;
// Booléen pour jouer ou non -----------------------
boolean valide = true;
boolean valide_cercle = true;

// Base --------------------------------------------
void setup()
{
  size(600, 600);
}

void draw()
{
  background(0);
  affiche();
  deplace();
  welcome();
  sortie();
  cercle();
  score();
  contact();
  nettoyer();
  score();
  affiche();
  cercle();
}

// Jeu en complet -------------------------------------------
void affiche()
{
  fill(255);
  ellipse(x, y, size1, size2);
}

void deplace()
{
  if (keyPressed == true)
  {
    if (keyCode == UP)
    {
      y = y - 5;
      x_text = 2672473;
      y_text = 27836;
    }
    if (keyCode == DOWN)
    {
      y = y + 5;
      x_text = 2672473;
      y_text = 27836;
    }
    if (keyCode == RIGHT)
    {
      x = x + 5;
      x_text = 2672473;
      y_text = 27836;
    }
    if (keyCode == LEFT)
    {
      x = x - 5;
      x_text = 2672473;
      y_text = 27836;
    }
  }
}

void welcome()
{
  PFont welcome;
  welcome = loadFont("LucidaBright-Italic-48.vlw");
  textFont(welcome, 13);
  fill(255);
  text("Utilisez la flêche du haut pour faire bouger la balle et récupérer les différents points ROUGE", x_text, y_text);
}

void sortie()
{
  if (x <= -20)
  {
    fill(255);
    x = 580;
    ellipse(x, y, size1, size2);
  } else if (x >= 620)
  {
    fill(255);
    x = 20;
    ellipse(x, y, size1, size2);
  }
  if (y <= -20)
  {
    fill(255);
    y = 580;
    ellipse(x, y, size1, size2);
  } else if (y >= 620)
  {
    fill(255);
    y = 20;
    ellipse(x, y, size1, size2);
  }
}

void cercle()
{
  if (valide == true)
  {
    valide_cercle = true;
    x_cercle = random(20, 580);
    y_cercle = random(20, 580);
    valide = false;
  }

  fill(255, 0, 0);
  ellipse(x_cercle, y_cercle, 20, 20);
}

void score()
{
  PFont score_text;
  score_text = loadFont("LucidaBright-Italic-48.vlw");
  textFont(score_text, 15);
  fill(135, 194, 126);
  text("Votre score: " + score, score_x, score_x);
  
  if (score == 5)
  {
    ancien_score = score;
    fill(255);
    text("Votre score: " + ancien_score, x_scoref, y_scoref);
    score_x = 2653632;
    score_y = 27835;

    x_cercle = 827627;
    y_cercle = 8723783;
    
    x = 290;
    y = 300;

    PFont victoire;
    victoire = loadFont("LucidaBright-Italic-48.vlw");
    textFont(victoire, 45);
    fill(135, 194, 126);
    text("Victoire !", x_vic, y_vic);
  }
}

void contact()
{
  if ( ((x >= x_cercle - 10 && x <= x_cercle) || (x >= x_cercle && x <= x_cercle + 10)) && ((y <= y_cercle + 10 && y >= y_cercle) || (y <= y_cercle && y >= y_cercle - 10)) && valide_cercle == true)             
  {
    score=score+1;
    valide_cercle = false;
  }
}

void nettoyer()
{
  if (valide_cercle == false)
  {
    background(0);
    valide = true;
  }
}
