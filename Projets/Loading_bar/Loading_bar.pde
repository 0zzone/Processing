float i = 20;

void setup()
{
  size(600,600);
}

void draw()
{
   noFill();
   rect(18,48,561,24);
   rect(i,50,1,20);
   i=i+2;
   if (i == 580)
   {
     menu();
   }
}

void menu()
{
  background(0);
  
  fill(255);
  textSize(40);
  text("Bienvenue",200,150);
}
