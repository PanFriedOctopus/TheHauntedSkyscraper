package ;

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

class Main extends Sprite 
{
	var inited:Bool;
	
	var win:Bool;
	var loose:Bool;
	var stopscroll:Bool;
	public var dead:Bool;
	public var haskey:Bool;
	
	public static var game:Main;
	public var level:String;
	
	var countframe:Int;
	var count:Int;
	var keys:Array<Int>;
	
	public var charay:Float;
	
	public var gameover:Sprite;
	public var winimg:Sprite;
	public var deadmenu:Sprite;
	public var mainmenu:Sprite;
	public var playbutton:Sprite;
	public var retrybutton:Sprite;
	public var returntommbutton:Sprite;
	
	public var character:Character;
	public var key:Key;
	public var door:Door;
	public var level1:Level_One;
	public var ghosts:Array<Ghost>;
	public var platforms:Array<Platform>;	

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
		//menu sprite
		mainmenu = new Sprite();
		var menu = new Bitmap(Assets.getBitmapData("img/mainmenu.png"));
		mainmenu.addChild(menu);
		
		//play button
		/*Add play button*/		
		playbutton = new Sprite();
		var playButtonIcon = new Bitmap(Assets.getBitmapData("img/mmplay.png"));
		playbutton.addChild(playButtonIcon);
		mainmenu.addChild(playbutton);
		playbutton.x = 50;
		playbutton.y = 290;
		
		//Add event listeners
		playbutton.addEventListener(MouseEvent.MOUSE_DOWN, playGame);
		
		this.addChild(mainmenu);
		//construction();
		//var song = Assets.getSound("audio/Breathing_Cyborg.wav");
		//song.play();

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
	public function playGame(e:MouseEvent) 
	{
		this.removeChild(mainmenu);
		construction();
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
		
		deadmenu = new Sprite();
		deadmenu.graphics.beginFill(0x000000, .25);
		deadmenu.graphics.drawRect(0, 0, 800, 480);
		var d = new Bitmap(Assets.getBitmapData("img/replaylevel.png"));
		deadmenu.addChild(d);
		d.x = 560;
		d.y = 350;
		//deadmenu.addChild(quitgame);
		//quitgame.y = 350;
		
		//buttons
		retrybutton = new Sprite();
		retrybutton.addChild(new Bitmap(Assets.getBitmapData("img/retry.png")));
		returntommbutton = new Sprite();
		returntommbutton.addChildnew Bitmap(Assets.getBitmapData("img/mainmenu.png")));
		
		//Keys
		keys = new Array<Int>();
		
		//Add listeners
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, processKey);
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, processUpKey);
		Lib.current.stage.addEventListener(Event.ENTER_FRAME, action);
		retrybutton.addEventListener(MouseEvent.MOUSE_DOWN, retry_mouse);
		returntommbutton.addEventListener(MouseEvent.MOUSE_DOWN, returntomm_mouse);
	}
	
	public function retry_mouse(e:MouseEvent)
	{
		while (this.numChildren > 0) this.removeChildAt(0);
		nextlevelcreation();
	}
	public function returntomm_mouse(e:MouseEvent)
	{
		while (this.numChildren > 0) this.removeChildAt(0);
		quitthegame();
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
