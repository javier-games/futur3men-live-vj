int     slct   =0; 
boolean intr[] ={false,false,false,false,false,false,false,false,false,false,false,false,false,false};
boolean coro[] ={false,false,false,false,false,false,false,false,false,false,false,false};


PFont font;
String name_font = "Courier New";
int size_font;
float size_factor_font;
float size_separate_font;
float display_factor = 2;

void setup(){
  size(1080,700,P3D);
  //size(round(displayWidth/display_factor),round(displayHeight/display_factor), P3D);
  size_factor_font = height*0.8/5;
  size_font = round(size_factor_font);
  size_separate_font = round(width*1.1/24);
  font = createFont(name_font,size_font);
}

void draw(){
  background(255);
  textAlign(CENTER);
  textFont(font);
  fill(0);
  
  
  if( slct == 1 ){
    for(int i = 0; i < 18; i++){
      if( i<3 && i>-1 && intr[0])
        text(char(round(random(125))),size_separate_font/2+width/2-(9-i)*size_separate_font, height - 4*size_factor_font);
      if( i<6 && i>2 && intr[1])
        text(char(round(random(125))),size_separate_font/2+width/2-(9-i)*size_separate_font, height - 4*size_factor_font);
      if( i<8 && i>5 && intr[2])
        text(char(round(random(125))),size_separate_font/2+width/2-(9-i)*size_separate_font, height - 4*size_factor_font);
      if( i<15 && i>7 && intr[3])
        text(char(round(random(125))),size_separate_font/2+width/2-(9-i)*size_separate_font, height - 4*size_factor_font);
      if( i<19 && i>14 && intr[4])
        text(char(round(random(125))),size_separate_font/2+width/2-(9-i)*size_separate_font, height - 4*size_factor_font);
    }
    for(int i = 0; i < 20; i++){
      if( i<7 && i>=0 && intr[5] )
        text(char(round(random(125))),size_separate_font/2+width/2-(10-i)*size_separate_font, height - 3*size_factor_font);
      if( i<11 && i>=7 && intr[6] )
        text(char(round(random(125))),size_separate_font/2+width/2-(10-i)*size_separate_font, height - 3*size_factor_font);
      if( i<14 && i>=11 && intr[7] )
        text(char(round(random(125))),size_separate_font/2+width/2-(10-i)*size_separate_font, height - 3*size_factor_font);
      if( i<=20 && i>=14 && intr[8] )
        text(char(round(random(125))),size_separate_font/2+width/2-(10-i)*size_separate_font, height - 3*size_factor_font);
    }
    for(int i = 0; i < 16; i++){
      if( i<2 && i>=0 && intr[9] )
        text(char(round(random(125))),size_separate_font/2+width/2-(8-i)*size_separate_font, height - 2*size_factor_font);
      if( i<5 && i>=2 && intr[10] )
        text(char(round(random(125))),size_separate_font/2+width/2-(8-i)*size_separate_font, height - 2*size_factor_font);
      if( i<7 && i>=5 && intr[11] )
        text(char(round(random(125))),size_separate_font/2+width/2-(8-i)*size_separate_font, height - 2*size_factor_font);
      if( i<12 && i>=7 && intr[12] )
        text(char(round(random(125))),size_separate_font/2+width/2-(8-i)*size_separate_font, height - 2*size_factor_font);
      if( i<16 && i>=12 && intr[13] )
        text(char(round(random(125))),size_separate_font/2+width/2-(8-i)*size_separate_font, height - 2*size_factor_font);
    }
  }
  
  
  
  if( slct == 2 ){
    if(coro[0]){
      text("W",size_separate_font/2+width/2-(9)*size_separate_font, height - 4*size_factor_font);
      text("h",size_separate_font/2+width/2-(8)*size_separate_font, height - 4*size_factor_font);
      text("a",size_separate_font/2+width/2-(7)*size_separate_font, height - 4*size_factor_font);
      text("t",size_separate_font/2+width/2-(6)*size_separate_font, height - 4*size_factor_font);
    }
    else{
      for(int i = 0; i < 4; i++){
        text(char(round(random(125))),size_separate_font/2+width/2-(9-i)*size_separate_font, height - 4*size_factor_font);
      }
    }
    if(coro[1]){
      text("/",size_separate_font/2+width/2-(5)*size_separate_font, height - 4*size_factor_font);
      text("w",size_separate_font/2+width/2-(4)*size_separate_font, height - 4*size_factor_font);
      text("e",size_separate_font/2+width/2-(3)*size_separate_font, height - 4*size_factor_font);
    }
    else{
      for(int i = 4; i < 7; i++){
        text(char(round(random(125))),size_separate_font/2+width/2-(9-i)*size_separate_font, height - 4*size_factor_font);
      }
    }
    if(coro[2]){
      text("/",size_separate_font/2+width/2-(2)*size_separate_font, height - 4*size_factor_font);
      text("t",size_separate_font/2+width/2-(1)*size_separate_font, height - 4*size_factor_font);
      text("a",size_separate_font/2+width/2-(0)*size_separate_font, height - 4*size_factor_font);
      text("l",size_separate_font/2+width/2-(-1)*size_separate_font, height - 4*size_factor_font);
      text("k",size_separate_font/2+width/2-(-2)*size_separate_font, height - 4*size_factor_font);
    }
    else{
      for(int i = 7; i < 12; i++){
        text(char(round(random(125))),size_separate_font/2+width/2-(9-i)*size_separate_font, height - 4*size_factor_font);
      }
    }
    if(coro[3]){
      text("/",size_separate_font/2+width/2-(-3)*size_separate_font, height - 4*size_factor_font);
      text("a",size_separate_font/2+width/2-(-4)*size_separate_font, height - 4*size_factor_font);
      text("b",size_separate_font/2+width/2-(-5)*size_separate_font, height - 4*size_factor_font);
      text("o",size_separate_font/2+width/2-(-6)*size_separate_font, height - 4*size_factor_font);
      text("u",size_separate_font/2+width/2-(-7)*size_separate_font, height - 4*size_factor_font);
      text("t",size_separate_font/2+width/2-(-8)*size_separate_font, height - 4*size_factor_font);
    }
    else{
      for(int i = 12; i < 18; i++){
        text(char(round(random(125))),size_separate_font/2+width/2-(9-i)*size_separate_font, height - 4*size_factor_font);
      }
    }
    if(coro[4]){
      text("/",size_separate_font/2+width/2-(10)*size_separate_font, height - 3*size_factor_font);
      text("/",size_separate_font/2+width/2-(9)*size_separate_font, height - 3*size_factor_font);
      text("w",size_separate_font/2+width/2-(8)*size_separate_font, height - 3*size_factor_font);
      text("h",size_separate_font/2+width/2-(7)*size_separate_font, height - 3*size_factor_font);
      text("e",size_separate_font/2+width/2-(6)*size_separate_font, height - 3*size_factor_font);
      text("n",size_separate_font/2+width/2-(5)*size_separate_font, height - 3*size_factor_font);
      text("/",size_separate_font/2+width/2-(4)*size_separate_font, height - 3*size_factor_font);
    }
    else{
      for(int i = 0; i < 7; i++){
        text(char(round(random(125))),size_separate_font/2+width/2-(10-i)*size_separate_font, height - 3*size_factor_font);
      }
    }
    if(coro[5]){
      text("w",size_separate_font/2+width/2-(3)*size_separate_font, height - 3*size_factor_font);
      text("e",size_separate_font/2+width/2-(2)*size_separate_font, height - 3*size_factor_font);
      text("/",size_separate_font/2+width/2-(1)*size_separate_font, height - 3*size_factor_font);
      text("/",size_separate_font/2+width/2-(0)*size_separate_font, height - 3*size_factor_font);
      text("/",size_separate_font/2+width/2-(-1)*size_separate_font, height - 3*size_factor_font);
    }
    else{
      for(int i = 7; i < 12; i++){
        text(char(round(random(125))),size_separate_font/2+width/2-(10-i)*size_separate_font, height - 3*size_factor_font);
      }
    }
    if(coro[6]){
      text("t",size_separate_font/2+width/2-(-2)*size_separate_font, height - 3*size_factor_font);
      text("a",size_separate_font/2+width/2-(-3)*size_separate_font, height - 3*size_factor_font);
      text("l",size_separate_font/2+width/2-(-4)*size_separate_font, height - 3*size_factor_font);
      text("k",size_separate_font/2+width/2-(-5)*size_separate_font, height - 3*size_factor_font);
      text("/",size_separate_font/2+width/2-(-6)*size_separate_font, height - 3*size_factor_font);
      text("/",size_separate_font/2+width/2-(-7)*size_separate_font, height - 3*size_factor_font);
      text("/",size_separate_font/2+width/2-(-8)*size_separate_font, height - 3*size_factor_font);
      text("/",size_separate_font/2+width/2-(-9)*size_separate_font, height - 3*size_factor_font);
    }
    else{
      for(int i = 12; i < 20; i++){
        text(char(round(random(125))),size_separate_font/2+width/2-(10-i)*size_separate_font, height - 3*size_factor_font);
      }
    }
    if(coro[7]){
      text("a",size_separate_font/2+width/2-(8)*size_separate_font, height - 2*size_factor_font);
      text("b",size_separate_font/2+width/2-(7)*size_separate_font, height - 2*size_factor_font);
      text("o",size_separate_font/2+width/2-(6)*size_separate_font, height - 2*size_factor_font);
      text("u",size_separate_font/2+width/2-(5)*size_separate_font, height - 2*size_factor_font);
      text("t",size_separate_font/2+width/2-(4)*size_separate_font, height - 2*size_factor_font);
      text("/",size_separate_font/2+width/2-(3)*size_separate_font, height - 2*size_factor_font);
    }
    else{
      for(int i = 0; i < 6; i++){
        text(char(round(random(125))),size_separate_font/2+width/2-(8-i)*size_separate_font, height - 2*size_factor_font);
      }
    }
    if(coro[8]){
      text("t",size_separate_font/2+width/2-(2)*size_separate_font, height - 2*size_factor_font);
      text("h",size_separate_font/2+width/2-(1)*size_separate_font, height - 2*size_factor_font);
      text("e",size_separate_font/2+width/2-(0)*size_separate_font, height - 2*size_factor_font);
      text("/",size_separate_font/2+width/2-(-1)*size_separate_font, height - 2*size_factor_font);
      text("F",size_separate_font/2+width/2-(-2)*size_separate_font, height - 2*size_factor_font);
      text("u",size_separate_font/2+width/2-(-3)*size_separate_font, height - 2*size_factor_font);
      text("t",size_separate_font/2+width/2-(-4)*size_separate_font, height - 2*size_factor_font);
      text("u",size_separate_font/2+width/2-(-5)*size_separate_font, height - 2*size_factor_font);
      text("r",size_separate_font/2+width/2-(-6)*size_separate_font, height - 2*size_factor_font);
      text("e",size_separate_font/2+width/2-(-7)*size_separate_font, height - 2*size_factor_font);
      text("?",size_separate_font/2+width/2-(-8)*size_separate_font, height - 2*size_factor_font);
    }
    else{
      for(int i = 6; i < 16; i++){
        text(char(round(random(125))),size_separate_font/2+width/2-(8-i)*size_separate_font, height - 2*size_factor_font);
      }
    }
  }
  
  
  delay(50);
}

void keyPressed(){
  
  if( slct == 1 ){
  if( key == 'q')
    intr[0]=!intr[0];
  if( key == 'w')
    intr[1]=!intr[1];
  if( key == 'e')
    intr[2]=!intr[2];
  if( key == 'r')
    intr[3]=!intr[3];
  if( key == 't')
    intr[4]=!intr[4];
  if( key == 'a')
    intr[5]=!intr[5];
  if( key == 's')
    intr[6]=!intr[6];
  if( key == 'd')
    intr[7]=!intr[7];
  if( key == 'f')
    intr[8]=!intr[8];
  if( key == '<')
    intr[9]=!intr[9];
  if( key == 'z')
    intr[10]=!intr[10];
  if( key == 'x')
    intr[11]=!intr[11];
  if( key == 'c')
    intr[12]=!intr[12];
  if( key == 'v')
    intr[13]=!intr[13];
  }
  
  
  if( slct == 2 ){
    if( key == 'q')
      coro[0]=!coro[0];
    if( key == 'w')
      coro[1]=!coro[1];
    if( key == 'e')
      coro[2]=!coro[2];
    if( key == 'r')
      coro[3]=!coro[3];
    if( key == 'a')
      coro[4]=!coro[4];
    if( key == 's')
      coro[5]=!coro[5];
    if( key == 'd')
      coro[6]=!coro[6];
    if( key == 'z')
      coro[7]=!coro[7];
    if( key == 'x')
      coro[8]=!coro[8];
  }
  
  if(key=='1'){slct=1;}
  if(key=='2'){slct=2;}

}