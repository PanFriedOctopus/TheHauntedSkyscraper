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
class Door extends Sprite
{
	public var sprite:Sprite;
	public function new(xl,yl) 
	{
		super();
		var img = new Bitmap(Assets.getBitmapData("img/door.png"));
		sprite = new Sprite();
		sprite.addChild(img);
		this.addChild(sprite);
		this.x = xl;
		this.y = yl;
		this.hitArea = sprite;
	}
	
}