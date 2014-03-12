package ;

import openfl.Assets;
import flash.Lib;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.KeyboardEvent;
import flash.media.SoundChannel;
import flash.media.Sound;
import flash.media.SoundTransform;
import motion.Actuate;
import motion.easing.Elastic;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.geom.Matrix;

/**
 * ...
 * @author Vic
 */
class Level_One extends Sprite
{
	public var platforms:Array<Platform>;

	public function new() 
	{
		super();
		platforms = new Array<Platform>();
		var p = new Platform(10, 400, 600, 10);
		platforms.push(p);
		this.addChild(p);
		p = new Platform(1990, 400, 600, 10);
		platforms.push(p);
		this.addChild(p);
		p = new Platform(1300, 80, 600, 10);
		platforms.push(p);
		this.addChild(p);
		p = new Platform(810, 60, 600, 10);
		platforms.push(p);
		this.addChild(p);
		p = new Platform(350, -10, 600, 10);
		platforms.push(p);
		this.addChild(p);
		p = new Platform(380, -10, 200, 200);
		platforms.push(p);
		this.addChild(p);
	}
	
}