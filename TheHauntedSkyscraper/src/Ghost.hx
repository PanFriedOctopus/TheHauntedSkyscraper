package ;
import flash.display.Sprite;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.Lib;
import openfl.Assets;
import flash.geom.Matrix;

/**
 * ...
 * @author Vic
 */
class Ghost extends Sprite
{
	var img:Bitmap;
	var sprite:Sprite;
	public function new(x,y) 
	{
		super();
		sprite = new Sprite();
		img = new Bitmap(Assets.getBitmapData("img/ghost.png"));
		sprite.addChild(img);
		this.addChild(sprite);
		this.x = x;
		this.y = y;
		this.hitArea = sprite;
	}
	
}