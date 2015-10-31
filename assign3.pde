final int GAME_START=0;
final int GAME_RUN=1;
final int GAME_WIN=2;
int gameState;

PImage fighter,hp,treasure,enemy,bg1,bg2;
PImage start1,start2,end1,end2;
int bgx1,bgx2 = 0;
float a,tx,ty,hpy;
int shipx,shipy;

float enemyy1=random(415);
float enemyy2=random(269);
float enemyy3=random(220)+100;

float speed = 8;
int spacing = 70;
int enemyx1=0,enemyx2=-990,enemyx3=-1980;


void setup () {
    size(640,480) ;  // must use this size.
    start1 = loadImage("img/start1.png");
    start2 = loadImage("img/start2.png");
    end1 = loadImage("img/end1.png");
    end2 = loadImage("img/end2.png");
    shipx = width-50;
    shipy = height/2;
    fighter = loadImage("img/fighter.png");
    a = random(430);
    hp = loadImage("img/hp.png");
    hpy = 40;
    fill(255,0,0);
    noStroke();
    treasure = loadImage("img/treasure.png");
    tx = random(600);
    ty = random(440);
    
    //enemyy = random(415);
    enemy = loadImage("img/enemy.png");
    
    bg1 = loadImage("img/bg1.png");
    bg2 = loadImage("img/bg2.png");
    gameState = GAME_START;
}

void draw() {
  switch(gameState){
    case GAME_START:
      image(start2,0,0);
      if(mouseX > 205 && mouseX <455){
        if(mouseY >380 && mouseY <415){
          image(start1,0,0);
            if(mousePressed)
              gameState = GAME_RUN;
        }
      }
      break;
    case GAME_RUN:
      image (bg1,bgx1,0);
      image (bg2,bgx2-640,0);
      bgx1 = bgx1 +1;
      if(bgx1==640){
        bgx1=-640;
      }
      bgx1 = bgx1 % 641;
      bgx2 = bgx2 +1;
      if(bgx2==1280){
        bgx2=0;
      }
      bgx2 = bgx2 % 1281;
      image(treasure,tx,ty);
      image(fighter,shipx,shipy);

      //the first enemy
      for(int i =0;i>-spacing*5;i-=spacing){
        image(enemy,enemyx1+i,enemyy1); 
      }
        enemyx1 = enemyx1+4;

      if(enemyx1>=1630){
        enemyx1=-1340;
        enemyy1=random(409);
      }

      //the second enemy
      int j=-30;
      for(int i =0;i>-spacing*5;i-=spacing){
        j=j+30;
        image(enemy,enemyx2+i,enemyy2+j); 
      }
        enemyx2 = enemyx2+4;
      if(enemyx2>=1630){
        enemyx2=-1340;
        enemyy2=random(269);
      }
      println(enemyx2);
      //the thid enemy  
      int space = -50;
      for(int i =0;i>-spacing*5;i-=spacing){
        if(i>=(-2*spacing))
          space+=50;
        if(i<(-2*spacing))
          space-=50;
        image(enemy,enemyx3+i,enemyy3+space);
        image(enemy,enemyx3+i,enemyy3-space);
      }  
      enemyx3 = enemyx3 +4;
      if(enemyx3>=1630){
        enemyx3=-1340;
        enemyy3=random(220)+100;
      }
      //blood
      rect(18, 13, hpy, 20);
      image(hp,10,10); 
      break;
  }
}

