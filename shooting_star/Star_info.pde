color starLightColor = color(255);
color starDarkColor = color(0);

public class Star extends Object
{
  FCircle starCircle;
  color cl;
  boolean state;
  
  Star(int a, float x, float y, float dx, float dy, float theta, boolean s){
  super(a,x,y,dx,dy,theta);
  starCircle = new FCircle(min(x,y));
  state = s;
  
  //starCircle.setPosition(center.x, center.y);
  starCircle.setStaticBody(true);
  starCircle.setRestitution(1);
  starCircle.setFriction(0);
  starCircle.setDamping(0);
  starCircle.setDrawable(false); 
    
  }
  //update the states when recalled 
  void update()
  {
    super.update();
    
    if (exist == true)
    {
     starCircle.setPosition(center.x, center.y);  
     if (initial == true)
      {
        world.add(starCircle);
        //println("exist "+location_id);
        initial = false;
      }
      if (starCircle.isTouchingBody(Ball))
      {
        state = !state;
        println(state);
      }
      if (state)
      {
        cl = starLightColor;
      }
      else
      {
        cl = starDarkColor;
      }
      drawstar();  
    }
    
    if (exist == false)
    {
      world.remove(starCircle);
    }
    
  }
  
  void drawstar()
  {
    noStroke();
    fill(cl);
    ellipse(center.x, center.y, min(size.x,size.y),min(size.x,size.y));
  }

}

