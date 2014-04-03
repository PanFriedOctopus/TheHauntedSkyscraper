package ;

import flash.geom.Matrix;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.KeyboardEvent;
import flash.Lib;
import flash.display.BitmapData;
import flash.display.Bitmap;
import flash.media.Sound;
import flash.net.URLRequest;
import flash.text.TextField;
import flash.text.TextFormat;
import openfl.Assets;
import motion.Actuate;
import flash.media.Sound;
import flash.media.SoundChannel;
import flash.media.SoundTransform;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;

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
	var imglk:Bitmap;
	var imgrk:Bitmap;
	var imgd:Bitmap;
	var img:BitmapData;
	var hasKey:Bool;
	
	public var dead:Bool;
	public var sprite:Sprite;
	var b:Bool;
	var count:Int;
	
	public function new(x,y) 
	{
		super();
		//Adding Image
		sprite = new Sprite();
		imgl = new Bitmap(Assets.getBitmapData("img/catleft.png"));
		imgr = new Bitmap(Assets.getBitmapData("img/catright.png"));
		imglk = new Bitmap(Assets.getBitmapData("img/catleftkey.png"));
		imgrk = new Bitmap(Assets.getBitmapData("img/catrightkey.png"));
		imgd = new Bitmap(Assets.getBitmapData("img/catdead.png"));
		//img = Assets.getBitmapData("img/cat.png");
		sprite.addChild(imgr);
		this.addChild(sprite);
		this.x = x;
		this.y = y;
		this.hitArea = sprite;
		
		//Space for Declaring start varibles
		this.floatx = this.x;
		this.floaty = this.y;
		vx = 0;
		vy = 0;
		JumpCount = 0;
		count = 0;
		hasKey = Main.game.doeshavekey();
		//dead = false;
		
	}
	
	public function left()
	{
		if (dead == false)
		{
			this.vx -= .2;
			sprite.removeChildAt(0);
			if (hasKey) sprite.addChild(imglk);
			else sprite.addChild(imgl);
		}
	}
	public function right()
	{
		if (dead == false)
		{
			this.vx += .2;
			sprite.removeChildAt(0);
			if (hasKey) sprite.addChild(imgrk);
			else sprite.addChild(imgr);
		}
	}
	public function jump()
	{
		if (dead == false)
		{
			if (JumpCount < 2)
			{
				this.vy = -4;
				JumpCount += 1;
				var song = Assets.getSound("audio/jump.wav");
				song.play();
			}
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
	public function attacked()
	{
		for (ghost in Main.game.ghosts)
		{
			if (this.hitTestObject(ghost))
			{
				var song1 = Assets.getSound("audio/hurt.wav");
				song1.play();
				return true;
			}
		}
		return false;
	}
	public function die()
	{
		dead =  true;
		sprite.removeChildAt(0);
		sprite.addChild(imgd);
	}
	public function collectkey()
	{
		if (this.hitTestObject(Main.game.key))
		{
			var song1 = Assets.getSound("audio/getkey.wav");
			song1.play();
			return true;
		}
		return false;
	}
	public function touchdoor()
	{
		if (this.hitTestObject(Main.game.door))
		{
			//var song2 = Assets.getSound("audio/opendoor.wav");
			//song2.play();
			return true;
		}
		return false;
	}
	public function moveposition(xl, yl)
	{
		this.x = xl;
		this.y = yl;
	}
	
	public function live()
	{
		dead = false;
	}
	public function act()
	{
		hasKey = Main.game.doeshavekey();
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