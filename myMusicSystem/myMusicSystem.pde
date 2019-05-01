import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.dynamics.contacts.*;


Box2DProcessing box2d;

Surface surface;
float x1, y1, x2, y2;
int m=0; 
int xx=0;
int yy=0;
import ddf.minim.*;
Minim minim; 
AudioPlayer player; 
AudioPlayer aus4;
ArrayList<Particle> particles;
ArrayList<rect_Particle> rect_particles;
ArrayList<Surface> surfaces;
ArrayList<AudioPlayer> aus;
ArrayList<AudioPlayer> aus2;
ArrayList<AudioPlayer> aus3;
ArrayList<AudioPlayer> store;
ArrayList<drawEllipse> a;
ArrayList<Polygon> b;
ArrayList<drawRect> c;
ArrayList<drawEllipse2> d;
ArrayList<Polygon2> e;
ArrayList<drawArc> f;
ArrayList<drawRect2> g;
ArrayList<drawEllipse3> h;
ArrayList<drawRect3> k;
ArrayList<show1> show1s;
ArrayList<show2> show2s;
ArrayList<show5> show5s;
int sec=2000;
float rrr;
int colorIndex;
float size;
int j=-1; 
boolean start=false;
boolean background=true;
boolean music=true;
boolean introduce=false;
color backgroundcolor[]={#f68f94, #a3d1d0, #a08ff6, #8ff6ce, #f6b88f, #9398f5};
int backColorIndex=0;

void setup() {

  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -10);
  // Turn on collision listening!
  box2d.listenForCollisions();
  particles = new ArrayList<Particle>();
  rect_particles = new ArrayList<rect_Particle>();
  surfaces=new ArrayList<Surface>();
  aus = new ArrayList<AudioPlayer>();
  aus2 = new ArrayList<AudioPlayer>();
  aus3 = new ArrayList<AudioPlayer>();
  store = new ArrayList<AudioPlayer>();

  size(displayWidth, displayHeight); 
  background(255);
  frameRate(60);
  fill(0);
  stroke(255);
  strokeWeight(0);
  minim = new Minim(this);
  player = minim.loadFile("music/backgroundMusic.mp3");
  aus4 = minim.loadFile("music/drum.mp3");
  for (int i=1; i<33; i++) {
    minim = new Minim(this);
    aus.add(minim.loadFile("music/voiceBase/"+str(i)+".mp3"));
    aus2.add(minim.loadFile("music/voiceBase/"+str(i)+".mp3"));
    aus3.add(minim.loadFile("music/voiceBase/"+str(i)+".mp3"));
  }
  a = new ArrayList<drawEllipse>();
  b = new ArrayList<Polygon>();
  c = new ArrayList<drawRect>();
  d = new ArrayList<drawEllipse2>();
  e = new ArrayList<Polygon2>();
  f = new ArrayList<drawArc>();
  g = new ArrayList<drawRect2>();
  h = new ArrayList<drawEllipse3>();
  k = new ArrayList<drawRect3>();

  show1s = new ArrayList<show1>();
  show2s = new ArrayList<show2>();
  show5s = new ArrayList<show5>();

  background(#8acccb);
  //fill(255);
  //rect(displayWidth/2-100,displayHeight/2-100,200,50);
  //rect(displayWidth/2-100,displayHeight/2-50,200,50);
  //rect(displayWidth/2-100,displayHeight/2-0,200,50);
  //rect(displayWidth/2-100,displayHeight/2+50,200,50);
  PImage myImg0, myImg1, myImg2, myImg3, title;
  title=loadImage("pic/title.png");
  myImg0=loadImage("pic/start.png");
  myImg1=loadImage("pic/instroduce.png");
  myImg2=loadImage("pic/back_on.png");
  myImg3=loadImage("pic/note_on.png");
  image(title, displayWidth/2-400, displayHeight/2-300);
  image(myImg0, displayWidth/2-100, displayHeight/2-100);
  image(myImg1, displayWidth/2-100, displayHeight/2-50);
  image(myImg2, displayWidth/2-100, displayHeight/2);
  image(myImg3, displayWidth/2-100, displayHeight/2+50);
}

void draw() {
  if (start) {
    if (millis()%10000<10) {
      backColorIndex++;
      if (backColorIndex==6)
        backColorIndex=0;
    }

    background(backgroundcolor[backColorIndex]);
    box2d.step();
    if (j>=0) {
      if (millis()-sec>30) {
        h.add(new drawEllipse3(0, j, rrr, colorIndex, size));
        j++;
        sec=millis();
        if (j==8)
          j=-1;
      }
    }

    for (int i=0; i < f.size(); i++) {
      f.get(i).display();
      if (f.get(i).getR()>2*PI+0.1)
        f.remove(i);
    }
    for (Surface s : surfaces) {
      s.display();
    }
    for (Particle p : particles) {
      p.display();
    }
    for (rect_Particle p : rect_particles) {
      p.display();
    }
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      if (p.done()) {
        particles.remove(i);
      }
    }
    for (int i = rect_particles.size()-1; i >= 0; i--) {
      rect_Particle p = rect_particles.get(i);
      if (p.done()) {
        rect_particles.remove(i);
      }
    }
    for (int i=0; i < a.size(); i++) {
      a.get(i).display();
      if (a.get(i).getR()>2)
        a.remove(i);
    }
    for (int i=0; i < b.size(); i++) {
      b.get(i).display();
      if (b.get(i).getR()>2)
        b.remove(i);
    }
    for (int i=0; i < c.size(); i++) {
      c.get(i).display();
      if (c.get(i).getR()>3.3)
        c.remove(i);
    }
    for (int i=0; i < d.size(); i++) {
      d.get(i).display();
      if (d.get(i).getR()>3.3)
        d.remove(i);
    }
    for (int i=0; i < e.size(); i++) {
      e.get(i).display();
      if (e.get(i).getR()>3.3)
        e.remove(i);
    }
    for (int i=0; i < g.size(); i++) {
      g.get(i).display();
      if (g.get(i).getR()>3.3)
        g.remove(i);
    } 
    for (int i=0; i < h.size(); i++) {
      h.get(i).display();
      if (h.get(i).getR()>3.3)
        h.remove(i);
    }
    for (int i=0; i < k.size(); i++) {
      k.get(i).display();
      if (k.get(i).getR()>3.3)
        k.remove(i);
    }

    for (int i=0; i<show1s.size(); i++) {
      float temp=1;
      if ((1000.0-(float)(millis()-show1s.get(i).getTt()))>0) {
        temp=(1000.0-(float)(millis()-show1s.get(i).getTt()))/1000.0;
      }
      show1s.get(i).init(temp);
      if ((millis()-show1s.get(i).getTt()>=900)) {
        show1s.remove(i);
      }
    }

    for (int i=0; i<show2s.size(); i++) {
      int temp=(int)(((float)(millis()-show2s.get(i).getTt()))/100.0);
      show2s.get(i).setK(temp);
      show2s.get(i).init();
      if ((millis()-show2s.get(i).getTt()>=2000)) {
        show2s.remove(i);
      }
    }

    for (int i=0; i<show5s.size(); i++) {
      float temp=1;
      if ((1000.0-(float)(millis()-show5s.get(i).getTt()))>0) {
        temp=(1000.0-(float)(millis()-show5s.get(i).getTt()))/1000.0;
      }
      show5s.get(i).display();

      if ((millis()-show5s.get(i).getTt()>=900)) {
        show5s.remove(i);
      }
    }
    //if(store.size()>0){
    //   if(store.get(0).isPlaying()){
    //       //if(store.get(0).position()>=store.get(0).length()-600){
    //       //println("end");
    //     //}
    //   }
    //     else{
    //       store.get(0).rewind();
    //       store.get(0).play();
    //       store.remove(0);
    //     }
    //   }
  }
}

void mousePressed() {
  //leftbutton to draw surface
  if (mouseButton==LEFT) {
    x1=mouseX;
    y1=mouseY;
  } else if (mouseButton==RIGHT) {
    int w=displayWidth;
    int h=displayHeight;
    m = millis();
    xx=(int)(mouseX/(w/8));
    yy=(int)(mouseY/(h/4.0));
    fill(#f3f3f3);
    noStroke();
    rect(xx*w/8, yy*h/4.0, w/8, h/4);
    int index=xx+8*yy;
    if (music) {
      if (aus.get(index).isPlaying()) {
        if (aus2.get(index).isPlaying()) {
          aus3.get(index).rewind();
          aus3.get(index).play();
        } else {
          aus2.get(index).rewind();
          aus2.get(index).play();
        }
      } else {
        aus.get(index).rewind();
        aus.get(index).play();
      }
    }
    switch (index) {
    case 0:
      {
        for (int i=0; i<5; i++) {
          float sz = random(3, 7);
          rect_particles.add(new rect_Particle(displayWidth/2, displayHeight/2.5, sz));
        }
        break;
      }
    case 1:
      {
        for (int i=0; i<9; i++)
        {
          a.add(new drawEllipse(0));
        }
        break;
      }
    case 2:
      {
        b.add(new Polygon(1));
        break;
      }
    case 3:
      {
        for (int i=0; i<6; i++)
        {
          d.add(new drawEllipse2(0));
        }        
        break;
      }
    case 4:
      {
        e.add(new Polygon2(1));
        break;
      }
    case 5:
      {
        f.add(new drawArc(0));
        break;
      }
    case 6:
      {
        for (int i=0; i<6; i++)
        {
          g.add(new drawRect2(0));
        }        
        break;
      }
    case 7:
      {
        e.add(new Polygon2(0));
        break;
      }
    case 8:
      {
        float rr=random(100, 200);
        int colorIndex=(int)random(0, 8);
        float size=random(0.3, 1);
        for (int i=0; i<8; i++)
        {
          k.add(new drawRect3(0, i, rr, colorIndex, size));
        }
        break;
      }
    case 9:
      {    
        for (int i=0; i<5; i++)
        {
          d.add(new drawEllipse2(1));
        }        
        break;
      }
    case 10:
      {
        j=0;
        rrr=random(100, 200);
        colorIndex=(int)random(0, 8);
        size=random(0.3, 1);
        sec=millis();
        break;
      }
    case 11:
      {
        for (int i=0; i<9; i++)
        {
          a.add(new drawEllipse(0));
        }        
        break;
      }
    case 12:
      {
        for (int i=0; i<9; i++)
        {
          a.add(new drawEllipse(0));
        }        
        break;
      }
    case 13:
      {
        b.add(new Polygon(1));
        break;
      }
    case 14:
      {
        for (int i=0; i<6; i++)
        {
          d.add(new drawEllipse2(0));
        }        
        break;
      }
    case 15:
      {
        b.add(new Polygon(0));
        break;
      }
    case 16:
      {
        noFill();
        stroke(4);
        for (int i=0; i<6; i++)
        {
          c.add(new drawRect(1));
        }        
        break;
      }
    case 17:
      {
        noFill();
        stroke(4);
        for (int i=0; i<5; i++)
        {
          a.add(new drawEllipse(1));
        }        
        break;
      }
    case 18:
      {
        e.add(new Polygon2(1));
        break;
      }
    case 19:
      {
        float rr=random(100, 200);
        int colorIndex=(int)random(0, 8);
        float size=random(0.3, 1);
        for (int i=0; i<8; i++)
        {
          k.add(new drawRect3(0, i, rr, colorIndex, size));
        }        
        break;
      }
    case 20:
      {
        for (int i=0; i<5; i++)
        {
          d.add(new drawEllipse2(1));
        }        
        break;
      }
    case 21:
      {
        j=0;
        rrr=random(100, 200);
        colorIndex=(int)random(0, 8);
        size=random(0.3, 1);
        sec=millis();
        index=21;        
        break;
      }
    case 22:
      {
        b.add(new Polygon(0));        
        break;
      }
    case 23:
      {
        int t=millis();
        int n=(int)random(10, 30);
        show2s.add(new show2(t, n));        
        break;
      }
    case 24:
      {
        int t=millis();
        int n=(int)random(10, 30);
        show2s.add(new show2(t, n));        
        break;
      }
    case 25:
      {
        int t=millis();
        show1s.add(new show1(t));        
        break;
      }
    case 26:
      {
        int t=millis();
        show5s.add(new show5(t));        
        break;
      }

    case 27:
      {
        noFill();
        stroke(4);
        for (int i=0; i<5; i++)
        {
          a.add(new drawEllipse(1));
        }        
        break;
      }
    case 28:
      {
        noFill();
        stroke(4);
        for (int i=0; i<5; i++)
        {
          a.add(new drawEllipse(1));
        }        
        break;
      }
    case 29:
      {
        noFill();
        stroke(4);
        for (int i=0; i<5; i++)
        {
          a.add(new drawEllipse(1));
        }        
        break;
      }
    case 30:
      {
        noFill();
        stroke(4);
        for (int i=0; i<5; i++)
        {
          a.add(new drawEllipse(1));
        }        
        break;
      }
    case 31:
      {
        noFill();
        stroke(4);
        for (int i=0; i<5; i++)
        {
          a.add(new drawEllipse(1));
        }        
        break;
      }
    }
  }
}

void mouseReleased() {
  if (start) {
    //leftbutton to draw surface
    if (mouseButton==LEFT) {
      x2=mouseX;
      y2=mouseY;
      if ((x1!=x2)&&(y1!=y2)) {
        surface = new Surface(x1, y1, x2, y2);
        surfaces.add(surface);
      }
    }
  }
}

void mouseDragged() {
  if (start) {
    float dragX=mouseX;
    float dragY=mouseY;
    //leftbutton to draw surface
    if (mouseButton==LEFT) {
      strokeWeight(2);
      line(x1, y1, dragX, dragY);
    }
  }
}

void mouseClicked() {
  if (start) {
    if (mouseButton==LEFT) {
    } else if (mouseButton==RIGHT) {
    } else {
      if (surfaces.size()>0) {
        surfaces.get(surfaces.size()-1).kill();
        surfaces.remove(surfaces.size()-1);
      }
    }
  } else {
    //startbutton
    if ((mouseX>displayWidth/2-100)&&(mouseX<displayWidth/2+100)&&(mouseY>displayHeight/2-100)&&(mouseY<displayHeight/2-50)) {
      fill(#f3f3f3);
      rect(displayWidth/2-100, displayHeight/2-100, 200, 50);
      start=true;
      if (background)
        player.loop();
    }
    //instruction
    if ((mouseX>displayWidth/2-100)&&(mouseX<displayWidth/2+100)&&(mouseY>displayHeight/2-50)&&(mouseY<displayHeight/2)) {
      introduce=!introduce;
      PImage myImg0, myImg1;
      myImg0=loadImage("pic/introduce_1.png");
      myImg1=loadImage("pic/introduce_2.png");
      if (introduce)
        image(myImg0, displayWidth/2+100, displayHeight/2-200);
      else
        image(myImg1, displayWidth/2+100, displayHeight/2-150);
    }
    //backgroundmusic
    if ((mouseX>displayWidth/2-100)&&(mouseX<displayWidth/2+100)&&(mouseY>displayHeight/2)&&(mouseY<displayHeight/2+50)) {
      background=!background;
      PImage myImg0, myImg1;
      myImg0=loadImage("pic/back_on.png");
      myImg1=loadImage("pic/back_off.png");
      if (background)
        image(myImg0, displayWidth/2-100, displayHeight/2);
      else
        image(myImg1, displayWidth/2-100, displayHeight/2);
    }
    //music
    if ((mouseX>displayWidth/2-100)&&(mouseX<displayWidth/2+100)&&(mouseY>displayHeight/2+50)&&(mouseY<displayHeight/2+100)) {
      music=!music;
      PImage myImg0, myImg1;
      myImg0=loadImage("pic/note_on.png");
      myImg1=loadImage("pic/note_off.png");
      if (music)
        image(myImg0, displayWidth/2-100, displayHeight/2+50);
      else
        image(myImg1, displayWidth/2-100, displayHeight/2+50);
    }
  }
}

void keyPressed() {
  if (start) {
    int index=-1;
    if (key=='1') {
      for (int i=0; i<5; i++) {
        float sz = random(3, 7);
        rect_particles.add(new rect_Particle(displayWidth/2, displayHeight/2.5, sz));
      }
      index=0;
    } else if (key=='2') {
      for (int i=0; i<9; i++)
      {
        a.add(new drawEllipse(0));
      }
      index=1;
    } else if (key=='3') {
      b.add(new Polygon(1));
      index=2;
    } else if (key=='4') {
      //stroke(4);
      for (int i=0; i<6; i++)
      {
        d.add(new drawEllipse2(0));
      }
      index=3;
    } else if (key=='5') {
      e.add(new Polygon2(1));
      index=4;
    } else if (key=='6') {
      f.add(new drawArc(0));
      index=5;
    } else if (key=='7') {
      for (int i=0; i<6; i++)
      {
        g.add(new drawRect2(0));
      }
      index=6;
    } else if (key=='8') {
      e.add(new Polygon2(0));
      index=7;
    } else if (key=='9') {
      float rr=random(100, 200);
      int colorIndex=(int)random(0, 8);
      float size=random(0.3, 1);
      for (int i=0; i<8; i++)
      {
        k.add(new drawRect3(0, i, rr, colorIndex, size));
      }
      index=8;
    } else if (key=='0') {
      for (int i=0; i<5; i++)
      {
        d.add(new drawEllipse2(1));
      }
      index=9;
    } else if (key=='Q'||key=='q') {

      j=0;
      rrr=random(100, 200);
      colorIndex=(int)random(0, 8);
      size=random(0.3, 1);
      sec=millis();

      index=10;
    } else if (key=='W'||key=='w') {
      for (int i=0; i<9; i++)
      {
        a.add(new drawEllipse(0));
      }
      index=11;
    } else if (key=='E'||key=='e') {
      for (int i=0; i<9; i++)
      {
        a.add(new drawEllipse(0));
      }
      index=12;
    } else if (key=='R'||key=='r') {
      b.add(new Polygon(1));

      index=13;
    } else if (key=='T'||key=='t') {
      for (int i=0; i<6; i++)
      {
        d.add(new drawEllipse2(0));
      }
      index=14;
    } else if (key=='Y'||key=='y') {
      b.add(new Polygon(0));
      index=15;
    } else if (key=='U'||key=='u') {
      noFill();
      stroke(4);
      for (int i=0; i<6; i++)
      {
        c.add(new drawRect(1));
      }
      index=16;
    } else if (key=='I'||key=='i') {
      noFill();
      stroke(4);
      for (int i=0; i<5; i++)
      {
        a.add(new drawEllipse(1));
      }
      index=17;
    } else if (key=='O'||key=='o') {
      e.add(new Polygon2(1));

      index=18;
    } else if (key=='P'||key=='p') {
      float rr=random(100, 200);
      int colorIndex=(int)random(0, 8);
      float size=random(0.3, 1);
      for (int i=0; i<8; i++)
      {
        k.add(new drawRect3(0, i, rr, colorIndex, size));
      }
      index=19;
    } else if (key=='A'||key=='a') {
      for (int i=0; i<5; i++)
      {
        d.add(new drawEllipse2(1));
      }
      index=20;
    } else if (key=='S'||key=='s') {
      j=0;
      rrr=random(100, 200);
      colorIndex=(int)random(0, 8);
      size=random(0.3, 1);
      sec=millis();
      index=21;
    } else if (key=='D'||key=='d') {
      b.add(new Polygon(0));

      index=22;
    } else if (key=='F'||key=='f') {
      int t=millis();
      int n=(int)random(10, 30);
      show2s.add(new show2(t, n));
      index=23;
    } else if (key=='G'||key=='g') {
      int t=millis();
      int n=(int)random(10, 30);
      show2s.add(new show2(t, n));
      index=24;
    } else if (key=='H'||key=='h') {
      int t=millis();
      show1s.add(new show1(t));
      index=25;
    } else if (key=='J'||key=='j') {
      int t=millis();
      show5s.add(new show5(t));
      index=26;
    } else if (key=='K'||key=='k') {
      noFill();
      stroke(4);
      for (int i=0; i<5; i++)
      {
        a.add(new drawEllipse(1));
      }
      index=27;
    } else if (key=='L'||key=='l') {
      noFill();
      stroke(4);
      for (int i=0; i<5; i++)
      {
        a.add(new drawEllipse(1));
      }
      index=28;
    } else if (key=='Z'||key=='z') {
      noFill();
      stroke(4);
      for (int i=0; i<5; i++)
      {
        a.add(new drawEllipse(1));
      }
      index=29;
    } else if (key=='X'||key=='x') {
      noFill();
      stroke(4);
      for (int i=0; i<5; i++)
      {
        a.add(new drawEllipse(1));
      }
      index=30;
    } else if (key=='C'||key=='c') {
      noFill();
      stroke(4);
      for (int i=0; i<5; i++)
      {
        a.add(new drawEllipse(1));
      }
      index=31;
    } else if (key=='N'||key=='n') {
      saveFrame("out.png");
    } else {
      float sz = random(3, 6);
      particles.add(new Particle(mouseX, mouseY, sz));
    }
    if (music) {
      if (index>=0) {
        if (aus.get(index).isPlaying()) {
          if (aus2.get(index).isPlaying()) {
            aus3.get(index).rewind();
            aus3.get(index).play();
            store.add(aus3.get(index));
          } else {
            aus2.get(index).rewind();
            aus2.get(index).play();
            store.add(aus2.get(index));
          }
        } else {
          aus.get(index).rewind();
          aus.get(index).play();        
          store.add(aus.get(index));
        }
      }
    }
  }
}



// Collision event functions!
void beginContact(Contact cp) {
  // Get both fixtures
  if (aus4.isPlaying()) {
  } else {
    aus4.rewind();
    aus4.play();
  }
}
// Objects stop touching each other
void endContact(Contact cp) {
}
