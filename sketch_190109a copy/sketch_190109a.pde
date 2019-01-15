int scene = 0;
PImage mountain;
PImage left;
PImage right;
PImage tree;
PImage gameover;
PImage gameclear;
int x=350;
int y=40;
float [] A= new float [50];
float [] B= new float [50];
import processing.sound.*;
SoundFile ski;


void setup()
{
  size(800,800);
 mountain=loadImage("mountain.jpg");
 left=loadImage("left.png");
 right=loadImage("right.png");
 tree=loadImage("tree.png");
 gameover=loadImage("gameover.jpg");
 gameclear=loadImage("gameclear.jpg");
 ski = new SoundFile(this, "ski.mp3");
 ski.loop();
 for (int i=0; i<50; i++)
 { 
   A[i] = random(0,800);
   B[i] = random(100,800);
 }
}

void draw()
{
 
  
  if (scene == 0)
  {
    game();
  }
  
  if (scene==1)
  {
    dead();
  }
  
  if (scene==2)
  {
    gameclear();
  }
  
}

void game()
{
  background(mountain);
  // If the keycode is right,the image is right
  // Any other keycodes are pressed,the image is changed into the left
  image(keyCode ==RIGHT? right : left,x,y,50,50);
  
  if (keyCode == RIGHT)
  x+=3;
  
  if (keyCode == LEFT)
  x-=3;
  
  if(keyCode ==DOWN)
  y+=3;
 
  
  for (int i=0; i<50; i++)
 { 
   image(tree,A[i],B[i],80,80);
   if (dist(x,y,A[i],B[i])<20)
  {scene = 1;}
 }
  
  if(y>800)
  {
    scene=2;}
}

void dead()
{
  background(gameover);
  textSize(30);
  text("Game Over.Press Click anywhere to retry",150,400);
  fill(0);
}

void gameclear()
{
  background(gameclear);
  textSize(40);
  text("Nice riding",400,400);
  fill(0);
  
}
void mousePressed()
{
  if (scene==1)
  {
    if (mousePressed)
    { scene=0;
    x=350;
    y=40;
    
    for (int i=0; i<50; i++)
    {
      A[i] =random(0,800);
      B[i]=random(100,800);
    }
    }
  
  
}}
