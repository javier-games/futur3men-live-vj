import glitchP5.*;
import processing.video.*;

Movie    chapo;
Movie    youtubers;
Movie    floids;
GlitchP5 glitch;

int factor = 1;
PFont  font;

boolean bandera_chapo = false;
boolean bandera_youtubers = false;
boolean bandera_background = false;
boolean bandera_floids = false;
boolean bandera_future = false;

void setup(){
  //size(round(displayWidth/factor),round(displayHeight/factor), P3D);
  size(1280,700, P3D);
  font = createFont("AndaleMono", 50);
  
  chapo = new Movie(this,"El Chapo.mp4");
  youtubers = new Movie(this, "Shit Youtuber.mp4");
  floids = new Movie(this,"Floids.mp4");
  glitch=new GlitchP5(this);
  
  chapo.loop();
  youtubers.loop();
  floids.loop();
  
  noCursor();

}

void draw(){
  
  if(bandera_background){
    background(0);
    bandera_background = false;
  }
  else{
    background(255);
    bandera_background = true;
  }
  
  if(bandera_chapo){
    blendMode(DARKEST);
      image(chapo,0,0);
  }
  
  if(bandera_youtubers){
    blendMode(DARKEST);
    image(youtubers,0,0);
  }
  
  if(bandera_floids){
    blendMode(DARKEST);
    image(floids,0,0);
  }
  
  if(bandera_future){
    textAlign(CENTER);
    textFont(font);
    fill(255);
    text("futurem3n();",width/2,height/2);
  }
  
  
  glitch.run();
  delay(10);
}

void keyPressed(){
  if( key == ' ' )
    glitch.glitch(mouseX,mouseY,width,height/35,round(random(width)),height/35,10,1,3,15);
  if( key == '1' )
    bandera_chapo = !bandera_chapo;
  if( key == '2')
    bandera_youtubers = !bandera_youtubers;
  if( key == '3')
    bandera_floids = !bandera_floids;
  if( key == '4')
    bandera_future = !bandera_future;
}

void movieEvent(Movie m) {
  m.read();
}
