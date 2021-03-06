int c = 0;
Bacteria[] bob = new Bacteria[16];
Food particle;
void setup()   
{
	size(600,600);
	background(360);
	colorMode(HSB,360);
	for(int i=0;i<bob.length;i++)
	{
		bob[i] = new Bacteria(300,300,c);
	}
	particle = new Food(150,150);
}   
void draw()   
{
	fill(360);
	rect(0,0,600,600);
	for(int i=0;i<bob.length;i++)
	{
		bob[i].walk();
		bob[i].show();
		particle.show();
	}
}
void mousePressed()
{
	if(mouseButton == LEFT)
	{
		for(int i=0;i<bob.length;i++)
		{
			bob[i] = new Bacteria(mouseX -mouseX%2,mouseY -mouseY%2,c); 
		}
	}
	else if (mouseButton == RIGHT)
	{
		particle = new Food(mouseX -mouseX%2,mouseY -mouseY%2);
	}
}
void keyPressed()
{
	if (key == CODED)
	{
    	switch (keyCode)
		{
			case UP : 
			{	
				c++;
				c%=120;
				while(c<0)
				{c+=120;}
				break;
			}
			case DOWN : 
			{
				c--;
				c%=120;
				while(c<0)
				{c+=120;}
				break;
			}
		}
	}
	
}
class Bacteria    
{     
	int x;
	int y;
	int sz;
	int col;
	int sx;
	int sy;
	Bacteria(int x, int y, int col)
	{
		this.x = x;
		this.y = y;
		this.col = 0;
		sz = 2;
	}
	void walk()
	{
		if(abs(particle.x-x)<2 && abs(particle.y-y)<2 && particle.quan>0)
		{
				feed();
				return;
		}
		if(sqrt((x -particle.x)*(x -particle.x)+(y -particle.y)*(y -particle.y))<particle.quan*particle.quan && particle.quan>0)
		{
			boolean xSgn = (x -particle.x)==(Math.abs(x -particle.x));
			boolean ySgn = (y -particle.y)==(Math.abs(y -particle.y));
			if(xSgn)
			{
				if(ySgn)
				{
					x += 2*((int)(Math.random()*3) -2);
					y += 2*((int)(Math.random()*3) -2);
				}
				else
				{
					x += 2*((int)(Math.random()*3) -2);
					y += 2*(int)(Math.random()*3);
				}
			}
			else
			{
				if(ySgn)
				{
					x += 2*(int)(Math.random()*3);
					y += 2*((int)(Math.random()*3) -2);
				}
				else
				{
					x += 2*(int)(Math.random()*3);
					y += 2*(int)(Math.random()*3);
				}
			}
		}
		else
		{
			x += 2*((int)(Math.random()*3) -1);
			y += 2*((int)(Math.random()*3) -1);
			sx = x;
			sy = y;
		}
	}
	void feed()
	{
			particle.quan--;
			sz++;
			col = particle.col;
	}
	void show()
	{
		stroke(0);
		fill(3*col,360,180);
		ellipse(x, y, sz, sz);
	}
}
class Food
{
	int x;
	int y;
	int quan;
	int col;
	Food(int x, int y)
	{
		this.x = x;
		this.y = y;
		quan = (int)(Math.random()*16)+1;
		this.col = c;
	}
	void show()
	{
		if(particle.quan>0)
		{
			stroke(3*col,360,180);
			fill(3*col,360,180);
			ellipse(x,y,quan,quan);
		}
	}
}