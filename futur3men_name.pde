int size_Name = 100;
PFont font_Name;
PImage []glitch_Name;
int rndm_Name = 90;
int num_img = 11;
String[] name_fuente = {"Champagne&Limousines","Champagne&Limousines-BoldItalic","Champagne&Limousines-Bold","Champagne&Limousines-Italic"};
int alpha = 255;

void setup(){
  size(displayWidth, displayHeight);
  font_Name = createFont(name_fuente[0],size_Name);
  glitch_Name = new PImage[num_img];
  for(int i=0;i<num_img;i++){
    glitch_Name[i] = loadImage("futuremen"+i+".png");
  }
}

void draw(int n){
  
  textAlign(CENTER);
  
  background(0);
  
  if(key=='2'){rndm_Name = 95;quemar(glitch_Name,n,num_img);}
  if(key=='6'||key=='7'){rndm_Name = 30;quemar(glitch_Name,n,num_img);}
  else{fill(255,255,255,alpha);}
  
  textFont(font_Name);
  text("futuremen();", width/2, height/2);

}

void quemar(PImage []list,int n, int num){
  try{
  if(random(100)>rndm_Name)
    image(list[round(random(num-1))],0,0);
  if(random(100)>rndm_Name)
    fill(255,255,255,alpha);
  if(random(100)>rndm_Name)
    blend(list[round(random(num-1))], round(random(200))-100, round(random(200))-100, round(random(width)),round(random(height)), 0, 0, width, height, BURN);
  }
  catch (OutOfMemoryError e) {
  e.printStackTrace();
  }
}
