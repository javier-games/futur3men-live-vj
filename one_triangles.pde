//import ddf.minim.analysis.*;
//import ddf.minim.*;

import processing.opengl.*;
import glitchP5.*; // import GlitchP5

//Minim minim;
//AudioInput input;

GlitchP5 glitchP5;

Fgrs trgls;
Fgr  trgl;
int  []trgl_gain = {5000,1000,10000};
int L=205;
int S=205;
boolean black = false;
boolean first_time = true;

void setup(){
  size(1280,720, P3D);
  background(0,0,0);
  noCursor();
  colorMode(HSB,255);
  glitchP5 = new GlitchP5(this);
  
  //minim = new Minim(this);
  //input = minim.getLineIn(1);
  
  trgls = new Fgrs();
  trgl = new Fgr(new PVector(0,0,0),100,0,color(0,0,255),3);
  
}

void draw(){

  
  translate(width/2,height/2);
  
  trgls.IncRads(50);
  noStroke();
  trgls.DrwFgrs(); 
  trgls.RmvIfOverflow();
  
  noStroke();
  trgl.DrwFgr();
  
  if(key=='1'){}
  //if(key=='2'){trgl.SetRad(input.right.get(0)*trgl_gain[0]);}
  //if(key=='3'){trgl.SetRad(abs(input.right.get(0))*trgl_gain[1]+100);}
  if(key=='4'){trgl.SetRad(0);}
  //if(key=='5'){trgl.SetRad(abs(input.right.get(0))*trgl_gain[1]);}
  //if(key=='6'){trgl.SetRad(input.right.get(0)*trgl_gain[2]);}
  //if(key=='7'){trgl.SetRad(input.right.get(0)*trgl_gain[2]);}
  
   glitchP5.run();
}

public void keyPressed(){
  if(key==' '){glitchP5.glitch(mouseX, mouseY, 200, 400, 200, 1200, 3, 1.0f, 50, 400);}
  if(key=='1'){
    if(black){
      trgls.InsrtLast(new PVector(0,0,0),trgl.GetRad(),0,color(0,0,0),3);
      trgl.SetClr(color(0,0,255));
      black = !black;
    }
    else{
      trgls.InsrtLast(new PVector(0,0,0),trgl.GetRad(),0,color(0,0,255),3);
      trgl.SetClr(color(0,0,0));
      black = !black;
      trgl.SetRad(0);
      first_time=false;
    }
  }
  if(key=='2'){
    trgls.InsrtLast(new PVector(0,0,0),0,0,color(round(random(255)),S,L),3);
    trgl.SetClr(color(0,0,255,50));
  }
  if(key=='3'){
    trgls.InsrtLast(new PVector(0,0,0),0,0,color(round(random(255)),S,L,50),3);
    trgl.SetClr(color(0,0,255,5));
  }
  if(key=='4'){
    trgls.InsrtLast(new PVector(0,0,0),0,0,color(round(random(255)),S,L,50),3);
    trgl.SetClr(color(0,0,255,5));
  }
  if(key=='5'){
    trgls.InsrtLast(new PVector(0,0,0),0,0,color(round(random(255)),S,L),3);
    trgl.SetClr(color(0,0,255,50));
  }
  if(key=='6'){
    trgls.InsrtLast(new PVector(0,0,0),0,0,color(round(random(255)),S,L),3);
    trgl.SetClr(color(0,0,255,50));
  }
  if(key=='7'){
    trgls.InsrtLast(new PVector(0,0,0),0,0-trgl.GetNgl(),color(round(random(255)),S,L),3);
    trgl.SetClr(color(0,0,255,50));
    trgl.SetNgl(trgl.GetNgl()+10);
  }
}

//void mousePressed()
//{
  // trigger a glitch: glitchP5.glitch(  posX,       // 
  //                               posY,       // position on screen(int)
  //          posJitterX,     // 
  //          posJitterY,     // max. position offset(int)
  //          sizeX,       // 
  //          sizeY,       // size (int)
  //          numberOfGlitches,   // number of individual glitches (int)
  //          randomness,     // this is a jitter for size (float)
  //          attack,     // max time (in frames) until indiv. glitch appears (int)
  //          sustain      // max time until it dies off after appearing (int)
  //              );

  
//}


//----------------------Class----------

public class Fgrs {
  
  //Atributos
  private Fgr H;
  private Fgr T;
  private boolean exist;
  private int radMax;
  
  //Constructor
  public Fgrs(){
    H=null;
    T=null;
    exist = false;
    
    radMax=0;
    do{  radMax+=10;  }while(!overflow(radMax,0,0,0));
  }
  
  //Metodos
  
 //Metodos de Busqueda
  public Fgr SrchRad(float rad){
    if(H!=T)
      for(Fgr q=H; q!=null; q=q.GetNxt())
        if(q.GetRad() == rad)
          return q;
    return null;
  }
  public Fgr SrchPstRad(float rad){
    for(Fgr q=H; q!=null; q=q.GetNxt())
      if(q.GetRad() == rad)
        return q;
    return null;
  }
  public Fgr SrchPrvRad(float rad){
    Fgr prv = null, crrnt;
    for(crrnt=H; crrnt!=null; crrnt=crrnt.GetNxt()){
      if(crrnt.GetRad() == rad){
        exist = true;
        return prv;
      }
      prv = crrnt;
    }
    return prv;
  }
  
  //Metodos de Inserción
  public void InsrtFgr(PVector point, float rad, float ngl, color clr, int code, Fgr q){
    Fgr newT = new Fgr(point,rad,ngl,clr,code,q.GetNxt());
    q.SetNxt(newT);
    if(q==T)
      T=newT;
  }
  public void InsrtFirst(PVector point, float rad, float ngl,color clr,int code){
    Fgr q = new Fgr(point,rad,ngl,clr,code,H);
    if(H==null)
      T=q;
    H=q;
  }
  public void InsrtLast(PVector point, float rad, float ngl,color clr, int code){
    Fgr q = new Fgr(point,rad,ngl,clr,code,null);
    if(H==null){
      H=q;
      T=q;
    }
    else{
      T.SetNxt(q);
      T=q;
    }
  }
  public void InsrtPst(PVector point, float rad, float ngl, color clr, int code, float ref){
    Fgr q = SrchPstRad(ref);
    if(q!=null){
      InsrtFgr(point,rad,ngl,clr,code,q);
    }
  }
  
  public void InsrtPrv(PVector point, float rad, float ngl, color clr,  int code, float ref){
    Fgr q = SrchPrvRad(ref);
    if(exist){
      if(q==null){
        InsrtFirst(point,rad,ngl,clr,code);}
      else
        InsrtFgr(point,rad,ngl,clr,code,q);
    }
  }
    //Metodos de Eliminación
  public void RmvFgr(float rad){
    Fgr q=SrchRad(rad);
    if(q!=null){
      if(q==H)
        H=q.GetNxt();
      if(q==T)
        T=SrchPrvRad(rad);
      else{
        Fgr aux = SrchPrvRad(rad);
        aux.SetNxt(q.GetNxt());
      }  
    }
      
  }
  public void RmvIfOverflow(){
     if(H!=null && abs(H.GetRad())>=radMax)
      H = H.GetNxt();
  }
  //Metodos
  public void DrwFgrs(){
    for(Fgr q=H; q!=null; q=q.GetNxt())
      q.DrwFgr();
  }
  
  public void IncRads(float inc){
    for(Fgr q=H; q!=null; q=q.GetNxt())
      q.SetRad(q.GetRad()+1*inc);
  }
  public void IncHues(float inc){
    color clr;
    float hue;
    float brg;
    float sat;
    for(Fgr q=H; q!=null; q=q.GetNxt()){
      clr = q.GetClr();
      brg = brightness(clr);
      sat = saturation(clr);
      hue = hue(clr);
      if(hue>=365)
        hue=0;
      else
        hue+=1*inc;
      q.SetClr(color(hue,sat,brg));
    }  
  }
    
    public Fgr GetH(){
        return H;
    }
    public Fgr GetT(){
        return T;
    }
    
    boolean overflow(float r,int a, int offsetX, int offsetY){
      boolean result = false;
      float x1 = -r*cos(radians(90+a))+offsetX;
      float y1 = -r*sin(radians(90+a))+offsetY;
      float x2 = -r*cos(radians(210+a))+offsetX;
      float y2 = -r*sin(radians(210+a))+offsetY;
      float m1 = (y1-y2)/(x1-x2);
      float m2 = (y1)/(x1-3*width/4);
      if(m2 >= m1)
        result =true;
      return result;
    }
}


public class Fgr{

  //Atributos
  private PVector point;
  private float rad;
  private float ngl;
  private color clr;
  private int code;
  private Fgr nxt;
  
  //Constructor
  public Fgr(PVector point, float rad, float ngl, color clr, int code, Fgr nxt){
    this.point = new PVector(point.x,point.y,point.z);
    this.rad = rad;
    this.ngl = ngl;
    this.clr = clr;
    this.nxt = nxt;
    this.code=code;
  }
  public Fgr(PVector point, float rad, float ngl, color clr, int code){
    this.point = new PVector(point.x,point.y,point.z);
    this.rad = rad;
    this.ngl = ngl;
    this.clr = clr;
    this.code=code;
    this.nxt = null;
  }
  
  //Metodos
  
  public void SetX(float x){
    this.point.x = x;}
  public void SetY(float y){
    this.point.y = y;}
  public void SetZ(float z){
    this.point.z = z;}
  public void SetRad(float rad){
    this.rad = rad;}
  public void SetNgl(float ngl){
    this.ngl = ngl;}
  public void SetClr(color clr){
    this.clr = clr;}
  public void SetNxt(Fgr  nxt){
    this.nxt = nxt;}
    
  public PVector GetPoint(){
    return point;}
  public float GetRad(){
    return rad;}
  public float GetNgl(){
    return ngl;}
  public color GetClr(){
    return clr;}
  public Fgr GetNxt(){
    return nxt;}
    
  public void DrwFgr(){
    
    pushMatrix();
    translate(point.x,point.y,point.z);
    fill(clr);
    
    if(code == 3){
      float rad = -this.rad;
      float nglA = radians(90+this.ngl);
      float nglB = radians(210+this.ngl);
      float nglC = radians(330+this.ngl);
      triangle(rad*cos(nglA)+point.x,rad*sin(nglA)+point.y,rad*cos(nglB)+point.x,rad*sin(nglB)+point.y,rad*cos(nglC)+point.x,rad*sin(nglC)+point.y);
    }
    
    if(code == 4){}
    
    popMatrix();
  }
}
