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
	public var winimg:Sprite;
	var countframe:Int;
	var count:Int;
	public static var game:Main;
	public var character:Character;
	public var ghosts:Array<Ghost>;
	public var E1:Ghost;
	public var level1:Level_One;
	var keys:Array<Int>;
	public var key:Key;
	public var door:Door;
	public var platforms:Array<Platform>;
	public var haskey:Bool;
	var win:Bool;
	var loose:Bool;
	var stopscroll:Bool;
	public var charay:Float;
	public var dead:Bool;

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
		ghosts = new Array<Ghost>();
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
		
		var g = new Ghost(250, 250);
		ghosts.push(g);
		this.addChild(g);
		var g = new Ghost(0, 0);
		ghosts.push(g);
		this.addChild(g);
		var g = new Ghost(500, 500);
		ghosts.push(g);
		this.addChild(g);
		key = new Key(905, -205);
		this.addChild(key);
		door = new Door(2200, 355);
		this.addChild(door);
	}
	
	public function construction()
	{
		//Character creation
		character = new Character();
		this.addChild(character);
		
		//Level construction
		Level_1();
		
		//varibles
		countframe = 0;
		haskey = false;
		win = false;
		loose = false;
		stopscroll = false;
		charay = 0;
		dead = false; 
		count = 0;
		
		
		//Game Over Screen
		gameover = new Sprite();
		gameover.addChild(new Bitmap(Assets.getBitmapData("img/death.png")));
		winimg = new Sprite();
		winimg.addChild(new Bitmap(Assets.getBitmapData("img/win.png")));
		
		
		//Keys
		keys = new Array<Int>();
		
		//Add listeners
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, processKey);
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, processUpKey);
		Lib.current.stage.addEventListener(Event.ENTER_FRAME, action);
	}
	
	public function doeshavekey():Bool
	{
		if (haskey == true) return true;
		else return false;
	}
	
	function processKey(e:KeyboardEvent)
	{
		if (stopscroll == false)
		{
			if (! keyCheck(e.keyCode)) keys.push(e.keyCode);
			if (e.keyCode == 37) character.left();
			if (e.keyCode == 39) character.right();
			if (e.keyCode == 38 || e.keyCode == 32) character.jump();
		}
		trace(e.keyCode);
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
	
	function removeCharacter()
	{
		this.removeChild(character);
	}
	
	function winlevel()
	{
		this.addChild(winimg);
		winimg.x = door.x+85;
		winimg.y = door.y-30;
		haskey = false;
	}
	
	function looselevel()
	{
		if (charay > 1000)
		{
			stopscroll = true;
			this.addChild(gameover);
			gameover.x = character.x+25;
			gameover.y = 1025;
			//removeCharacter();
		}
	}
	
	public function action(e)
	{
		if (character.attacked() == true)
		{
			for (ghost in ghosts)
			{
				ghost.killed();				
			}
			character.die();
			this.addChild(gameover);
			gameover.x = character.x+25;
			gameover.y = character.y-25;
		}
		//count++;
		character.act();
		for (ghost in ghosts)
		{
			ghost.desitnation(character.x, character.y);
			ghost.act();
		}
		//count = 0;
		
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
