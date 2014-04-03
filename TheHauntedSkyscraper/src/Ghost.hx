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
	var desx:Float;
	var desy:Float;
	var orix:Float;
	var oriy:Float;
	var pastdis:Float;
	var nowdis:Float;
	var vy:Float;
	var vx:Float;
	var speed:Float;
	var done:Bool;
	public function new(x,y) 
	{
		super();
		sprite = new Sprite();
		img = new Bitmap(Assets.getBitmapData("img/ghost.png"));
		sprite.addChild(img);
		this.addChild(sprite);
		this.x = x;
		this.y = y;
		vy = 0;
		vx = 0;
		speed = .5;
		pastdis = 100;
		orix = this.x;
		oriy = this.y;
		desx = 0;
		desy = 0;
		this.hitArea = sprite;
	}
	public function desitnation(x, y)
	{
		if (done == false)
		{
			desx = x;
			desy = y;
			orix = this.x;
			oriy = this.y;
			nowdis = Math.sqrt(((desx - orix) * (desx - orix)) + ((desy - oriy) * (desy - oriy)));
			if (nowdis < pastdis)
			{
				speed = speed + .01;
			}
			else 
			{
				speed = speed - .009;
			}
			pastdis = nowdis;
			var a = Math.atan2(desy - oriy, desx - orix);
			vy = Math.sin(a) * speed;
			vx = Math.cos(a) * speed;
		}
	}
	public function killed()
	{
		done = true;
	}
	public function act()
	{
		if (done == true)
		{
			this.y -=.5;
		}
		else if (done == false)
		{
			this.x += vx;
			this.y += vy;
		}
		
	}
	
	
}