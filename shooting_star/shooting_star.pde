import fisica.*;

TuioProcessing tuioClient;
Monster monster1;
BlackHole blackhole1;
FCircle Ball;
FWorld world;
Star star1;
Star star2;
Star star3;
ArrayList<Object> objlist;
void setup()
{
//size(displayWidth, displayHeight,P2D);
size(800, 600);
Fisica.init(this);
world = new FWorld();
world.setEdges();
world.setEdgesRestitution(1);
world.setEdgesFriction(0);
world.setGravity(0,200);

objlist = new ArrayList<Object>();
tuioClient  = new TuioProcessing(this);
star1 = new Star(1,80,80,10,10,0, false);
star2 = new Star(2,80,80,10,10,0, false);
star3 = new Star(3,80,80,10,10,0, false);
monster1 = new Monster(4,80,80,10,10,0);
blackhole1 = new BlackHole(5,80,80,10,10,0);
objlist.add(star1);
objlist.add(star2);
objlist.add(star3);
objlist.add(monster1);
objlist.add(blackhole1);

  Ball = new FCircle(10);
  Ball.setPosition(random(0,800),random(0,400));
  Ball.setVelocity(random(100,300),500);
  Ball.setRestitution(1);
  Ball.setFriction(0);
  Ball.setDensity(100);
  Ball.setBullet(true);
  Ball.setDamping(0);
  world.add(Ball);
}

void draw()
{
  background(61,51,149);
  for(int i = 0; i < objlist.size(); i++)
  {
    objlist.get(i).update();
  }

  world.step();
  world.draw();
}

//press any key then you will see the star is toggled
//void keyPressed(){
//  if(tmps.state == true){
//     tmps.dark();
//  }
//  else{
//     tmps.light();
//  }
//}
