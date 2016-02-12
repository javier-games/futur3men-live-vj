import glitchP5.*;

import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import peasy.test.*;

boolean start=false;
boolean words=true;
boolean black=false;
boolean strobe=false;
boolean rotate=false;
boolean cc=true;
boolean line=true;
boolean pre1=false;
boolean pre2=false;
boolean pre3=false;
long time1 = 900;

int box_l=50; //size of the cube
int box_n=3;
PeasyCam cam;
GlitchP5 glitch;
float ang=0.01;
int count=0;
float spd=0.1;
long time_l = 0;
PFont  font;

void setup(){
  size(displayWidth, displayHeight, P3D);
  background(255);
  
    ortho();
  cam = new PeasyCam(this,0,0,0 ,box_l*box_n);
  cam.setMinimumDistance(box_l*box_n*2);
  cam.setMaximumDistance(box_l*box_n*10);
  
  noCursor();
  
  font = createFont("AndaleMono", 100);
    cam.rotateY(-PI/4);
    
  colorMode(HSB,360,100,100);
  glitch = new GlitchP5(this);
}


void draw(){

  
  if(!cc){
    cam.rotateX(spd);
  }
  
  if(pre1){
      cam.rotateX(0);
      cam.rotateY(-PI/2);
      cam.rotateZ(0);
    pre1=!pre1;
  }  
  if(pre2){
      cam.rotateX(-PI/2);
      cam.rotateY(0);
      cam.rotateZ(0);
    pre2=!pre2;
  }  
  if(pre3){
      cam.rotateX(0);
      cam.rotateY(0);
      cam.rotateZ(-PI/2);
    pre3=!pre3;
  }
  
  if(random(1)>0.5 && strobe){
    background(0);
    line =!line;
  }
  else{
    if(black){
       background(0);//color(ang,75,100));
    }
    else{
      if(start)
        background(trate(),35,100);//H=201//(80,180,234);
      else
        background(201,35,100);
    }
  }
  
  if(line){
    if(start){
      stroke(0,0,100);
      strokeWeight(5);
      noFill();
    }
    else{
      noStroke();
      noFill();
    }
  }
  else{
    noStroke();
    fill(255);
  }
  
  
  if(rotate){
    cam.rotateX(ang);
    cam.rotateY(ang*2);
    cam.rotateZ(ang*3);
  }
  
  if(!start){
    textAlign(CENTER);
    textFont(font);
    if(words){
      fill(0,0,100);
    int i= int(random(2));
    if(i==0)
      text("futuremen();",0,0);
    if(i==1)
      text("futurem3n();",0,0);  
    if(i==2)
      text("futuremEn();",0,0);
    }
    noFill();
  }
  
  directionalLight(ref(165,201,count),60,100  ,255,0,0);//(202,226,218,255,0,0);
  directionalLight(ref(165,201,count),60,100  ,-255,0,0);
  directionalLight(ref(195,201,count),90,70  ,0,0,255);//(18,62,71,0,0,255);
  directionalLight(ref(195,201,count),90,70  ,0,0,-255);
  directionalLight(ref(155,201,count),30,80  ,0,255,0);//(141,187,165,0,-255,0);
  directionalLight(ref(155,201,count),30,80  ,0,-255,0);
  
  
  translate(box_l/2,box_l/2,box_l/2);
  cubes(box_n);
  glitch.run();
}

void cubes(int n){
  int total_l=box_l*n;
  for(int i=0;i<n;i++){
    for(int j=0;j<n;j++){
      for(int k=0;k<n;k++){
        if(!((j==0||j==2)&&(i==0||i==2)&&(k==0||k==2))){
          pushMatrix();
            translate(-total_l/2+box_l*i,-total_l/2+box_l*j,-total_l/2+box_l*k);
            box(box_l);
          popMatrix();
        }
      }
    }
  }
  translate(-box_l/2,-box_l/2,-box_l/2);
 
 
}

void keyPressed(){
  
  if(key=='b')
    black=!black;
  
  if(key==' ')
    glitch.glitch(width/2, height/2, 10,height, width*2,10, 5, /*0.5*/500, 20, 100);

  if(key=='g')
    glitch.glitch(width/2, height/2, 10,height, width*2,50, 5,0.5, 20, 100);

  if(key=='s')
    strobe=!strobe;
    
  if(key=='r')
    rotate=!rotate;
    
  if(key=='c')
    cc=!cc;
    
  if(key=='l')
    line=!line;
  
  if(key=='1')
    pre1=!pre1;
  if(key=='2')
    pre2=!pre2;
  if(key=='3')
    pre3=!pre3;

  if(key=='y')
    start=!start;
  if(key=='w')
    words=!words;
}

int trate(){
  long time_c=millis();
  if((time_c-time_l)>=time1){
    count+=(25);
    time_l=time_c;
    int i=int(random(2));
    if(i==0){pre1=!pre1;}
    if(i==1){pre2=!pre2;}
    if(i==2){pre3=!pre3;}
  }
  println(time_c-time_l);
  if(count >= 360){
    count=count-360;
  }
  return count;
}

int ref(int base,int base2,int ref){
  int dif = base2-base;
  if(ref-dif<0){
    return 360+ref-dif;
  }
  return ref-dif;
}