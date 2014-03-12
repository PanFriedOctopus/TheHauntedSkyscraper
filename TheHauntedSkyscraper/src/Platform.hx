package ;

import flash.display.Sprite;

/**
 * ...
 * @author Vic
 */
class Platform extends Sprite
{

	public function new(x,y,w,h) 
	{
		super();
		this.graphics.beginFill(0x56495f);
		this.graphics.drawRoundRect(0, 0, w, h, 4);
		this.x = x;
		this.y = y;
	}
	
}