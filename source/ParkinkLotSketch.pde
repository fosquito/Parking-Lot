////////////////////////////////////////////////////////////////
//                                                            //
//                           AUTOR                            //
//                                                            //
////////////////////////////////////////////////////////////////
//                                                            //
//                   Nuno Filipe Rosa Pires                   //
//                                                            //
//                           57590                            //
//                                                            //
//                   Engenharia Informátia                    //
//                                                            //
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
//                                                            //
//                        PARKING LOT                         //
//                                                            //
////////////////////////////////////////////////////////////////
//                                                            //
//  O jogo programado é o Parking lot. O objetivo é retirar   //
//  o carro vermelho do parque de estacionamento. No entanto  //
//  existem outros carros, que são azuis, impedindo a saida   //
//  do carro vermelho. O jogador terá que mover os carros     //
//  para a frente e para trás (dependendo da sua direção)     //
//  até que o carro vermelho encontre a saida.                //
//                                                            //
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
//                                                            //
//                    MANUAL DE UTILIZAÇÃO                    //
//                                                            //
////////////////////////////////////////////////////////////////
//                                                            //
//  Para este jogo é apenas necessário usar clicks do mouse.  //
//  Quando o jogador começar a jogar, irá aparecer na tela    //
//  vários blocos (simulando os carros), e para o jogador     //
//  mover os blocos, tem que clicar em cima do bloco que      //
//  pretende mover e de seguida arrastar com o mouse para a   //
//  direção desejada. Os blocos só andam para frente e para   //
//  trás. Os blocos não podem passar por cima uns dos outros  //
//  pois isso tornaria o jogo fácil e sem dificuldade         // 
//  nenhuma. Na tabela, que representa o parque de            //
//  estacionamento, vai aparecer uma linha vermelha com um    //
//  'E' escrito ao lado que representa a saida (EXIT), e é    //
//  por essa linha que o carro vermelho tem que passar para   //
//  completar o nível. No caso de o jogador estar baralhado   //
//  ou trancado e não saber o que fazer, poderá clicar na     //
//  tecla 'R' para reniciar o nível. O jogo é composto por 4  //
//  níveis aumentando a dificuldade a cada nível.             //
//                                                            //
////////////////////////////////////////////////////////////////

final int myWidth = 800;
final int myHeight = 600;
final int margemWidth = 50;
final int margemHeight = 50;
final int margemBlocos = 8;

int level = 0;
int dim1, dim2, dim3, dim4, dim5, dim6, dim7, dim8, dim9, dim10, dim11, dim12, dim13, dim14, dim15, dim16, dim17, dim18, dim19;

float x = 0.0;
float y = 0.0;
float z = 0.0;
float margemTemp;
float x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17, x18, x19;
float y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11, y12, y13, y14, y15, y16, y17, y18, y19;
float cellHeight;
float cellWidth;
float esquerda;
float direita;
float cima;
float baixo;


boolean click1 = false;
boolean click2 = false;
boolean click3 = false;
boolean click4 = false;
boolean click5 = false;
boolean click6 = false;
boolean click7 = false;
boolean click8 = false;
boolean click9 = false;
boolean click10 = false;
boolean click11 = false;
boolean click12 = false;
boolean click13 = false;
boolean click14 = false;
boolean click15 = false;
boolean click16 = false;
boolean click17 = false;
boolean click18 = false;
boolean click19 = false;

final color black = color(0);
final color greyblack = color(50);
final color greywhite = color(200);
final color white = color(255);
final color red = color(255,50,50);
final color blue = color(50,50,255);

color windowColor;

void settings()
{
  size(myWidth, myHeight);
}

void setup()
{
   windowColor = color(255,255,255);
   rectMode(CENTER);
   textAlign(CENTER, CENTER);
}

void draw()
{
  background(greyblack);
  jogo();
}

void keyPressed()
{
  if(key == 'r')
  {
    if(level == 1)
    {
      cellHeight = (myHeight - 2*margemHeight)/5;
      cellWidth = (myWidth - 2*margemWidth)/6;
      drawtable(5, 6);
      setup1();
    }
    else if(level == 2)
    {
      cellHeight = (myHeight - 2*margemHeight)/8;
      cellWidth = (myWidth - 2*margemWidth)/12;
      drawtable(8, 12);
      setup2();
    }
    else if(level == 3)
    {
      cellHeight = (myHeight - 2*margemHeight)/8;
      cellWidth = (myWidth - 2*margemWidth)/8;
      drawtable(8, 8);
      setup3();
    }
    else if(level == 4)
    {
      cellHeight = (myHeight - 2*margemHeight)/9;
      cellWidth = (myWidth - 2*margemWidth)/10;
      drawtable(9, 10);
      setup4();
    }
  }
}

void mousePressed()
{
  x = mouseX;
  y = mouseY;
  
  click1 = false;
  click2 = false;
  click3 = false;
  click4 = false;
  click5 = false;
  click6 = false;
  click7 = false;
  click8 = false;
  click9 = false;
  click10 = false;
  click11 = false;
  click12 = false;
  click13 = false;
  click14 = false;
  click15 = false;
  click16 = false;
  click17 = false;
  click18 = false;
  click19 = false;
  
  if(level == 0)
  {
    cellHeight = (myHeight - 2*margemHeight)/5;
    cellWidth = (myWidth - 2*margemWidth)/6;
    drawtable(5, 6);
    setup1();
    level++;
  }
  else if(level == 1)
    level1();
  else if(level == 2)
    level2();
  else if(level == 3)
    level3();
  else if( level == 4)
    level4();
  else if(level == 5)
    level = 0;
}

void mouseDragged()
{
  if(level == 1)
    mover1();
  else if(level == 2)
    mover2();
  else if(level == 3)
    mover3();
  else if(level == 4)
    mover4();
}

void jogo()
{
  if(level == 0)
  {
    fill(red);
    textSize(76);
    text("PARKING LOT",myWidth/2, myHeight/2-100);
    fill(white);
    textSize(28);
    text("CLICK TO PLAY", myWidth/2, myHeight/2+100);
  }
  else if(level == 1)
  {
    fill(white);
    textSize(30);
    text("LEVEL 1", myWidth/2, margemHeight/2);
    text("E", myWidth - margemTemp + 20, myHeight/2);
    text("R to restart",myWidth/2, myHeight - margemHeight/2);
    drawtable(5, 6);
    lineSettings(red,5);
    line(myWidth - margemTemp, 2*(myHeight - 2*margemHeight)/5 + margemHeight, myWidth - margemTemp, 3*(myHeight - 2*margemHeight)/5 + margemHeight);
    drawblocos(dim1, true, red, x1, y1);
    drawblocos(dim2, false, blue, x2, y2);
    drawblocos(dim3, true, blue, x3, y3);
    drawblocos(dim4, false, blue, x4, y4);
    drawblocos(dim5, true, blue, x5, y5);
    drawblocos(dim6, false, blue, x6, y6);
    drawblocos(dim7, false, blue, x7, y7);
    //if(level == 1)
    if(x1 >= 6*cellHeight + margemTemp)
    {
      click1 = false;
      cellHeight = (myHeight - 2*margemHeight)/8;
      cellWidth = (myWidth - 2*margemWidth)/12;
      drawtable(8, 12);
      setup2();
      level++;
    }
  }
  else if(level == 2)
  {
    fill(white);
    textSize(30);
    text("LEVEL 2", myWidth/2, margemHeight/2);
    text("E", myWidth - margemWidth + 20, 6*cellWidth + margemTemp + cellWidth/2);
    text("R to restart",myWidth/2, myHeight - margemHeight/2);
    drawtable(8, 12);
    lineSettings(red,5);
    line(myWidth - margemWidth - 3, 6*cellWidth + margemTemp, myWidth - margemWidth - 3, 7*cellWidth + margemTemp);
    drawblocos(dim1, true, red, x1, y1);
    drawblocos(dim2, true, blue, x2, y2);
    drawblocos(dim3, true, blue, x3, y3);
    drawblocos(dim4, false, blue, x4, y4);
    drawblocos(dim5, true, blue, x5, y5);
    drawblocos(dim6, false, blue, x6, y6);
    drawblocos(dim7, false, blue, x7, y7);
    drawblocos(dim8, false, blue, x8, y8);
    drawblocos(dim9, true, blue, x9, y9);
    drawblocos(dim10, true, blue, x10, y10);
    drawblocos(dim11, true, blue, x11, y11);
    drawblocos(dim12, false, blue, x12, y12);
    drawblocos(dim13, false, blue, x13, y13);
    //if(level==2)
    if(x1 >= 12*cellWidth + margemWidth)
    {
      click1 = false;
      cellHeight = (myHeight - 2*margemHeight)/8;
      cellWidth = (myWidth - 2*margemWidth)/8;
      drawtable(8, 8);
      setup3();
      level++;
    }
  }
  else if(level == 3)
  {
    fill(white);
    textSize(30);
    text("LEVEL 3", myWidth/2, margemHeight/2);
    text("E", myWidth - margemTemp + 20, 3*cellHeight + margemHeight + cellHeight/2);
    text("R to restart",myWidth/2, myHeight - margemHeight/2);
    drawtable(8, 8);
    lineSettings(red,5);
    line(myWidth - margemTemp, 3*cellHeight + margemHeight, myWidth - margemTemp, 4*cellHeight + margemHeight);
    drawblocos(dim1, true, red, x1, y1);
    drawblocos(dim2, false, blue, x2, y2);
    drawblocos(dim3, false, blue, x3, y3);
    drawblocos(dim4, true, blue, x4, y4);
    drawblocos(dim5, true, blue, x5, y5);
    drawblocos(dim6, true, blue, x6, y6);
    drawblocos(dim7, false, blue, x7, y7);
    drawblocos(dim8, false, blue, x8, y8);
    drawblocos(dim9, true, blue, x9, y9);
    drawblocos(dim10, false, blue, x10, y10);
    drawblocos(dim11, true, blue, x11, y11);
    drawblocos(dim12, false, blue, x12, y12);
    drawblocos(dim13, true, blue, x13, y13);
    drawblocos(dim14, true, blue, x14, y14);
    drawblocos(dim15, false, blue, x15, y15);
    //if(level == 3)
    if(x1 >= 8*cellHeight + margemTemp)
    {
      click1 = false;
      cellHeight = (myHeight - 2*margemHeight)/9;
      cellWidth = (myWidth - 2*margemWidth)/10;
      drawtable(9, 10);
      setup4();
      level++;
    }
  }
  else if(level == 4)
  {
    fill(white);
    textSize(30);
    text("LEVEL 4", myWidth/2, margemHeight/2);
    text("E", myWidth - margemTemp + 20, 3*cellHeight + margemHeight + cellHeight/2);
    text("R to restart",myWidth/2, myHeight - margemHeight/2);
    drawtable(9, 10);
    lineSettings(red,5);
    line(myWidth - margemTemp, 3*cellHeight + margemHeight, myWidth - margemTemp, 4*cellHeight + margemHeight);
    drawblocos(dim1, true, red, x1, y1);
    drawblocos(dim2, false, blue, x2, y2);
    drawblocos(dim3, true, blue, x3, y3);
    drawblocos(dim4, true, blue, x4, y4);
    drawblocos(dim5, true, blue, x5, y5);
    drawblocos(dim6, true, blue, x6, y6);
    drawblocos(dim7, false, blue, x7, y7);
    drawblocos(dim8, true, blue, x8, y8);
    drawblocos(dim9, true, blue, x9, y9);
    drawblocos(dim10, false, blue, x10, y10);
    drawblocos(dim11, false, blue, x11, y11);
    drawblocos(dim12, true, blue, x12, y12);
    drawblocos(dim13, false, blue, x13, y13);
    drawblocos(dim14, true, blue, x14, y14);
    drawblocos(dim15, false, blue, x15, y15);
    drawblocos(dim16, true, blue, x16, y16);
    drawblocos(dim17, true, blue, x17, y17);
    drawblocos(dim18, false, blue, x18, y18);
    drawblocos(dim19, false, blue, x19, y19);
    if(x1 >= 10*cellHeight + margemTemp)
    {
      click1 = false;
      level++;
    }
  }
  else if(level == 5)
  {
    fill(white);
    textSize(80);
    text("Congratulations!!!", myWidth/2, myHeight/2 - 75);
    text("YOU WON", myWidth/2, myHeight/2 + 75);
  }
}

void drawtable(int myRows, int myColumns)
{
  lineSettings(white,1);  
  if(cellHeight <= cellWidth)
  {
    margemTemp = (myWidth - (myColumns*cellHeight))/2;
    for (int i = 0; i <= myColumns; i++)
      line(i*cellHeight + margemTemp, margemHeight, i*cellHeight + margemTemp, myRows*cellHeight + margemHeight);
    for (int i = 0; i <= myRows; i++)
      line(margemTemp, i*cellHeight + margemHeight, myColumns*cellHeight + margemTemp, i*cellHeight + margemHeight);
  }
  else
  {
    margemTemp = (myHeight - (myRows*cellWidth))/2;
    for (int i = 0; i <= myColumns; i++)
      line(i*cellWidth + margemWidth, margemTemp, i*cellWidth + margemWidth, myRows*cellWidth + margemTemp);
    for (int i = 0; i <= myRows; i++)
      line(margemWidth, i*cellWidth + margemTemp, myColumns*cellWidth + margemWidth, i*cellWidth + margemTemp);
  }
}

void lineSettings(color strokeColor, int strokeSize)
{
  stroke(strokeColor);
  strokeWeight(strokeSize);
}

void drawblocos(int dim, boolean hor, color c, float x, float y)
{
  lineSettings(black,3);
  fill(c);
  if(hor)
    if(cellHeight <= cellWidth)
      rect(x, y, (dim*cellHeight) - (2*margemBlocos), (cellHeight) - (2*margemBlocos));
    else
      rect(x, y, (dim*cellWidth) - (2*margemBlocos), (cellWidth) - (2*margemBlocos));
  else if(!hor)
    if(cellHeight <= cellWidth)
      rect(x, y, (cellHeight) - (2*margemBlocos), (dim*cellHeight) - (2*margemBlocos));
    else
       rect(x, y, (cellWidth) - (2*margemBlocos), (dim*cellWidth) - (2*margemBlocos));
}

void limitesX(float ax, float dim)
{
  if(cellHeight <= cellWidth)
  {
    direita = (dist(ax, 0, (myWidth - margemTemp), 0) - (dim/2)*cellHeight)*-1;
    esquerda = dist(ax,0,margemTemp,0) - (dim/2)*cellHeight;
  }
  else
  {
    direita = (dist(ax, 0, (myWidth - margemWidth), 0) - (dim/2)*cellWidth)*-1;
    esquerda = dist(ax,0,margemWidth,0) - (dim/2)*cellWidth;
  }
}

void limitesY(float ay, float dim)
{
  if(cellHeight <= cellWidth)
  {
    baixo = (dist(0,ay,0,(myHeight - margemHeight)) - (dim/2)*cellHeight)*-1;
    cima = dist(0, ay, 0, margemHeight) - (dim/2)*cellHeight;
  }
  else
  {
    baixo = (dist(0,ay,0,(myHeight - margemTemp)) - (dim/2)*cellWidth)*-1;
    cima = dist(0, ay, 0, margemTemp) - (dim/2)*cellWidth;
  }
  
}

void obstaculoX(float x1,float y1, int dim1, float x2,float y2, int dim2)
{
  if(cellHeight <= cellWidth)
  {
    if(dist(0, y1, 0, y2) < (dim2*cellHeight - (dim2-1)*cellHeight/2) - 2*margemBlocos && x1 - (dim1/2)*cellHeight + margemBlocos > x2 + cellHeight/2 - margemBlocos && dist(x1, 0, x2, 0) - (dim1*cellHeight - (dim1-1)*cellHeight/2) < esquerda)
      esquerda = dist(x1, 0, x2, 0) - (dim1*cellHeight - (dim1-1)*cellHeight/2); 
    else if(dist(0, y1, 0, y2) < (dim2*cellHeight - (dim2-1)*cellHeight/2) - 2*margemBlocos && x1 + (dim1/2)*cellHeight - margemBlocos < x2 - cellHeight/2 + margemBlocos && (dist(x1, 0, x2, 0) - (dim1*cellHeight - (dim1-1)*cellHeight/2))*-1 > direita)
      direita = (dist(x1, 0, x2, 0) - (dim1*cellHeight - (dim1-1)*cellHeight/2))*-1;
  }
  else
  {
    if(dist(0, y1, 0, y2) < (dim2*cellWidth - (dim2-1)*cellWidth/2) - 2*margemBlocos && x1 - (dim1/2)*cellWidth + margemBlocos > x2 + cellWidth/2 - margemBlocos && dist(x1, 0, x2, 0) - (cellWidth + cellWidth/2) < esquerda)
      esquerda = dist(x1, 0, x2, 0) - (dim1*cellWidth - (dim1-1)*cellWidth/2); 
    else if(dist(0, y1, 0, y2) < (dim2*cellWidth - (dim2-1)*cellWidth/2) - 2*margemBlocos && x1 + (dim1/2)*cellWidth - margemBlocos < x2 - cellWidth/2 + margemBlocos && (dist(x1, 0, x2, 0) - (dim1*cellWidth - (dim1-1)*cellWidth/2))*-1 > direita)
      direita = (dist(x1, 0, x2, 0) - (dim1*cellWidth - (dim1-1)*cellWidth/2))*-1;
  }
}

void obstaculoY(float x1, float y1, int dim1, float x2, float y2, int dim2)
{
  if(cellHeight <= cellWidth)
  {
    if(dist(x1, 0, x2, 0) < (dim2*cellHeight - (dim2-1)*cellHeight/2) - 2*margemBlocos && y1 + (dim1/2)*cellHeight - margemBlocos < y2 - cellHeight/2 + margemBlocos && (dist(0 , y1, 0, y2) - (dim1*cellHeight - (dim1-1)*cellHeight/2))*-1 > baixo)
      baixo = (dist(0 , y1, 0, y2) - (dim1*cellHeight - (dim1-1)*cellHeight/2))*-1; 
    else if(dist(x1, 0, x2, 0) < (dim2*cellHeight - (dim2-1)*cellHeight/2) - 2*margemBlocos && y1 - (dim1/2)*cellHeight + margemBlocos > y2 + cellHeight/2 - margemBlocos && dist(0, y1, 0, y2) - (dim1*cellHeight - (dim1-1)*cellHeight/2) < cima)
      cima = dist(0, y1, 0, y2) - (dim1*cellHeight - (dim1-1)*cellHeight/2); 
  }
  else
  {
    if(dist(x1, 0, x2, 0) < (dim2*cellWidth - (dim2-1)*cellWidth/2) - 2*margemBlocos && y1 + (dim1/2)*cellWidth - margemBlocos < y2 - cellWidth/2 + margemBlocos && (dist(0 , y1, 0, y2) - (dim1*cellWidth - (dim1-1)*cellWidth/2))*-1 > baixo)
      baixo = (dist(0 , y1, 0, y2) - (dim1*cellWidth - (dim1-1)*cellWidth/2))*-1; 
    else if(dist(x1, 0, x2, 0) < (dim2*cellWidth - (dim2-1)*cellWidth/2) - 2*margemBlocos && y1 - (dim1/2)*cellWidth + margemBlocos > y2 + cellWidth/2 - margemBlocos && dist(0, y1, 0, y2) - (dim1*cellWidth - (dim1-1)*cellWidth/2) < cima)
      cima = dist(0, y1, 0, y2) - (dim1*cellWidth - (dim1-1)*cellWidth/2); 
  }
}

void obstaculoXsame(float x1, float dim1, float x2, float dim2)
{
  if(cellHeight <= cellWidth)
  {
    if(x1 > x2 && dist(x1, 0, x2, 0) - (dim1/2 + dim2/2)*cellHeight < esquerda)
      esquerda = dist(x1, 0, x2, 0) - (dim1/2 + dim2/2)*cellHeight; 
    else if(x1 < x2 && (dist(x1, 0, x2, 0) - ((dim1/2 + dim2/2)*cellHeight))*-1 > direita)
      direita = (dist(x1, 0, x2, 0) - ((dim1/2 + dim2/2)*cellHeight))*-1;
  }
  else
  {
    if(x1 > x2 && dist(x1, 0, x2, 0) - (dim1/2 + dim2/2)*cellWidth < esquerda)
      esquerda = dist(x1, 0, x2, 0) - (dim1/2 + dim2/2)*cellWidth; 
    else if(x1 < x2 && (dist(x1, 0, x2, 0) - ((dim1/2 + dim2/2)*cellWidth))*-1 > direita)
      direita = (dist(x1, 0, x2, 0) - ((dim1/2 + dim2/2)*cellWidth))*-1;
  }
}

void obstaculoYsame(float y1, float dim1, float y2, float dim2)
{
  if(cellHeight <= cellWidth)
  {
    if(y1 < y2 && (dist(0 , y1, 0, y2) - (dim1/2 + dim2/2)*cellHeight)*-1 > baixo)
      baixo = (dist(0 , y1, 0, y2) - (dim1/2 + dim2/2)*cellHeight)*-1; 
    else if(y1 > y2 && dist(0, y1, 0, y2) - (dim1/2 + dim2/2)*cellHeight < cima)
      cima = dist(0, y1, 0, y2) - (dim1/2 + dim2/2)*cellHeight; 
  }
  else
  {
    if(y1 < y2 && (dist(0 , y1, 0, y2) - (dim1/2 + dim2/2)*cellWidth)*-1 > baixo)
      baixo = (dist(0 , y1, 0, y2) - (dim1/2 + dim2/2)*cellWidth)*-1; 
    else if(y1 > y2 && dist(0, y1, 0, y2) - (dim1/2 + dim2/2)*cellWidth < cima)
      cima = dist(0, y1, 0, y2) - (dim1/2 + dim2/2)*cellWidth; 
  }
}



/////////////////////////////////////////////////
/////////////////////////////////////////////////
/////                                       /////
/////                NIVEL 1                /////  
/////                                       /////
/////////////////////////////////////////////////
/////////////////////////////////////////////////


void setup1()
{
  x1 = 3*cellHeight + margemTemp;
  y1 = 3*cellHeight;
  dim1 = 2;
  x2 = 1*cellHeight + margemTemp + cellHeight/2;
  y2 = 2*cellHeight + margemHeight;
  dim2 = 2;
  x3 = 2*cellHeight + margemTemp;
  y3 = 1*cellHeight;
  dim3 = 2;
  x4 = 3*cellHeight + margemTemp + cellHeight/2;
  y4 = 1*cellHeight + margemHeight;
  dim4 = 2;
  x5 = 5*cellHeight + margemTemp;
  y5 = 1*cellHeight;
  dim5 = 2;
  x6 = 5*cellHeight + margemTemp + cellHeight/2;
  y6 = 2*cellHeight + margemHeight;
  dim6 = 2;
  x7 = 5*cellHeight + margemTemp + cellHeight/2;
  y7 = 4*cellHeight + margemHeight;
  dim7 = 2;
}

void level1()
{
  if(mouseX > x1 - cellHeight + margemBlocos && mouseX < x1 + cellHeight - margemBlocos && mouseY > y1 - cellHeight/2 + margemBlocos && mouseY < y1 + cellHeight/2 - margemBlocos)
  {
    limitesX(x1, dim1);
    direita = -9999;
    z = mouseX - x1;
    obstaculoX(x1, y1, dim1, x2, y2, dim2);
    obstaculoX(x1, y1, dim1, x4, y4, dim4);
    obstaculoX(x1, y1, dim1, x6, y6, dim6);
    obstaculoX(x1, y1, dim1, x7, y7, dim7);
    click1 = true;
  }
  else if(mouseX > x2 - cellHeight/2 + margemBlocos && mouseX < x2 + cellHeight/2 - margemBlocos && mouseY > y2 - cellHeight + margemBlocos && mouseY < y2 + cellHeight - margemBlocos)
  {
    limitesY(y2, dim2);
    z = mouseY - y2; 
    obstaculoY(x2, y2, dim2, x1, y1, dim1);
    obstaculoY(x2, y2, dim2, x3, y3, dim3);
    obstaculoY(x2, y2, dim2, x5, y5, dim5);
    click2 = true;
  }
  else if(mouseX > x3 - cellHeight + margemBlocos && mouseX < x3 + cellHeight - margemBlocos && mouseY > y3 - cellHeight/2 + margemBlocos && mouseY < y3 + cellHeight/2 - margemBlocos)
  {
    limitesX(x3, dim3);
    z = mouseX - x3;
    obstaculoX(x3, y3, dim3, x2, y2, dim2);
    obstaculoX(x3, y3, dim3, x4, y4, dim4);
    obstaculoX(x3, y3, dim3, x6, y6, dim6);
    obstaculoX(x3, y3, dim3, x7, y7, dim7);
    obstaculoXsame(x3, dim3, x5, dim5);
    click3 = true;
  }
  else if(mouseX > x4 - cellHeight/2 + margemBlocos && mouseX < x4 + cellHeight/2 - margemBlocos && mouseY > y4 - cellHeight + margemBlocos && mouseY < y4 + cellHeight - margemBlocos)
  {
    limitesY(y4, dim4);
    z = mouseY - y4; 
    obstaculoY(x4, y4, dim4, x1, y1, dim1);
    obstaculoY(x4, y4, dim4, x3, y3, dim3);
    obstaculoY(x4, y4, dim4, x5, y5, dim5);
    click4 = true;
  }
  else if(mouseX > x5 - cellHeight + margemBlocos && mouseX < x5 + cellHeight - margemBlocos && mouseY > y5 - cellHeight/2 + margemBlocos && mouseY < y5 + cellHeight/2 - margemBlocos)
  {
    limitesX(x5, dim5);
    z = mouseX - x5;
    obstaculoX(x5, y5, dim5, x2, y2, dim2);
    obstaculoX(x5, y5, dim5, x4, y4, dim4);
    obstaculoX(x5, y5, dim5, x6, y6, dim6);
    obstaculoX(x5, y5, dim5, x7, y7, dim7);
    obstaculoXsame(x5, dim5, x3, dim3);
    click5 = true;
  }
  else if(mouseX > x6 - cellHeight/2 + margemBlocos && mouseX < x6 + cellHeight/2 - margemBlocos && mouseY > y6 - cellHeight + margemBlocos && mouseY < y6 + cellHeight - margemBlocos)
  {
    limitesY(y6, dim6);
    z = mouseY - y6; 
    obstaculoY(x6, y6, dim6, x1, y1, dim1);
    obstaculoY(x6, y6, dim6, x3, y3, dim3);
    obstaculoY(x6, y6, dim6, x5, y5, dim5);
    obstaculoYsame(y6, dim6, y7, dim7);
    click6 = true;
  }
  else if(mouseX > x7 - cellHeight/2 + margemBlocos && mouseX < x7 + cellHeight/2 - margemBlocos && mouseY > y7 - cellHeight + margemBlocos && mouseY < y7 + cellHeight - margemBlocos)
  {
    limitesY(y7, dim7);
    z = mouseY - y7; 
    obstaculoY(x7, y7, dim7, x1, y1, dim1);
    obstaculoY(x7, y7, dim7, x3, y3, dim3);
    obstaculoY(x7, y7, dim7, x5, y5, dim5);
    obstaculoYsame(y7, dim7, y6, dim6);
    click7 = true;
  }
}

void mover1()
{
  if(click1 && x - mouseX <= esquerda && x - mouseX >= direita)
    x1 = mouseX - z;
  else if(click2 && y - mouseY >= baixo && y - mouseY <= cima)
    y2 = mouseY - z;
  if(click3 && x - mouseX <= esquerda && x - mouseX >= direita)
    x3 = mouseX - z;
  else if(click4 && y - mouseY >= baixo && y - mouseY <= cima)
    y4 = mouseY - z;
  if(click5 && x - mouseX <= esquerda && x - mouseX >= direita)
    x5 = mouseX - z;
  else if(click6 && y - mouseY >= baixo && y - mouseY <= cima)
    y6 = mouseY - z;
  else if(click7 && y - mouseY >= baixo && y - mouseY <= cima)
    y7 = mouseY - z;
}



/////////////////////////////////////////////////
/////////////////////////////////////////////////
/////                                       /////
/////                NIVEL 2                /////  
/////                                       /////
/////////////////////////////////////////////////
/////////////////////////////////////////////////

void setup2()
{
  x1 = cellWidth + margemWidth;
  y1 = 6*cellWidth + margemTemp + cellWidth/2;
  dim1 = 2;
  x2 = 2*cellWidth + margemWidth + cellWidth/2;
  y2 = cellWidth + margemTemp + cellWidth/2;
  dim2 = 5;
  x3 = 3*cellWidth + margemWidth + cellWidth/2;
  y3 = 3*cellWidth + margemTemp + cellWidth/2;
  dim3 = 3;
  x4 = 2*cellWidth + margemWidth + cellWidth/2;
  y4 = 6*cellWidth + margemTemp;
  dim4 = 4;
  x5 = 5*cellWidth + margemWidth;
  y5 = 5*cellWidth + margemTemp + cellWidth/2;
  dim5 = 4;
  x6 = 3*cellWidth + margemWidth + cellWidth/2;
  y6 = 7*cellWidth + margemTemp;
  dim6 = 2;
  x7 = 5*cellWidth + margemWidth + cellWidth/2;
  y7 = 2*cellWidth + margemTemp;
  dim7 = 4;
  x8 = 7*cellWidth + margemWidth + cellWidth/2;
  y8 = cellWidth + margemTemp + cellWidth/2;
  dim8 = 3;
  x9 = 8*cellWidth + margemWidth;
  y9 = 4*cellWidth + margemTemp + cellWidth/2;
  dim9 = 2;
  x10 = 8*cellWidth + margemWidth + cellWidth/2;
  y10 = 7*cellWidth + margemTemp + cellWidth/2;
  dim10 = 3;
  x11 = 10*cellWidth + margemWidth;
  y11 = margemTemp + cellWidth/2;
  dim11 = 4;
  x12 = 9*cellWidth + margemWidth + cellWidth/2;
  y12 = 4*cellWidth + margemTemp + cellWidth/2;
  dim12 = 5;
  x13 = 11*cellWidth + margemWidth + cellWidth/2;
  y13 = 6*cellWidth + margemTemp;
  dim13 = 2;
}

void level2()
{
  if(mouseX > x1 - (dim1/2)*cellWidth + margemBlocos && mouseX < x1 + (dim1/2)*cellWidth - margemBlocos && mouseY > y1 - cellWidth/2 + margemBlocos && mouseY < y1 + cellWidth/2 - margemBlocos)
  {
    limitesX(x1, dim1);
    direita = -9999;
    z = mouseX - x1;
    obstaculoX(x1, y1, dim1, x4, y4, dim4);
    obstaculoX(x1, y1, dim1, x6, y6, dim6);
    obstaculoX(x1, y1, dim1, x7, y7, dim7);
    obstaculoX(x1, y1, dim1, x8, y8, dim8);
    obstaculoX(x1, y1, dim1, x12, y12, dim12);
    obstaculoX(x1, y1, dim1, x13, y13, dim13);
    click1 = true;
  }
  else if(mouseX > x2 - (dim2/2)*cellWidth + margemBlocos && mouseX < x2 + (dim2/2)*cellWidth - margemBlocos && mouseY > y2 - cellWidth/2 + margemBlocos && mouseY < y2 + cellWidth/2 - margemBlocos)
  {
    limitesX(x2, dim2);
    z = mouseX - x2; 
    obstaculoX(x2, y2, dim2, x4, y4, dim4);
    obstaculoX(x2, y2, dim2, x6, y6, dim6);
    obstaculoX(x2, y2, dim2, x7, y7, dim7);
    obstaculoX(x2, y2, dim2, x8, y8, dim8);
    obstaculoX(x2, y2, dim2, x12, y12, dim12);
    obstaculoX(x2, y2, dim2, x13, y13, dim13);
    click2 = true;
  }
  else if(mouseX > x3 - (dim3/2)*cellWidth + margemBlocos && mouseX < x3 + (dim3/2)*cellWidth - margemBlocos && mouseY > y3 - cellWidth/2 + margemBlocos && mouseY < y3 + cellWidth/2 - margemBlocos)
  {
    limitesX(x3, dim3);
    z = mouseX - x3;
    obstaculoX(x3, y3, dim3, x4, y4, dim4);
    obstaculoX(x3, y3, dim3, x6, y6, dim6);
    obstaculoX(x3, y3, dim3, x7, y7, dim7);
    obstaculoX(x3, y3, dim3, x8, y8, dim8);
    obstaculoX(x3, y3, dim3, x12, y12, dim12);
    obstaculoX(x3, y3, dim3, x13, y13, dim13);
    click3 = true;
  }
  else if(mouseX > x4 - cellHeight/2 + margemBlocos && mouseX < x4 + cellHeight/2 - margemBlocos && mouseY > y4 - (dim4/2)*cellHeight + margemBlocos && mouseY < y4 + (dim4/2)*cellHeight - margemBlocos)
  {
    limitesY(y4, dim4);
    z = mouseY - y4; 
    obstaculoY(x4, y4, dim4, x1, y1, dim1);
    obstaculoY(x4, y4, dim4, x2, y2, dim2);
    obstaculoY(x4, y4, dim4, x3, y3, dim3);
    obstaculoY(x4, y4, dim4, x5, y5, dim5);
    obstaculoY(x4, y4, dim4, x9, y9, dim9);
    obstaculoY(x4, y4, dim4, x10, y10, dim10);
    obstaculoY(x4, y4, dim4, x11, y11, dim11);
    click4 = true;
  }
  else if(mouseX > x5 - (dim5/2)*cellWidth + margemBlocos && mouseX < x5 + (dim5/2)*cellWidth - margemBlocos && mouseY > y5 - cellWidth/2 + margemBlocos && mouseY < y5 + cellWidth/2 - margemBlocos)
  {
    limitesX(x5, dim5);
    z = mouseX - x5;
    obstaculoX(x5, y5, dim5, x4, y4, dim4);
    obstaculoX(x5, y5, dim5, x6, y6, dim6);
    obstaculoX(x5, y5, dim5, x7, y7, dim7);
    obstaculoX(x5, y5, dim5, x8, y8, dim8);
    obstaculoX(x5, y5, dim5, x12, y12, dim12);
    obstaculoX(x5, y5, dim5, x13, y13, dim13);
    click5 = true;
  }
  else if(mouseX > x6 - cellHeight/2 + margemBlocos && mouseX < x6 + cellHeight/2 - margemBlocos && mouseY > y6 - (dim6/2)*cellHeight + margemBlocos && mouseY < y6 + (dim6/2)*cellHeight - margemBlocos)
  {
    limitesY(y6, dim6);
    z = mouseY - y6; 
    obstaculoY(x6, y6, dim6, x1, y1, dim1);
    obstaculoY(x6, y6, dim6, x2, y2, dim2);
    obstaculoY(x6, y6, dim6, x3, y3, dim3);
    obstaculoY(x6, y6, dim6, x5, y5, dim5);
    obstaculoY(x6, y6, dim6, x9, y9, dim9);
    obstaculoY(x6, y6, dim6, x10, y10, dim10);
    obstaculoY(x6, y6, dim6, x11, y11, dim11);
    click6 = true;
  }
  else if(mouseX > x7 - cellHeight/2 + margemBlocos && mouseX < x7 + cellHeight/2 - margemBlocos && mouseY > y7 - (dim7/2)*cellHeight + margemBlocos && mouseY < y7 + (dim7/2)*cellHeight - margemBlocos)
  {
    limitesY(y7, dim7);
    z = mouseY - y7; 
    obstaculoY(x7, y7, dim7, x1, y1, dim1);
    obstaculoY(x7, y7, dim7, x2, y2, dim2);
    obstaculoY(x7, y7, dim7, x3, y3, dim3);
    obstaculoY(x7, y7, dim7, x5, y5, dim5);
    obstaculoY(x7, y7, dim7, x9, y9, dim9);
    obstaculoY(x7, y7, dim7, x10, y10, dim10);
    obstaculoY(x7, y7, dim7, x11, y11, dim11);
    click7 = true;
  }
  else if(mouseX > x8 - cellHeight/2 + margemBlocos && mouseX < x8 + cellHeight/2 - margemBlocos && mouseY > y8 - (dim8/2)*cellHeight + margemBlocos && mouseY < y8 + (dim8/2)*cellHeight - margemBlocos)
  {
    limitesY(y8, dim8);
    z = mouseY - y8; 
    obstaculoY(x8, y8, dim8, x1, y1, dim1);
    obstaculoY(x8, y8, dim8, x2, y2, dim2);
    obstaculoY(x8, y8, dim8, x3, y3, dim3);
    obstaculoY(x8, y8, dim8, x5, y5, dim5);
    obstaculoY(x8, y8, dim8, x9, y9, dim9);
    obstaculoY(x8, y8, dim8, x10, y10, dim10);
    obstaculoY(x8, y8, dim8, x11, y11, dim11);
    click8 = true;
  }
  else if(mouseX > x9 - (dim9/2)*cellWidth + margemBlocos && mouseX < x9 + (dim9/2)*cellWidth - margemBlocos && mouseY > y9 - cellWidth/2 + margemBlocos && mouseY < y9 + cellWidth/2 - margemBlocos)
  {
    limitesX(x9, dim9);
    z = mouseX - x9;
    obstaculoX(x9, y9, dim9, x4, y4, dim4);
    obstaculoX(x9, y9, dim9, x6, y6, dim6);
    obstaculoX(x9, y9, dim9, x7, y7, dim7);
    obstaculoX(x9, y9, dim9, x8, y8, dim8);
    obstaculoX(x9, y9, dim9, x12, y12, dim12);
    obstaculoX(x9, y9, dim9, x13, y13, dim13);
    click9 = true;
  }
  else if(mouseX > x10 - (dim10/2)*cellWidth + margemBlocos && mouseX < x10 + (dim10/2)*cellWidth - margemBlocos && mouseY > y10 - cellWidth/2 + margemBlocos && mouseY < y10 + cellWidth/2 - margemBlocos)
  {
    limitesX(x10, dim10);
    z = mouseX - x10;
    obstaculoX(x10, y10, dim10, x4, y4, dim4);
    obstaculoX(x10, y10, dim10, x6, y6, dim6);
    obstaculoX(x10, y10, dim10, x7, y7, dim7);
    obstaculoX(x10, y10, dim10, x8, y8, dim8);
    obstaculoX(x10, y10, dim10, x12, y12, dim12);
    obstaculoX(x10, y10, dim10, x13, y13, dim13);
    click10 = true;
  }
  else if(mouseX > x11 - (dim11/2)*cellWidth + margemBlocos && mouseX < x11 + (dim11/2)*cellWidth - margemBlocos && mouseY > y11 - cellWidth/2 + margemBlocos && mouseY < y11 + cellWidth/2 - margemBlocos)
  {
    limitesX(x11, dim11);
    z = mouseX - x11;
    obstaculoX(x11, y11, dim11, x4, y4, dim4);
    obstaculoX(x11, y11, dim11, x6, y6, dim6);
    obstaculoX(x11, y11, dim11, x7, y7, dim7);
    obstaculoX(x11, y11, dim11, x8, y8, dim8);
    obstaculoX(x11, y11, dim11, x12, y12, dim12);
    obstaculoX(x11, y11, dim11, x13, y13, dim13);
    click11 = true;
  }
  else if(mouseX > x12 - cellHeight/2 + margemBlocos && mouseX < x12 + cellHeight/2 - margemBlocos && mouseY > y12 - (dim12/2)*cellHeight + margemBlocos && mouseY < y12 + (dim12/2)*cellHeight - margemBlocos)
  {
    limitesY(y12, dim12);
    z = mouseY - y12; 
    obstaculoY(x12, y12, dim12, x1, y1, dim1);
    obstaculoY(x12, y12, dim12, x2, y2, dim2);
    obstaculoY(x12, y12, dim12, x3, y3, dim3);
    obstaculoY(x12, y12, dim12, x5, y5, dim5);
    obstaculoY(x12, y12, dim12, x9, y9, dim9);
    obstaculoY(x12, y12, dim12, x10, y10, dim10);
    obstaculoY(x12, y12, dim12, x11, y11, dim11);
    click12 = true;
  }
  else if(mouseX > x13 - cellHeight/2 + margemBlocos && mouseX < x13 + cellHeight/2 - margemBlocos && mouseY > y13 - (dim13/2)*cellHeight + margemBlocos && mouseY < y13 + (dim13/2)*cellHeight - margemBlocos)
  {
    limitesY(y13, dim13);
    z = mouseY - y13; 
    obstaculoY(x13, y13, dim13, x1, y1, dim1);
    obstaculoY(x13, y13, dim13, x2, y2, dim2);
    obstaculoY(x13, y13, dim13, x3, y3, dim3);
    obstaculoY(x13, y13, dim13, x5, y5, dim5);
    obstaculoY(x13, y13, dim13, x9, y9, dim9);
    obstaculoY(x13, y13, dim13, x10, y10, dim10);
    obstaculoY(x13, y13, dim13, x11, y11, dim11);
    click13 = true;
  }
}

void mover2()
{
  if(click1 && x - mouseX <= esquerda && x - mouseX >= direita)
    x1 = mouseX - z;
  else if(click2 && x - mouseX <= esquerda && x - mouseX >= direita)
    x2 = mouseX - z;
  else if(click3 && x - mouseX <= esquerda && x - mouseX >= direita)
    x3 = mouseX - z;
  else if(click4 && y - mouseY >= baixo && y - mouseY <= cima)
    y4 = mouseY - z;
  else if(click5 && x - mouseX <= esquerda && x - mouseX >= direita)
    x5 = mouseX - z;
  else if(click6 && y - mouseY >= baixo && y - mouseY <= cima)
    y6 = mouseY - z;
  else if(click7 && y - mouseY >= baixo && y - mouseY <= cima)
    y7 = mouseY - z;
  else if(click8 && y - mouseY >= baixo && y - mouseY <= cima)
    y8 = mouseY - z;
  else if(click9 && x - mouseX <= esquerda && x - mouseX >= direita)
    x9 = mouseX - z;
  else if(click10 && x - mouseX <= esquerda && x - mouseX >= direita)
    x10 = mouseX - z;
  else if(click11 && x - mouseX <= esquerda && x - mouseX >= direita)
    x11 = mouseX - z;
  else if(click12 && y - mouseY >= baixo && y - mouseY <= cima)
    y12 = mouseY - z;
  else if(click13 && y - mouseY >= baixo && y - mouseY <= cima)
    y13 = mouseY - z;
}


/////////////////////////////////////////////////
/////////////////////////////////////////////////
/////                                       /////
/////                NIVEL 3                /////  
/////                                       /////
/////////////////////////////////////////////////
/////////////////////////////////////////////////

void setup3()
{
  x1 = cellHeight + margemTemp;
  y1 = 3*cellHeight + margemHeight + cellHeight/2;
  dim1 = 2;
  x2 = cellHeight/2 + margemTemp;
  y2 = cellHeight + margemHeight + cellHeight/2;
  dim2 = 3;
  x3 = cellHeight/2 + margemTemp;
  y3 = 5*cellHeight + margemHeight + cellHeight/2;
  dim3 = 3;
  x4 = cellHeight + margemTemp;
  y4 = 7*cellHeight + margemHeight + cellHeight/2;
  dim4 = 2;
  x5 = 2*cellHeight + margemTemp + cellHeight/2;
  y5 = margemHeight + cellHeight/2;
  dim5 = 3;
  x6 = 3*cellHeight + margemTemp;
  y6 = cellHeight + margemHeight + cellHeight/2;
  dim6 = 2;
  x7 = 3*cellHeight + margemTemp + cellHeight/2;
  y7 = 3*cellHeight + margemHeight;
  dim7 = 2;
  x8 = 3*cellHeight + margemTemp+ cellHeight/2;
  y8 = 6*cellHeight + margemHeight;
  dim8 = 2;
  x9 = 4*cellHeight + margemTemp;
  y9 = 7*cellHeight + margemHeight + cellHeight/2;
  dim9 = 2;
  x10 = 4*cellHeight + margemTemp + cellHeight/2;
  y10 = 2*cellHeight + margemHeight;
  dim10 = 4;
  x11 = 6*cellHeight + margemTemp;
  y11 = 6*cellHeight + margemHeight + cellHeight/2;
  dim11 = 4;
  x12 = 5*cellHeight + cellHeight/2 + margemTemp;
  y12 = 3*cellHeight + margemHeight + cellHeight/2;
  dim12 = 3;
  x13 = 6*cellHeight + margemTemp;
  y13 = 5*cellHeight + margemHeight + cellHeight/2;
  dim13 = 2;
  x14 = 6*cellHeight + margemTemp + cellHeight/2;
  y14 = 7*cellHeight + margemHeight + cellHeight/2;
  dim14 = 3;
  x15 = 7*cellHeight + cellHeight/2 + margemTemp;
  y15 = 2*cellHeight + margemHeight;
  dim15 = 4;
}

void level3()
{
  if(mouseX > x1 - (dim1/2)*cellWidth + margemBlocos && mouseX < x1 + (dim1/2)*cellWidth - margemBlocos && mouseY > y1 - cellWidth/2 + margemBlocos && mouseY < y1 + cellWidth/2 - margemBlocos)
  {
    limitesX(x1, dim1);
    direita = -9999;
    z = mouseX - x1;
    obstaculoX(x1, y1, dim1, x2, y2, dim2);
    obstaculoX(x1, y1, dim1, x3, y3, dim3);
    obstaculoX(x1, y1, dim1, x7, y7, dim7);
    obstaculoX(x1, y1, dim1, x8, y8, dim8);
    obstaculoX(x1, y1, dim1, x10, y10, dim10);
    obstaculoX(x1, y1, dim1, x12, y12, dim12);
    obstaculoX(x1, y1, dim1, x15, y15, dim15);
    click1 = true;
  }
  else if(mouseX > x2 - cellHeight/2 + margemBlocos && mouseX < x2 + cellHeight/2 - margemBlocos && mouseY > y2 - (dim2/2)*cellHeight + margemBlocos && mouseY < y2 + (dim2/2)*cellHeight - margemBlocos)
  {
    limitesY(y2, dim2);
    z = mouseY - y2; 
    obstaculoY(x2, y2, dim2, x1, y1, dim1);
    obstaculoY(x2, y2, dim2, x4, y4, dim4);
    obstaculoY(x2, y2, dim2, x5, y5, dim5);
    obstaculoY(x2, y2, dim2, x6, y6, dim6);
    obstaculoY(x2, y2, dim2, x9, y9, dim9);
    obstaculoY(x2, y2, dim2, x11, y11, dim11);
    obstaculoY(x2, y2, dim2, x13, y13, dim13);
    obstaculoY(x2, y2, dim2, x14, y14, dim14);
    obstaculoYsame(y2, dim2, y3, dim3);
    click2 = true;
  }
  else if(mouseX > x3 - cellHeight/2 + margemBlocos && mouseX < x3 + cellHeight/2 - margemBlocos && mouseY > y3 - (dim3/2)*cellHeight + margemBlocos && mouseY < y3 + (dim3/2)*cellHeight - margemBlocos)
  {
    limitesY(y3, dim3);
    z = mouseY - y3; 
    obstaculoY(x3, y3, dim3, x1, y1, dim1);
    obstaculoY(x3, y3, dim3, x4, y4, dim4);
    obstaculoY(x3, y3, dim3, x5, y5, dim5);
    obstaculoY(x3, y3, dim3, x6, y6, dim6);
    obstaculoY(x3, y3, dim3, x9, y9, dim9);
    obstaculoY(x3, y3, dim3, x11, y11, dim11);
    obstaculoY(x3, y3, dim3, x13, y13, dim13);
    obstaculoY(x3, y3, dim3, x14, y14, dim14);
    obstaculoYsame(y3, dim3, y2, dim2);
    click3 = true;
  }
  else if(mouseX > x4 - (dim4/2)*cellWidth + margemBlocos && mouseX < x4 + (dim4/2)*cellWidth - margemBlocos && mouseY > y4 - cellWidth/2 + margemBlocos && mouseY < y4 + cellWidth/2 - margemBlocos)
  {
    limitesX(x4, dim4);
    z = mouseX - x4;
    obstaculoX(x4, y4, dim4, x2, y2, dim2);
    obstaculoX(x4, y4, dim4, x3, y3, dim3);
    obstaculoX(x4, y4, dim4, x7, y7, dim7);
    obstaculoX(x4, y4, dim4, x8, y8, dim8);
    obstaculoX(x4, y4, dim4, x10, y10, dim10);
    obstaculoX(x4, y4, dim4, x12, y12, dim12);
    obstaculoX(x4, y4, dim4, x15, y15, dim15);
    obstaculoXsame(x4, dim4, x9, dim9);
    click4 = true;
  }
  else if(mouseX > x5 - (dim5/2)*cellWidth + margemBlocos && mouseX < x5 + (dim5/2)*cellWidth - margemBlocos && mouseY > y5 - cellWidth/2 + margemBlocos && mouseY < y5 + cellWidth/2 - margemBlocos)
  {
    limitesX(x5, dim5);
    z = mouseX - x5;
    obstaculoX(x5, y5, dim5, x2, y2, dim2);
    obstaculoX(x5, y5, dim5, x3, y3, dim3);
    obstaculoX(x5, y5, dim5, x7, y7, dim7);
    obstaculoX(x5, y5, dim5, x8, y8, dim8);
    obstaculoX(x5, y5, dim5, x10, y10, dim10);
    obstaculoX(x5, y5, dim5, x12, y12, dim12);
    obstaculoX(x5, y5, dim5, x15, y15, dim15);
    click5 = true;
  }
  else if(mouseX > x6 - (dim6/2)*cellWidth + margemBlocos && mouseX < x6 + (dim6/2)*cellWidth - margemBlocos && mouseY > y6 - cellWidth/2 + margemBlocos && mouseY < y6 + cellWidth/2 - margemBlocos)
  {
    limitesX(x6, dim6);
    z = mouseX - x6;
    obstaculoX(x6, y6, dim6, x2, y2, dim2);
    obstaculoX(x6, y6, dim6, x3, y3, dim3);
    obstaculoX(x6, y6, dim6, x7, y7, dim7);
    obstaculoX(x6, y6, dim6, x8, y8, dim8);
    obstaculoX(x6, y6, dim6, x10, y10, dim10);
    obstaculoX(x6, y6, dim6, x12, y12, dim12);
    obstaculoX(x6, y6, dim6, x15, y15, dim15);
    click6 = true;
  }
  else if(mouseX > x7 - cellHeight/2 + margemBlocos && mouseX < x7 + cellHeight/2 - margemBlocos && mouseY > y7 - (dim7/2)*cellHeight + margemBlocos && mouseY < y7 + (dim7/2)*cellHeight - margemBlocos)
  {
    limitesY(y7, dim7);
    z = mouseY - y7; 
    obstaculoY(x7, y7, dim7, x1, y1, dim1);
    obstaculoY(x7, y7, dim7, x4, y4, dim4);
    obstaculoY(x7, y7, dim7, x5, y5, dim5);
    obstaculoY(x7, y7, dim7, x6, y6, dim6);
    obstaculoY(x7, y7, dim7, x9, y9, dim9);
    obstaculoY(x7, y7, dim7, x11, y11, dim11);
    obstaculoY(x7, y7, dim7, x13, y13, dim13);
    obstaculoY(x7, y7, dim7, x14, y14, dim14);
    obstaculoYsame(y7, dim7, y8, dim8);
    click7 = true;
  }
  else if(mouseX > x8 - cellHeight/2 + margemBlocos && mouseX < x8 + cellHeight/2 - margemBlocos && mouseY > y8 - (dim8/2)*cellHeight + margemBlocos && mouseY < y8 + (dim8/2)*cellHeight - margemBlocos)
  {
    limitesY(y8, dim8);
    z = mouseY - y8; 
    obstaculoY(x8, y8, dim8, x1, y1, dim1);
    obstaculoY(x8, y8, dim8, x4, y4, dim4);
    obstaculoY(x8, y8, dim8, x5, y5, dim5);
    obstaculoY(x8, y8, dim8, x6, y6, dim6);
    obstaculoY(x8, y8, dim8, x9, y9, dim9);
    obstaculoY(x8, y8, dim8, x11, y11, dim11);
    obstaculoY(x8, y8, dim8, x13, y13, dim13);
    obstaculoY(x8, y8, dim8, x14, y14, dim14);
    obstaculoYsame(y8, dim8, y7, dim7);
    click8 = true;
  }
  else if(mouseX > x9 - (dim9/2)*cellWidth + margemBlocos && mouseX < x9 + (dim9/2)*cellWidth - margemBlocos && mouseY > y9 - cellWidth/2 + margemBlocos && mouseY < y9 + cellWidth/2 - margemBlocos)
  {
    limitesX(x9, dim9);
    z = mouseX - x9;
    obstaculoX(x9, y9, dim9, x2, y2, dim2);
    obstaculoX(x9, y9, dim9, x3, y3, dim3);
    obstaculoX(x9, y9, dim9, x7, y7, dim7);
    obstaculoX(x9, y9, dim9, x8, y8, dim8);
    obstaculoX(x9, y9, dim9, x10, y10, dim10);
    obstaculoX(x9, y9, dim9, x12, y12, dim12);
    obstaculoX(x9, y9, dim9, x15, y15, dim15);
    obstaculoXsame(x9, dim9, x4, dim4);
    obstaculoXsame(x9, dim9, x14, dim14);
    click9 = true;
  }
  else if(mouseX > x10 - cellHeight/2 + margemBlocos && mouseX < x10 + cellHeight/2 - margemBlocos && mouseY > y10 - (dim10/2)*cellHeight + margemBlocos && mouseY < y10 + (dim10/2)*cellHeight - margemBlocos)
  {
    limitesY(y10, dim10);
    z = mouseY - y10; 
    obstaculoY(x10, y10, dim10, x1, y1, dim1);
    obstaculoY(x10, y10, dim10, x4, y4, dim4);
    obstaculoY(x10, y10, dim10, x5, y5, dim5);
    obstaculoY(x10, y10, dim10, x6, y6, dim6);
    obstaculoY(x10, y10, dim10, x9, y9, dim9);
    obstaculoY(x10, y10, dim10, x11, y11, dim11);
    obstaculoY(x10, y10, dim10, x13, y13, dim13);
    obstaculoY(x10, y10, dim10, x14, y14, dim14);
    click10 = true;
  }
  else if(mouseX > x11 - (dim11/2)*cellWidth + margemBlocos && mouseX < x11 + (dim11/2)*cellWidth - margemBlocos && mouseY > y11 - cellWidth/2 + margemBlocos && mouseY < y11 + cellWidth/2 - margemBlocos)
  {
    limitesX(x11, dim11);
    z = mouseX - x11;
    obstaculoX(x11, y11, dim11, x2, y2, dim2);
    obstaculoX(x11, y11, dim11, x3, y3, dim3);
    obstaculoX(x11, y11, dim11, x7, y7, dim7);
    obstaculoX(x11, y11, dim11, x8, y8, dim8);
    obstaculoX(x11, y11, dim11, x10, y10, dim10);
    obstaculoX(x11, y11, dim11, x12, y12, dim12);
    obstaculoX(x11, y11, dim11, x15, y15, dim15);
    click11 = true;
  }
  else if(mouseX > x12 - cellHeight/2 + margemBlocos && mouseX < x12 + cellHeight/2 - margemBlocos && mouseY > y12 - (dim12/2)*cellHeight + margemBlocos && mouseY < y12 + (dim12/2)*cellHeight - margemBlocos)
  {
    limitesY(y12, dim12);
    z = mouseY - y12; 
    obstaculoY(x12, y12, dim12, x1, y1, dim1);
    obstaculoY(x12, y12, dim12, x4, y4, dim4);
    obstaculoY(x12, y12, dim12, x5, y5, dim5);
    obstaculoY(x12, y12, dim12, x6, y6, dim6);
    obstaculoY(x12, y12, dim12, x9, y9, dim9);
    obstaculoY(x12, y12, dim12, x11, y11, dim11);
    obstaculoY(x12, y12, dim12, x13, y13, dim13);
    obstaculoY(x12, y12, dim12, x14, y14, dim14);
    click12 = true;
  }
  else if(mouseX > x13 - (dim13/2)*cellWidth + margemBlocos && mouseX < x13 + (dim13/2)*cellWidth - margemBlocos && mouseY > y13 - cellWidth/2 + margemBlocos && mouseY < y13 + cellWidth/2 - margemBlocos)
  {
    limitesX(x13, dim13);
    z = mouseX - x13;
    obstaculoX(x13, y13, dim13, x2, y2, dim2);
    obstaculoX(x13, y13, dim13, x3, y3, dim3);
    obstaculoX(x13, y13, dim13, x7, y7, dim7);
    obstaculoX(x13, y13, dim13, x8, y8, dim8);
    obstaculoX(x13, y13, dim13, x10, y10, dim10);
    obstaculoX(x13, y13, dim13, x12, y12, dim12);
    obstaculoX(x13, y13, dim13, x15, y15, dim15);
    click13 = true;
  }
  else if(mouseX > x14 - (dim14/2)*cellWidth + margemBlocos && mouseX < x14 + (dim14/2)*cellWidth - margemBlocos && mouseY > y14 - cellWidth/2 + margemBlocos && mouseY < y14 + cellWidth/2 - margemBlocos)
  {
    limitesX(x14, dim14);
    z = mouseX - x14;
    obstaculoX(x14, y14, dim14, x2, y2, dim2);
    obstaculoX(x14, y14, dim14, x3, y3, dim3);
    obstaculoX(x14, y14, dim14, x7, y7, dim7);
    obstaculoX(x14, y14, dim14, x8, y8, dim8);
    obstaculoX(x14, y14, dim14, x10, y10, dim10);
    obstaculoX(x14, y14, dim14, x12, y12, dim12);
    obstaculoX(x14, y14, dim14, x15, y15, dim15);
    obstaculoXsame(x14, dim14, x9, dim9);
    click14 = true;
  }
  else if(mouseX > x15 - cellHeight/2 + margemBlocos && mouseX < x15 + cellHeight/2 - margemBlocos && mouseY > y15 - (dim15/2)*cellHeight + margemBlocos && mouseY < y15 + (dim15/2)*cellHeight - margemBlocos)
  {
    limitesY(y15, dim15);
    z = mouseY - y15; 
    obstaculoY(x15, y15, dim15, x1, y1, dim1);
    obstaculoY(x15, y15, dim15, x4, y4, dim4);
    obstaculoY(x15, y15, dim15, x5, y5, dim5);
    obstaculoY(x15, y15, dim15, x6, y6, dim6);
    obstaculoY(x15, y15, dim15, x9, y9, dim9);
    obstaculoY(x15, y15, dim15, x11, y11, dim11);
    obstaculoY(x15, y15, dim15, x13, y13, dim13);
    obstaculoY(x15, y15, dim15, x14, y14, dim14);
    click15 = true;
  }
}

void mover3()
{
  if(click1 && x - mouseX <= esquerda && x - mouseX >= direita)
    x1 = mouseX - z;
  else if(click2 && y - mouseY >= baixo && y - mouseY <= cima)
    y2 = mouseY - z;
  else if(click3 && y - mouseY >= baixo && y - mouseY <= cima)
    y3 = mouseY - z;
  else if(click4 && x - mouseX <= esquerda && x - mouseX >= direita)
    x4 = mouseX - z;
  else if(click5 && x - mouseX <= esquerda && x - mouseX >= direita)
    x5 = mouseX - z;
  else if(click6 && x - mouseX <= esquerda && x - mouseX >= direita)
    x6 = mouseX - z;
  else if(click7 && y - mouseY >= baixo && y - mouseY <= cima)
    y7 = mouseY - z;
  else if(click8 && y - mouseY >= baixo && y - mouseY <= cima)
    y8 = mouseY - z;
  else if(click9 && x - mouseX <= esquerda && x - mouseX >= direita)
    x9 = mouseX - z;
  else if(click10 && y - mouseY >= baixo && y - mouseY <= cima)
    y10 = mouseY - z;
  else if(click11 && x - mouseX <= esquerda && x - mouseX >= direita)
    x11 = mouseX - z;
  else if(click12 && y - mouseY >= baixo && y - mouseY <= cima)
    y12 = mouseY - z;
  else if(click13 && x - mouseX <= esquerda && x - mouseX >= direita)
    x13 = mouseX - z;
  else if(click14 && x - mouseX <= esquerda && x - mouseX >= direita)
    x14 = mouseX - z;
  else if(click15 && y - mouseY >= baixo && y - mouseY <= cima)
    y15 = mouseY - z;
}



/////////////////////////////////////////////////
/////////////////////////////////////////////////
/////                                       /////
/////                NIVEL 4                /////  
/////                                       /////
/////////////////////////////////////////////////
/////////////////////////////////////////////////

void setup4()
{
  x1 = 2*cellHeight + margemTemp;
  y1 = 3*cellHeight + margemHeight + cellHeight/2;
  dim1 = 2;
  x2 = cellHeight/2 + margemTemp;
  y2 = 2*cellHeight + margemHeight;
  dim2 = 4;
  x3 = cellHeight + margemTemp + cellHeight/2;
  y3 = 4*cellHeight + margemHeight + cellHeight/2;
  dim3 = 3;
  x4 = cellHeight + margemTemp + cellHeight/2;
  y4 = 5*cellHeight + margemHeight + cellHeight/2;
  dim4 = 3;
  x5 = cellHeight + margemTemp + cellHeight/2;
  y5 = 6*cellHeight + margemHeight + cellHeight/2;
  dim5 = 3;
  x6 = 2*cellHeight + margemTemp;
  y6 = 7*cellHeight + margemHeight + cellHeight/2;
  dim6 = 4;
  x7 = cellHeight + margemTemp + cellHeight/2;
  y7 = cellHeight + margemHeight + cellHeight/2;
  dim7 = 3;
  x8 = 3*cellHeight + margemTemp+ cellHeight/2;
  y8 = 8*cellHeight + margemHeight + cellHeight/2;
  dim8 = 5;
  x9 = 4*cellHeight + margemTemp;
  y9 = margemHeight + cellHeight/2;
  dim9 = 4;
  x10 = 3*cellHeight + margemTemp + cellHeight/2;
  y10 = 2*cellHeight + margemHeight + cellHeight/2;
  dim10 = 3;
  x11 = 4*cellHeight + margemTemp + cellHeight/2;
  y11 = 3*cellHeight + margemHeight + cellHeight/2;
  dim11 = 3;
  x12 = 7*cellHeight + margemTemp + cellHeight/2;
  y12 = cellHeight + margemHeight + cellHeight/2;
  dim12 = 5;
  x13 = 5*cellHeight + margemTemp + cellHeight/2;
  y13 = 3*cellHeight + margemHeight + cellHeight/2;
  dim13 = 3;
  x14 = 6*cellHeight + margemTemp + cellHeight/2;
  y14 = 5*cellHeight + margemHeight + cellHeight/2;
  dim14 = 3;
  x15 = 6*cellHeight + cellHeight/2 + margemTemp;
  y15 = 7*cellHeight + margemHeight + cellHeight/2;
  dim15 = 3;
  x16 = 8*cellHeight + margemTemp + cellHeight/2;
  y16 = 6*cellHeight + margemHeight + cellHeight/2;
  dim16 = 3;
  x17 = 8*cellHeight + margemTemp + cellHeight/2;
  y17 = 7*cellHeight + margemHeight + cellHeight/2;
  dim17 = 3;
  x18 = 8*cellHeight + margemTemp + cellHeight/2;
  y18 = 3*cellHeight + margemHeight + cellHeight/2;
  dim18 = 3;
  x19 = 9*cellHeight + margemTemp + cellHeight/2;
  y19 = 4*cellHeight + margemHeight;
  dim19 = 4;
}

void level4()
{
  if(mouseX > x1 - (dim1/2)*cellWidth + margemBlocos && mouseX < x1 + (dim1/2)*cellWidth - margemBlocos && mouseY > y1 - cellWidth/2 + margemBlocos && mouseY < y1 + cellWidth/2 - margemBlocos)
  {
    limitesX(x1, dim1);
    direita = -9999;
    z = mouseX - x1;
    obstaculoX(x1, y1, dim1, x2, y2, dim2);
    obstaculoX(x1, y1, dim1, x7, y7, dim7);
    obstaculoX(x1, y1, dim1, x10, y10, dim10);
    obstaculoX(x1, y1, dim1, x11, y11, dim11);
    obstaculoX(x1, y1, dim1, x13, y13, dim13);
    obstaculoX(x1, y1, dim1, x15, y15, dim15);
    obstaculoX(x1, y1, dim1, x18, y18, dim18);
    obstaculoX(x1, y1, dim1, x19, y19, dim19);
    click1 = true;
  }
  else if(mouseX > x2 - cellHeight/2 + margemBlocos && mouseX < x2 + cellHeight/2 - margemBlocos && mouseY > y2 - (dim2/2)*cellHeight + margemBlocos && mouseY < y2 + (dim2/2)*cellHeight - margemBlocos)
  {
    limitesY(y2, dim2);
    z = mouseY - y2; 
    obstaculoY(x2, y2, dim2, x1, y1, dim1);
    obstaculoY(x2, y2, dim2, x3, y3, dim3);
    obstaculoY(x2, y2, dim2, x4, y4, dim4);
    obstaculoY(x2, y2, dim2, x5, y5, dim5);
    obstaculoY(x2, y2, dim2, x6, y6, dim6);
    obstaculoY(x2, y2, dim2, x8, y8, dim8);
    obstaculoY(x2, y2, dim2, x9, y9, dim9);
    obstaculoY(x2, y2, dim2, x12, y12, dim12);
    obstaculoY(x2, y2, dim2, x14, y14, dim14);
    obstaculoY(x2, y2, dim2, x16, y16, dim16);
    obstaculoY(x2, y2, dim2, x17, y17, dim17);
    click2 = true;
  }
  else if(mouseX > x3 - (dim3/2)*cellWidth + margemBlocos && mouseX < x3 + (dim3/2)*cellWidth - margemBlocos && mouseY > y3 - cellWidth/2 + margemBlocos && mouseY < y3 + cellWidth/2 - margemBlocos)
  {
    limitesX(x3, dim3);
    z = mouseX - x3;
    obstaculoX(x3, y3, dim3, x2, y2, dim2);
    obstaculoX(x3, y3, dim3, x7, y7, dim7);
    obstaculoX(x3, y3, dim3, x10, y10, dim10);
    obstaculoX(x3, y3, dim3, x11, y11, dim11);
    obstaculoX(x3, y3, dim3, x13, y13, dim13);
    obstaculoX(x3, y3, dim3, x15, y15, dim15);
    obstaculoX(x3, y3, dim3, x18, y18, dim18);
    obstaculoX(x3, y3, dim3, x19, y19, dim19);
    click3 = true;
  }
  else if(mouseX > x4 - (dim4/2)*cellWidth + margemBlocos && mouseX < x4 + (dim4/2)*cellWidth - margemBlocos && mouseY > y4 - cellWidth/2 + margemBlocos && mouseY < y4 + cellWidth/2 - margemBlocos)
  {
    limitesX(x4, dim4);
    z = mouseX - x4;
    obstaculoX(x4, y4, dim4, x2, y2, dim2);
    obstaculoX(x4, y4, dim4, x7, y7, dim7);
    obstaculoX(x4, y4, dim4, x10, y10, dim10);
    obstaculoX(x4, y4, dim4, x11, y11, dim11);
    obstaculoX(x4, y4, dim4, x13, y13, dim13);
    obstaculoX(x4, y4, dim4, x15, y15, dim15);
    obstaculoX(x4, y4, dim4, x18, y18, dim18);
    obstaculoX(x4, y4, dim4, x19, y19, dim19);
    obstaculoXsame(x4, dim4, x14, dim14);
    click4 = true;
  }
  else if(mouseX > x5 - (dim5/2)*cellWidth + margemBlocos && mouseX < x5 + (dim5/2)*cellWidth - margemBlocos && mouseY > y5 - cellWidth/2 + margemBlocos && mouseY < y5 + cellWidth/2 - margemBlocos)
  {
    limitesX(x5, dim5);
    z = mouseX - x5;
    obstaculoX(x5, y5, dim5, x2, y2, dim2);
    obstaculoX(x5, y5, dim5, x7, y7, dim7);
    obstaculoX(x5, y5, dim5, x10, y10, dim10);
    obstaculoX(x5, y5, dim5, x11, y11, dim11);
    obstaculoX(x5, y5, dim5, x13, y13, dim13);
    obstaculoX(x5, y5, dim5, x15, y15, dim15);
    obstaculoX(x5, y5, dim5, x18, y18, dim18);
    obstaculoX(x5, y5, dim5, x19, y19, dim19);
    obstaculoXsame(x5, dim5, x16, dim16);
    click5 = true;
  }
  else if(mouseX > x6 - (dim6/2)*cellWidth + margemBlocos && mouseX < x6 + (dim6/2)*cellWidth - margemBlocos && mouseY > y6 - cellWidth/2 + margemBlocos && mouseY < y6 + cellWidth/2 - margemBlocos)
  {
    limitesX(x6, dim6);
    z = mouseX - x6;
    obstaculoX(x6, y6, dim6, x2, y2, dim2);
    obstaculoX(x6, y6, dim6, x7, y7, dim7);
    obstaculoX(x6, y6, dim6, x10, y10, dim10);
    obstaculoX(x6, y6, dim6, x11, y11, dim11);
    obstaculoX(x6, y6, dim6, x13, y13, dim13);
    obstaculoX(x6, y6, dim6, x15, y15, dim15);
    obstaculoX(x6, y6, dim6, x18, y18, dim18);
    obstaculoX(x6, y6, dim6, x19, y19, dim19);
    obstaculoXsame(x6, dim6, x17, dim17);
    click6 = true;
  }
  else if(mouseX > x7 - cellHeight/2 + margemBlocos && mouseX < x7 + cellHeight/2 - margemBlocos && mouseY > y7 - (dim7/2)*cellHeight + margemBlocos && mouseY < y7 + (dim7/2)*cellHeight - margemBlocos)
  {
    limitesY(y7, dim7);
    z = mouseY - y7; 
    obstaculoY(x7, y7, dim7, x1, y1, dim1);
    obstaculoY(x7, y7, dim7, x3, y3, dim3);
    obstaculoY(x7, y7, dim7, x4, y4, dim4);
    obstaculoY(x7, y7, dim7, x5, y5, dim5);
    obstaculoY(x7, y7, dim7, x6, y6, dim6);
    obstaculoY(x7, y7, dim7, x8, y8, dim8);
    obstaculoY(x7, y7, dim7, x9, y9, dim9);
    obstaculoY(x7, y7, dim7, x12, y12, dim12);
    obstaculoY(x7, y7, dim7, x14, y14, dim14);
    obstaculoY(x7, y7, dim7, x16, y16, dim16);
    obstaculoY(x7, y7, dim7, x17, y17, dim17);
    click7 = true;
  }
  else if(mouseX > x8 - (dim8/2)*cellWidth + margemBlocos && mouseX < x8 + (dim8/2)*cellWidth - margemBlocos && mouseY > y8 - cellWidth/2 + margemBlocos && mouseY < y8 + cellWidth/2 - margemBlocos)
  {
    limitesX(x8, dim8);
    z = mouseX - x8;
    obstaculoX(x8, y8, dim8, x2, y2, dim2);
    obstaculoX(x8, y8, dim8, x7, y7, dim7);
    obstaculoX(x8, y8, dim8, x10, y10, dim10);
    obstaculoX(x8, y8, dim8, x11, y11, dim11);
    obstaculoX(x8, y8, dim8, x13, y13, dim13);
    obstaculoX(x8, y8, dim8, x15, y15, dim15);
    obstaculoX(x8, y8, dim8, x18, y18, dim18);
    obstaculoX(x8, y8, dim8, x19, y19, dim19);
    click8 = true;
  }
  else if(mouseX > x9 - (dim9/2)*cellWidth + margemBlocos && mouseX < x9 + (dim9/2)*cellWidth - margemBlocos && mouseY > y9 - cellWidth/2 + margemBlocos && mouseY < y9 + cellWidth/2 - margemBlocos)
  {
    limitesX(x9, dim9);
    z = mouseX - x9;
    obstaculoX(x9, y9, dim9, x2, y2, dim2);
    obstaculoX(x9, y9, dim9, x7, y7, dim7);
    obstaculoX(x9, y9, dim9, x10, y10, dim10);
    obstaculoX(x9, y9, dim9, x11, y11, dim11);
    obstaculoX(x9, y9, dim9, x13, y13, dim13);
    obstaculoX(x9, y9, dim9, x15, y15, dim15);
    obstaculoX(x9, y9, dim9, x18, y18, dim18);
    obstaculoX(x9, y9, dim9, x19, y19, dim19);
    click9 = true;
  }
  else if(mouseX > x10 - cellHeight/2 + margemBlocos && mouseX < x10 + cellHeight/2 - margemBlocos && mouseY > y10 - (dim10/2)*cellHeight + margemBlocos && mouseY < y10 + (dim10/2)*cellHeight - margemBlocos)
  {
    limitesY(y10, dim10);
    z = mouseY - y10; 
    obstaculoY(x10, y10, dim10, x1, y1, dim1);
    obstaculoY(x10, y10, dim10, x3, y3, dim3);
    obstaculoY(x10, y10, dim10, x4, y4, dim4);
    obstaculoY(x10, y10, dim10, x5, y5, dim5);
    obstaculoY(x10, y10, dim10, x6, y6, dim6);
    obstaculoY(x10, y10, dim10, x8, y8, dim8);
    obstaculoY(x10, y10, dim10, x9, y9, dim9);
    obstaculoY(x10, y10, dim10, x12, y12, dim12);
    obstaculoY(x10, y10, dim10, x14, y14, dim14);
    obstaculoY(x10, y10, dim10, x16, y16, dim16);
    obstaculoY(x10, y10, dim10, x17, y17, dim17);
    click10 = true;
  }
  else if(mouseX > x11 - cellHeight/2 + margemBlocos && mouseX < x11 + cellHeight/2 - margemBlocos && mouseY > y11 - (dim11/2)*cellHeight + margemBlocos && mouseY < y11 + (dim11/2)*cellHeight - margemBlocos)
  {
    limitesY(y11, dim11);
    z = mouseY - y11; 
    obstaculoY(x11, y11, dim11, x1, y1, dim1);
    obstaculoY(x11, y11, dim11, x3, y3, dim3);
    obstaculoY(x11, y11, dim11, x4, y4, dim4);
    obstaculoY(x11, y11, dim11, x5, y5, dim5);
    obstaculoY(x11, y11, dim11, x6, y6, dim6);
    obstaculoY(x11, y11, dim11, x8, y8, dim8);
    obstaculoY(x11, y11, dim11, x9, y9, dim9);
    obstaculoY(x11, y11, dim11, x12, y12, dim12);
    obstaculoY(x11, y11, dim11, x14, y14, dim14);
    obstaculoY(x11, y11, dim11, x16, y16, dim16);
    obstaculoY(x11, y11, dim11, x17, y17, dim17);
    click11 = true;
  }
  else if(mouseX > x12 - (dim12/2)*cellWidth + margemBlocos && mouseX < x12 + (dim12/2)*cellWidth - margemBlocos && mouseY > y12 - cellWidth/2 + margemBlocos && mouseY < y12 + cellWidth/2 - margemBlocos)
  {
    limitesX(x12, dim12);
    z = mouseX - x12;
    obstaculoX(x12, y12, dim12, x2, y2, dim2);
    obstaculoX(x12, y12, dim12, x7, y7, dim7);
    obstaculoX(x12, y12, dim12, x10, y10, dim10);
    obstaculoX(x12, y12, dim12, x11, y11, dim11);
    obstaculoX(x12, y12, dim12, x13, y13, dim13);
    obstaculoX(x12, y12, dim12, x15, y15, dim15);
    obstaculoX(x12, y12, dim12, x18, y18, dim18);
    obstaculoX(x12, y12, dim12, x19, y19, dim19);
    click12 = true;
  }
  else if(mouseX > x13 - cellHeight/2 + margemBlocos && mouseX < x13 + cellHeight/2 - margemBlocos && mouseY > y13 - (dim13/2)*cellHeight + margemBlocos && mouseY < y13 + (dim13/2)*cellHeight - margemBlocos)
  {
    limitesY(y13, dim13);
    z = mouseY - y13; 
    obstaculoY(x13, y13, dim13, x1, y1, dim1);
    obstaculoY(x13, y13, dim13, x3, y3, dim3);
    obstaculoY(x13, y13, dim13, x4, y4, dim4);
    obstaculoY(x13, y13, dim13, x5, y5, dim5);
    obstaculoY(x13, y13, dim13, x6, y6, dim6);
    obstaculoY(x13, y13, dim13, x8, y8, dim8);
    obstaculoY(x13, y13, dim13, x9, y9, dim9);
    obstaculoY(x13, y13, dim13, x12, y12, dim12);
    obstaculoY(x13, y13, dim13, x14, y14, dim14);
    obstaculoY(x13, y13, dim13, x16, y16, dim16);
    obstaculoY(x13, y13, dim13, x17, y17, dim17);
    click13 = true;
  }
  else if(mouseX > x14 - (dim14/2)*cellWidth + margemBlocos && mouseX < x14 + (dim14/2)*cellWidth - margemBlocos && mouseY > y14 - cellWidth/2 + margemBlocos && mouseY < y14 + cellWidth/2 - margemBlocos)
  {
    limitesX(x14, dim14);
    z = mouseX - x14;
    obstaculoX(x14, y14, dim14, x2, y2, dim2);
    obstaculoX(x14, y14, dim14, x7, y7, dim7);
    obstaculoX(x14, y14, dim14, x10, y10, dim10);
    obstaculoX(x14, y14, dim14, x11, y11, dim11);
    obstaculoX(x14, y14, dim14, x13, y13, dim13);
    obstaculoX(x14, y14, dim14, x15, y15, dim15);
    obstaculoX(x14, y14, dim14, x18, y18, dim18);
    obstaculoX(x14, y14, dim14, x19, y19, dim19);
    obstaculoXsame(x14, dim14, x4, dim4);
    click14 = true;
  }
  else if(mouseX > x15 - cellHeight/2 + margemBlocos && mouseX < x15 + cellHeight/2 - margemBlocos && mouseY > y15 - (dim15/2)*cellHeight + margemBlocos && mouseY < y15 + (dim15/2)*cellHeight - margemBlocos)
  {
    limitesY(y15, dim15);
    z = mouseY - y15; 
    obstaculoY(x15, y15, dim15, x1, y1, dim1);
    obstaculoY(x15, y15, dim15, x3, y3, dim3);
    obstaculoY(x15, y15, dim15, x4, y4, dim4);
    obstaculoY(x15, y15, dim15, x5, y5, dim5);
    obstaculoY(x15, y15, dim15, x6, y6, dim6);
    obstaculoY(x15, y15, dim15, x8, y8, dim8);
    obstaculoY(x15, y15, dim15, x9, y9, dim9);
    obstaculoY(x15, y15, dim15, x12, y12, dim12);
    obstaculoY(x15, y15, dim15, x14, y14, dim14);
    obstaculoY(x15, y15, dim15, x16, y16, dim16);
    obstaculoY(x15, y15, dim15, x17, y17, dim17);
    click15 = true;
  }
  else if(mouseX > x16 - (dim16/2)*cellWidth + margemBlocos && mouseX < x16 + (dim16/2)*cellWidth - margemBlocos && mouseY > y16 - cellWidth/2 + margemBlocos && mouseY < y16 + cellWidth/2 - margemBlocos)
  {
    limitesX(x16, dim16);
    z = mouseX - x16;
    obstaculoX(x16, y16, dim16, x2, y2, dim2);
    obstaculoX(x16, y16, dim16, x7, y7, dim7);
    obstaculoX(x16, y16, dim16, x10, y10, dim10);
    obstaculoX(x16, y16, dim16, x11, y11, dim11);
    obstaculoX(x16, y16, dim16, x13, y13, dim13);
    obstaculoX(x16, y16, dim16, x15, y15, dim15);
    obstaculoX(x16, y16, dim16, x18, y18, dim18);
    obstaculoX(x16, y16, dim16, x19, y19, dim19);
    obstaculoXsame(x16, dim16, x5, dim5);
    click16 = true;
  }
  else if(mouseX > x17 - (dim17/2)*cellWidth + margemBlocos && mouseX < x17 + (dim17/2)*cellWidth - margemBlocos && mouseY > y17 - cellWidth/2 + margemBlocos && mouseY < y17 + cellWidth/2 - margemBlocos)
  {
    limitesX(x17, dim17);
    z = mouseX - x17;
    obstaculoX(x17, y17, dim17, x2, y2, dim2);
    obstaculoX(x17, y17, dim17, x7, y7, dim7);
    obstaculoX(x17, y17, dim17, x10, y10, dim10);
    obstaculoX(x17, y17, dim17, x11, y11, dim11);
    obstaculoX(x17, y17, dim17, x13, y13, dim13);
    obstaculoX(x17, y17, dim17, x15, y15, dim15);
    obstaculoX(x17, y17, dim17, x18, y18, dim18);
    obstaculoX(x17, y17, dim17, x19, y19, dim19);
    obstaculoXsame(x17, dim17, x6, dim6);
    click17 = true;
  }
  else if(mouseX > x18 - cellHeight/2 + margemBlocos && mouseX < x18 + cellHeight/2 - margemBlocos && mouseY > y18 - (dim18/2)*cellHeight + margemBlocos && mouseY < y18 + (dim18/2)*cellHeight - margemBlocos)
  {
    limitesY(y18, dim18);
    z = mouseY - y18; 
    obstaculoY(x18, y18, dim18, x1, y1, dim1);
    obstaculoY(x18, y18, dim18, x3, y3, dim3);
    obstaculoY(x18, y18, dim18, x4, y4, dim4);
    obstaculoY(x18, y18, dim18, x5, y5, dim5);
    obstaculoY(x18, y18, dim18, x6, y6, dim6);
    obstaculoY(x18, y18, dim18, x8, y8, dim8);
    obstaculoY(x18, y18, dim18, x9, y9, dim9);
    obstaculoY(x18, y18, dim18, x12, y12, dim12);
    obstaculoY(x18, y18, dim18, x14, y14, dim14);
    obstaculoY(x18, y18, dim18, x16, y16, dim16);
    obstaculoY(x18, y18, dim18, x17, y17, dim17);
    click18 = true;
  }
  else if(mouseX > x19 - cellHeight/2 + margemBlocos && mouseX < x19 + cellHeight/2 - margemBlocos && mouseY > y19 - (dim19/2)*cellHeight + margemBlocos && mouseY < y19 + (dim19/2)*cellHeight - margemBlocos)
  {
    limitesY(y19, dim19);
    z = mouseY - y19; 
    obstaculoY(x19, y19, dim19, x1, y1, dim1);
    obstaculoY(x19, y19, dim19, x3, y3, dim3);
    obstaculoY(x19, y19, dim19, x4, y4, dim4);
    obstaculoY(x19, y19, dim19, x5, y5, dim5);
    obstaculoY(x19, y19, dim19, x6, y6, dim6);
    obstaculoY(x19, y19, dim19, x8, y8, dim8);
    obstaculoY(x19, y19, dim19, x9, y9, dim9);
    obstaculoY(x19, y19, dim19, x12, y12, dim12);
    obstaculoY(x19, y19, dim19, x14, y14, dim14);
    obstaculoY(x19, y19, dim19, x16, y16, dim16);
    obstaculoY(x19, y19, dim19, x17, y17, dim17);
    click19 = true;
  }
}

void mover4()
{
  if(click1 && x - mouseX <= esquerda && x - mouseX >= direita)
    x1 = mouseX - z;
  else if(click2 && y - mouseY >= baixo && y - mouseY <= cima)
    y2 = mouseY - z;
  else if(click3 && x - mouseX <= esquerda && x - mouseX >= direita)
    x3 = mouseX - z;
  else if(click4 && x - mouseX <= esquerda && x - mouseX >= direita)
    x4 = mouseX - z;
  else if(click5 && x - mouseX <= esquerda && x - mouseX >= direita)
    x5 = mouseX - z;
  else if(click6 && x - mouseX <= esquerda && x - mouseX >= direita)
    x6 = mouseX - z;
  else if(click7 && y - mouseY >= baixo && y - mouseY <= cima)
    y7 = mouseY - z;
  else if(click8 && x - mouseX <= esquerda && x - mouseX >= direita)
    x8 = mouseX - z;
  else if(click9 && x - mouseX <= esquerda && x - mouseX >= direita)
    x9 = mouseX - z;
  else if(click10 && y - mouseY >= baixo && y - mouseY <= cima)
    y10 = mouseY - z;
  else if(click11 && y - mouseY >= baixo && y - mouseY <= cima)
    y11 = mouseY - z;
  else if(click12 && x - mouseX <= esquerda && x - mouseX >= direita)
    x12 = mouseX - z;
  else if(click13 && y - mouseY >= baixo && y - mouseY <= cima)
    y13 = mouseY - z;
  else if(click14 && x - mouseX <= esquerda && x - mouseX >= direita)
    x14 = mouseX - z;
  else if(click15 && y - mouseY >= baixo && y - mouseY <= cima)
    y15 = mouseY - z;
  else if(click16 && x - mouseX <= esquerda && x - mouseX >= direita)
    x16 = mouseX - z;
  else if(click17 && x - mouseX <= esquerda && x - mouseX >= direita)
    x17 = mouseX - z;
  else if(click18 && y - mouseY >= baixo && y - mouseY <= cima)
    y18 = mouseY - z;
  else if(click19 && y - mouseY >= baixo && y - mouseY <= cima)
    y19 = mouseY - z;
}