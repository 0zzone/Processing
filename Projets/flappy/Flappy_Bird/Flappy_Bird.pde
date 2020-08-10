//base ---------------------------------------------------------------
void setup()
{ 
  size(600, 600);
  bg = loadImage("images-2.jpg");
  perso = loadImage("flappy.png");
}
void draw()
{
  frameRate(100);
  background(255);
  vide();
  rempli();
  loading();
  jeu();
  presque();
  nettoyer();
  menu();
  nettoyer();
  bg();
  perso();
  perdu();
  comment();
  reload();

}

//Loading page ------------------------------------------------------------------------------------------
int [] tab = {50, 80, 110, 140, 170, 200, 230, 250, 280, 310, 340, 370, 400, 430, 460, 490, 520, 635278365};
float v = 30;
int x;
int p;//Chrono
int demarre_x = 130;
int demarre_y = 100;


void vide()
{
  fill(255);
  rect(50, 450, 500, 11);
}

void rempli()
{
  for (int i=0; i<tab.length; i++)
  {
    if (second()%2 == 0)
    {
      x = tab[i];
      fill(88, 214, 164);
      rect(x, 450, v, 11);
      p=p+1;
    }
  }
}

void loading()
{
  PFont loading;
  loading = loadFont("Optima-BoldItalic-48.vlw");
  textFont(loading, 15);
  fill(0);
  text("Loading ...", 260, 440);
}

void jeu()
{

  if (p >= 100)
  {
    PFont welcome;
    welcome = loadFont("TimesNewRomanPS-BoldItalicMT-48.vlw");
    textFont(welcome, 20);
    fill(88, 214, 164);
    text("Votre jeu va démarrer, quelques instants...", demarre_x, demarre_y);
  }
  if (p >= 140)
  {
    demarre_x = 4152;
    demarre_y = 1276235;
  }
}

void presque()
{
  frameRate(1);
  if (p >= 150)
  {
    PFont presque;
    presque = loadFont("TimesNewRomanPS-BoldItalicMT-48.vlw");
    textFont(presque, 20);
    fill(88, 214, 164);
    text("On y est presque..", 233, 100);
  }
}

void nettoyer()
{
  frameRate(20);
  if (p>=200 && p<250)
  {
    background(255);
  }
}

//Menu ------------------------------------------------------------------------
void menu()
{
  frameRate(30);
  if (p>=230)
  {
    background(101, 144, 214);

    PFont flappy;
    flappy = loadFont("AvenirNextCondensed-HeavyItalic-48.vlw");
    textFont(flappy, 30);
    fill(88, 214, 164);
    text("Flappy bird®", 230, 175);

    if (p >= 250)
    {
      rect(140, 350, 320, 60);
      PFont jouer;
      jouer = loadFont("AvenirNextCondensed-HeavyItalic-48.vlw");
      textFont(jouer, 20);
      fill(0);
      text("Le jeu se lance automatiquement...", 150, 380);
    }
  }
}


// Jeu -----------------------------------------

//Background
PImage bg;
int bgx;
int bgy;
// Perso
PImage perso;
int px = 200;
int py = 2500;
//Debut de partie
boolean active = false;
int consigne_x = 1000;
int consigne_y = 1600;
// Obstacles
int rect_x = 600;
float rect_y = random(300,500);
float rect_y_2 = random(100,200);
//Score
int score = 0;
String current_score = "Votre score: ";
int score_x = 10;
int score_y = 30;

void bg()
{
  frameRate(20);
  if (p>310)
  {
    image(bg, bgx, bgy);
    image(bg, bgx + bg.width, bgy);
    

    
    if (active == true)
    {
      bgx = bgx - 7;
     if (active == true)
    {
      fill(92, 73, 60);
      rect(rect_x,rect_y,25,height-rect_y);
      rect(rect_x,0,25,rect_y_2);
      rect_x = rect_x - 7;
      
     if (rect_x <= 10)
     {
      rect_y = random(300,600);
      rect_x = rect_x + 300;
      fill(92, 73, 60);
      rect(rect_x,rect_y,25,rect_y);
      
      score = score + 1;
     }
    }
      if (bgx < -bg.width)
      {
        bgx = 0;
      }
    }
    fill(0);
    textSize(20);
    text(current_score + score, score_x,score_y);
 

  }
}

void perso()
{
  frameRate(25);
  if (p>310)
  {
    scale(0.1);
    image(perso, px, py);  
    if (keyPressed == true)
    {
      if (keyCode == UP)
      {
        py = py - 90;
        active = true;
        consigne_x = 14145;
        consigne_y = 17625;
        
      }
    }
    if (keyPressed == false && py <= 4999 && active==true)
    {
      py = py + 85;
    }
  }
}

void comment ()
{
  if (p>315)
  {
    PFont comment;
    comment = loadFont("AvenirNextCondensed-Regular-48.vlw");
    textFont(comment, 250);
    fill(255);
    text("Utilisez la flèche du HAUT de direction pour monter", consigne_x, consigne_y);
  }
}
void perdu()
{

    if (py >= 4950)
    {
      active = false;
      println(score);
  
      PFont perdu;
      perdu = loadFont("AvenirNextCondensed-HeavyItalic-48.vlw");
      textFont(perdu, 450);
      text("Game over",1850,1500);
      
      textSize(200);
      text(current_score + score, 2300,2300);
      
      score_x = 1624235;
      score_y = 78253;  
    }
  }

void reload()
{
  if (py >= 4950)
  {
      PFont rejouer;
      rejouer = loadFont("Optima-BoldItalic-48.vlw");
      textFont(rejouer, 150);
      text("Appuyez sur la flèche de direction de DROITE pour rejouer", 1000,1800);
    if(keyPressed == true)
    {
      if(keyCode == RIGHT)
      {
        px = 200;
        py = 2500;
        score = 0;
        
        score_x = 10;
        score_y = 30;
    }
  }
}

}
