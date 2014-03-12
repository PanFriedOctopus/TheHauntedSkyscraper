package ;

import openfl.Assets;
import flash.Lib;
import flash.display.Sprite;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.KeyboardEvent;
import flash.media.SoundChannel;
import flash.media.Sound;
import flash.media.SoundTransform;
import motion.Actuate;
import motion.easing.Elastic;

/**
 * ...
 * @author Vic
 */

class Main extends Sprite 
{
	var inited:Bool;
	public var gameover:Sprite;
	var countframe:Int;
	public static var game:Main;
	public var character:Character;
	public var level1:Level_One;
	var keys:Array<Int>;
	public var key:Key;
	public var door:Door;
	public var platforms:Array<Platform>;
	var haskey:Bool;
	var win:Bool;
	var loose:Bool;
	var stopscroll:Bool;
	public var charay:Float;

	/* ENTRY POINT */
	
	function resize(e) 
	{
		if (!inited) init();
		// else (resize or orientation change)
	}
	
	function init() 
	{
		if (inited) return;
		inited = true;
		construction();

		// (your code here)
		
		// Stage:
		// stage.stageWidth x stage.stageHeight @ stage.dpiScale
		
		// Assets:
		// nme.Assets.getBitmapData("img/assetname.jpg");
	}

	/* SETUP */

	public function new() 
	{
		super();
		game = this;
		platforms = new Array<Platform>();
		addEventListener(Event.ADDED_TO_STAGE, added);
	}
	public function Level_1()
	{
		var p = new Platform(10, 400, 600, 10);
		platforms.push(p);
		this.addChild(p);
		p = new Platform(1990, 400, 600, 10);
		platforms.push(p);
		this.addChild(p);
		
		p = new Platform(1510, 300, 300, 50);
		platforms.push(p);
		this.addChild(p);
		p = new Platform(710, 300, 400, 10);
		platforms.push(p);
		this.addChild(p);
		p = new Platform(1200, 190, 150, 10);
		platforms.push(p);
		this.addChild(p);
		p = new Platform(350, 110, 600, 10);
		platforms.push(p);
		this.addChild(p);
		p = new Platform(380, -90, 200, 200);
		platforms.push(p);
		this.addChild(p);
		p = new Platform(710, -20, 100, 50);
		platforms.push(p);
		this.addChild(p);
		p = new Platform(800, -100, 100, 50);
		platforms.push(p);
		this.addChild(p);
		p = new Platform(890, -180, 100, 50);
		platforms.push(p);
		this.addChild(p);
		
		key = new Key(905, -205);
		this.addChild(key);
		door = new Door(2200, 355);
		this.addChild(door);
	}
	
	public function construction()
	{
		//Level construction
		Level_1();
		
		//varibles
		countframe = 0;
		haskey = false;
		win = false;
		loose = false;
		stopscroll = false;
		charay = 0;
		
		//Character creation
		character = new Character();
		this.addChild(character);
		
		//Game Over Screen
		gameover = new Sprite();
		gameover.addChild(new Bitmap(Assets.getBitmapData("img/gameover.png")));
		
		
		//Keys
		keys = new Array<Int>();
		
		//Add listeners
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, processKey);
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, processUpKey);
		Lib.current.stage.addEventListener(Event.ENTER_FRAME, action);
	}
	
	function processKey(e:KeyboardEvent)
	{
		if (! keyCheck(e.keyCode)) keys.push(e.keyCode);
		if (e.keyCode == 37) character.left();
		if (e.keyCode == 39) character.right();
		if (e.keyCode == 38) character.jump();
	}
	function processUpKey(e:KeyboardEvent)
	{
		keys.remove(e.keyCode);
	}
	function keyCheck(key:Int):Bool
	{
		for (item in keys)
		{
			if (item == key) return true;
		}
		return false;
	}

	function added(e) 
	{
		removeEventListener(Event.ADDED_TO_STAGE, added);
		stage.addEventListener(Event.RESIZE, resize);
		#if ios
		haxe.Timer.delay(init, 100); // iOS 6
		#else
		init();
		#end
	}
	
	function winlevel()
	{
		this.addChild(gameover);
		gameover.x = character.x-100;
		gameover.y = character.y-200;
		haskey = false;
	}
	
	function looselevel()
	{
		if (charay > 1000)
		{
			stopscroll = true;
			this.addChild(gameover);
			gameover.x = character.x;
			gameover.y = 520;
		}
	}
	
	public function action(e)
	{
		character.act();
		countframe++;
		if (stopscroll == false)
		{
			this.x = -character.x + 200;
			this.y = ( -character.y +200) * .9;
		}
		if (keyCheck(39)) character.right();
		if (keyCheck(37)) character.left();
		if (character.collectkey()) 
		{
			this.removeChild(key); 
			haskey = true;
		}
		if (character.touchdoor() && haskey) 
		{
			win = true;
			winlevel();
		}
		charay = character.y;
		//trace(charay);
		//trace(stopscroll);
		looselevel();
	}
	
	public static function main() 
	{
		// static entry point
		Lib.current.stage.align = flash.display.StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;
		Lib.current.addChild(new Main());
	}
}
