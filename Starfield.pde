stars[] one = new stars[801];
PImage img;
PImage img2;
int hasbullaWidth = 50;
int hasbullaHeight = 50;

void setup() {
 size(1000,1000);
 frameRate(120);
 img = loadImage("hasbulla punching.png");
 img2 = loadImage("ilyashuster2.png");
 for(int i = 0; i < one.length - 1; i++) {
   one[i] = new stars();
 }  
 one[one.length-1] = new flyingIlya();
}  

void draw() {
  background(0);
  image(img,300,100,hasbullaWidth,hasbullaHeight);
  if(hasbullaWidth > 800) {
    for(int i = 0; i < one.length; i++) {
        one[i].move();
        one[i].show();
    }  
  }
  if(hasbullaWidth < 800) {
    hasbullaWidth += 20;
    hasbullaHeight += 20;
  }  
  one[one.length-1].move();
  one[one.length-1].move();
  one[one.length-1].show();
}

void mousePressed() {
 for(int i = 0; i < one.length - 1; i++) {
   one[i] = new stars();
 }  
 one[one.length - 1] = new flyingIlya();
 hasbullaWidth = 50;
 hasbullaHeight = 50;
}  

class stars {
 
  double myX, myY, speed, angle;
  int myColor;
 
 stars() {
   myX = 500;
   myY = 500;
   speed = (double)(Math.random() * 7) + 3;
   angle = (double)(Math.random() * 2 * PI);
   myColor = color((int)(Math.random() * 255), (int)(Math.random() * 255), (int)(Math.random() * 255));
 }
 
 void move() {
   myX += speed * Math.cos(angle);
   myY += speed * Math.sin(angle);
 }
 
 void show() {
   fill(myColor);
   ellipse((float)myX,(float)myY, 10,10);
 }  
} //end of stars class

class flyingIlya extends stars {
 
  flyingIlya() {
    myX = 500;
    speed = (int)(Math.random() * 15) + 1;
    angle = 0;
    myColor = (int)(Math.random() * 2);
    if(myColor == 0) {
      myY = 100;
    } else {
      myY = 900;
    }  
  } 
 
  void move() {
    if(myColor == 0) {
      if(angle < 2*PI) {
        angle += PI/100;
      } else {
        angle = 0;
      }
      super.move();
    } else if (myColor == 1) {
      if(angle > -2*PI) {
        angle -= PI/100;
      } else {
        angle = 0;
      }
      super.move();
    }  
  }
 
  void show() {
   fill(128,128,128);
   ellipse((int)myX,(int)myY,240,62.5);
   fill(152,255,152);
   arc((int)myX,(int)myY - 20,150,110,PI,2*PI);
   arc((int)myX,(int)myY - 20,150,30,0,PI);
   fill(255,255,237);
   ellipse((int)myX,(int)myY + 20,7.5,7.5);
   ellipse((int)myX - 100,(int)myY,7.5,7.5);
   ellipse((int)myX + 100,(int)myY,7.5,7.5);
   ellipse((int)myX - 60,(int)myY + 10,7.5,7.5);
   ellipse((int)myX + 60,(int)myY + 10,7.5,7.5);
   image(img2,(int)myX - 30,(int)myY - 70,60,60);
  }  
} //end of flyingIlya class  
