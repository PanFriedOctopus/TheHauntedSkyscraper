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
class Character extends Sprite
{
	var vx:Float;
	var vy:Float;
	var floatx:Float;
	var floaty:Float;
	var JumpCount:Int;
	var imgl:Bitmap;
	var imgr:Bitmap;
	var img:BitmapData;
	public var sprite:Sprite;
	var b:Bool;
	var count:Int;
	
	public function new() 
	{
		super();
		//Adding Image
		sprite = new Sprite();
		imgl = new Bitmap(Assets.getBitmapData("img/catleft.png"));
		imgr = new Bitmap(Assets.getBitmapData("img/catright.png"));
		img = Assets.getBitmapData("img/cat.png");
		sprite.addChild(imgr);
		this.addChild(sprite);
		this.x = 200;
		this.y = 200;
		this.hitArea = sprite;
		
		//Space for Declaring start varibles
		this.floatx = this.x;
		this.floaty = this.y;
		vx = 0;
		vy = 0;
		JumpCount = 0;
		count = 0;
		
	}
	
	public function left()
	{
		this.vx -= .2;
		sprite.removeChildAt(0);
		sprite.addChild(imgl);
	}
	public function right()
	{
		this.vx += .2;
		sprite.removeChildAt(0);
		sprite.addChild(imgr);
	}
	public function jump()
	{
		if (JumpCount < 2)
		{
			this.vy = -4;
			JumpCount += 1;
		}
	}
	
	public function onPlatform()
	{
		
		for (platform in Main.game.platforms)
		{
			if (this.hitTestObject(platform))
			{
				return true;
			}
		}
		return false;
	}
	
	public function collectkey()
	{
		if (this.hitTestObject(Main.game.key))
		{
			return true;
		}
		return false;
	}
	public function touchdoor()
	{
		if (this.hitTestObject(Main.game.door))
		{
			return true;
		}
		return false;
	}
	public function moveposition(xl, yl)
	{
		this.x = xl;
		this.y = yl;
	}
	
	public function act()
	{
		//try to animate idk
		count = count +1;
		this.graphics.clear();
		var m:Matrix = new Matrix();
		//idk get help
		//m.translate(29 * (Std.int(count / 3) % 9), 92);
		//this.graphics.beginBitmapFill(img,m);
		
		//movement n stuff
		this.floaty += this.vy;
		this.y = Std.int(this.floaty);
		if (onPlatform())
		{
			this.floaty -= this.vy;
			this.y = Std.int(this.floaty);
			this.vy = 0;
			JumpCount = 0;
		}
		this.vy += .1;
		
		this.floatx += this.vx;
		this.x = Std.int(this.floatx);
		if (onPlatform())
		{
			this.floatx -= this.vx;
			this.x = Std.int(this.floatx);
			this.vx = 0;
		}
		this.vx *= .95;
	}
	
}