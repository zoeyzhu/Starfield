Particle [] s = new Particle [150];
void setup()
{
  size(400, 400);
  for (int i=0; i<10; i++) {
    s[i] = new OddballParticle();
  }
  for (int i=10; i<s.length; i++) {
    s[i] = new Particle();
  }
}
void draw()
{
  background(211, 211, 211);
  fill(255);
  for (int i = 0; i<s.length; i++) {
    s[i].show();
    s[i].move();
  }
}

void mousePressed(){
  redraw();  
  
}


class Particle
{
  double myX, myY, myAngle, mySpeed, myColor, myOpacity;
  Particle () {
    myX = 180;
    myY = 250;
    myAngle = Math.random()*-0.5*Math.PI;
    mySpeed = Math.random()*10;
    myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    myOpacity = (int)(Math.random()*60) + 60;
  }

  void move()
  {
    myX = myX + Math.cos(myAngle)*mySpeed;
    myY = myY + Math.sin(myAngle)*mySpeed;
  }


  void show()
  {
    stroke(0);
    fill((int)(myColor), (float)(myOpacity));
    ellipse((float)(myX), (float)(myY), 20.0, 20.0);
    ellipse((float)(myX+2.1), (float)(myY-2.2), 5.0, 3.0);
    noStroke();
    rect(150,300,10,200);
    ellipse(155, 260,50,90);
    fill(211, 211, 211);
    ellipse(155, 260, 30, 70);
  }
}

class OddballParticle extends Particle//inherits from Particle
{
  OddballParticle() {
    myX = 130;
    myY = 250;
    myAngle = Math.random()*-0.4*Math.PI;
    mySpeed = Math.random()*40;
  }

  void show()
  {
    stroke(0);
    fill(255, 165, 0);
    triangle((float)(myX), (float)(myY),(float)(myX-15), (float)(myY-10),(float)(myX-15), (float)(myY+10));
    ellipse((float)(myX+5), (float)(myY), 20,15);
  }
}
