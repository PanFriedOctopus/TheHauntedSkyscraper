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
//import haxe.xml.Parser.S;
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
	var xcount:Int;
	var ycount:Int;
	var levelcount:Int;
	var originalx:Float;
	var originaly:Float;
	var keys:Array<Int>;
	
	public var charay:Float;
	public var origcharay:Float;
	public var doory:Float;
	public var testy:Float;
	
	public var gameover:Sprite;
	public var winimg:Sprite;
	public var deadmenu:Sprite;
	public var winmenu:Sprite;
	public var mainmenu:Sprite;
	public var playbutton:Sprite;
	public var noretry:Sprite;
	public var yesretry:Sprite;
	public var nonext:Sprite;
	public var yesnext:Sprite;
	
	public var character:Character;
	public var key:Key;
	public var door:Door;
	public var level1:Level_One;
	public var ghosts:Array<Ghost>;
	public var g:Ghost;
	public var platforms:Array<Platform>;	
	public var p:Platform;
	
	public var buttonblip:Sound; 

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
		
		levelcount = 1;
		buttonblip = Assets.getSound("audio/buttontouch.wav");
		
		//menu sprite
		mainmenu = new Sprite();
		var menu = new Bitmap(Assets.getBitmapData("img/themainmenu.png"));
		mainmenu.addChild(menu);
		
		//play button
		/*Add play button*/		
		playbutton = new Sprite();
		var playButtonIcon = new Bitmap(Assets.getBitmapData("img/mmplay.png"));
		playbutton.addChild(playButtonIcon);
		mainmenu.addChild(playbutton);
		playbutton.x = 450;
		playbutton.y = 350;
		
		//Add event listeners
		playbutton.addEventListener(MouseEvent.MOUSE_DOWN, playGame);
		
		this.addChild(mainmenu);
		
		//var song = Assets.getSound("audio/Breathing_Cyborg(unedited).wav");
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
		testy = 0;
		addEventListener(Event.ADDED_TO_STAGE, added);
	}
	public function playGame(e:MouseEvent) 
	{
		buttonblip.play();
		this.removeChild(mainmenu);
		while(ghosts.length>0)
		{
			g = ghosts.pop();
			if (this.contains(g)) this.removeChild(g);
			//trace("deleted ghost");
		}
		while (this.numChildren > 0) 
		{
			this.removeChildAt(0);
		}
		construction();
	}
	public function levelconstruct()
	{
		while(ghosts.length>0)
		{
			g = ghosts.pop();
			if (this.contains(g)) this.removeChild(g);
			//trace("deleted ghost");
		}
		while (this.numChildren > 0) 
		{
			this.removeChildAt(0);
		} 
		//Level construction
		var levellength = level.length;
		var lengthcounter = 0;
		xcount = 0;
		ycount = 0;
		while (lengthcounter < levellength)
		{
			if (level.charAt(lengthcounter) == "c")
			{
				character = new Character(xcount, ycount - 30);
				origcharay = ycount -30;
			}
			else if (level.charAt(lengthcounter) == "b")
			{
				p = new Platform(xcount, ycount, 250, 10);
				platforms.push(p);
				this.addChild(p);
			}
			else if (level.charAt(lengthcounter) == "s")
			{
				xcount = xcount + 100;
			}
			else if (level.charAt(lengthcounter) == "\n")
			{
				ycount = ycount + 100;
				xcount = 0;
			}
			else if (level.charAt(lengthcounter) == "g")
			{
				g = new Ghost(xcount, ycount);
				ghosts.push(g);
			}
			else if (level.charAt(lengthcounter) == "d")
			{
				door = new Door(xcount, ycount-45);
				this.addChild(door);
				doory = ycount - 45;
			}
			else if (level.charAt(lengthcounter) == "k")
			{
				key = new Key(xcount, ycount-30);
				this.addChild(key);
			}
			doory = doory +1000;
			xcount = xcount + 25;
			lengthcounter++;
		}
		for (g in ghosts) this.addChild(g);
		this.addChild(character);
	}
	public function construction()
	{
		
		if (levelcount == 1)
		{
			level = Assets.getText("leveltext/level1.txt");
		}
		if (levelcount == 2)
		{
			level = Assets.getText("leveltext/level2.txt");
		}
		levelconstruct();
		originalx = this.x;
		originaly = this.y;
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
		deadmenu.addChild(new Bitmap(Assets.getBitmapData("img/retry.png")));
		
		yesretry = new Sprite();
		yesretry.addChild(new Bitmap(Assets.getBitmapData("img/yes.png")));
		yesretry.x = 50;
		yesretry.y = 30;
		deadmenu.addChild(yesretry);
		yesretry.addEventListener(MouseEvent.MOUSE_DOWN, yesretry_mouse);

		noretry = new Sprite();
		noretry.addChild(new Bitmap(Assets.getBitmapData("img/no.png")));
		noretry.x = 140;
		noretry.y = 30;
		deadmenu.addChild(noretry);
		noretry.addEventListener(MouseEvent.MOUSE_DOWN, noretry_mouse);
		
		winmenu = new Sprite();
		winmenu.addChild(new Bitmap(Assets.getBitmapData("img/nextlevel.png")));
		
		yesnext = new Sprite();
		yesnext.addChild(new Bitmap(Assets.getBitmapData("img/yes.png")));
		yesnext.x = 50;
		yesnext.y = 30;
		winmenu.addChild(yesnext);
		yesnext.addEventListener(MouseEvent.MOUSE_DOWN, yesnext_mouse);
		
		nonext = new Sprite();
		nonext.addChild(new Bitmap(Assets.getBitmapData("img/no.png")));
		nonext.x = 140;
		nonext.y = 30;
		winmenu.addChild(nonext);
		nonext.addEventListener(MouseEvent.MOUSE_DOWN, nonext_mouse);
		
		//this.addChild(deadmenu);
		
		//Keys
		keys = new Array<Int>();
		
		//Add listeners
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, processKey);
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, processUpKey);
		Lib.current.stage.addEventListener(Event.ENTER_FRAME, action);
		//retrybutton.addEventListener(MouseEvent.MOUSE_DOWN, retry_mouse);
		//returntommbutton.addEventListener(MouseEvent.MOUSE_DOWN, returntomm_mouse);
	}
	public function retry()
	{
		//trace("hey");
		while(ghosts.length>0)
		{
			g = ghosts.pop();
			if (this.contains(g)) this.removeChild(g);
		}
		while (this.numChildren > 0) 
		{
			this.removeChildAt(0);
		}
		this.x = 0;
		this.y = 0;
		this.addChild(deadmenu);
		deadmenu.x = 760;
		deadmenu.y = 25;
	}
	public function yesretry_mouse(e:MouseEvent) //works for level 1
	{
		buttonblip.play();
		while(ghosts.length>0)
		{
			g = ghosts.pop();
			if (this.contains(g)) this.removeChild(g);
			//trace("deleted ghost");
		}
		while (this.numChildren > 0) 
		{
			this.removeChildAt(0);
		}
		this.x = originalx;
		this.y = originaly;
		stopscroll = false;
		haskey = false;
		levelconstruct();
	}
	public function noretry_mouse(e:MouseEvent) //works for level 1
	{
		if (this.contains(gameover)) this.removeChild(gameover);
		if (this.contains(deadmenu)) this.removeChild(deadmenu);
		while(ghosts.length>0)
		{
			g = ghosts.pop();
			if (this.contains(g)) this.removeChild(g);
		}
		while (this.numChildren > 0) 
		{
			this.removeChildAt(0);
		}
		//trace ("Children :" +numChildren);
		this.addChild(mainmenu);
		levelcount = 1;
		mainmenu.x = 0;
		mainmenu.y = 0;
		this.x = 0;
		this.y = 0;
		if (this.contains(gameover)) this.removeChild(gameover);
		if (this.contains(deadmenu)) this.removeChild(deadmenu);
	}
	
	public function yesnext_mouse(e:MouseEvent) 
	{
		buttonblip.play();
		if(this.contains(winmenu)) this.removeChild(winmenu);
		while(ghosts.length>0)
		{
			g = ghosts.pop();
			if (this.contains(g)) this.removeChild(g);
		}
		while (this.numChildren > 0) 
		{
			this.removeChildAt(0);
		}
		//trace ("Children :" +numChildren);
		levelcount++;
		this.x = originalx;
		this.y = originaly;
		stopscroll = false;
		haskey = false;
		if (levelcount == 2)
		{
			level = Assets.getText("leveltext/level2.txt");
		}
		levelconstruct();
		character.live();
	}
	public function nonext_mouse(e:MouseEvent) //works for first level
	{
		buttonblip.play();
		while(ghosts.length>0)
		{
			g = ghosts.pop();
			if (this.contains(g)) this.removeChild(g);
		}
		while (this.numChildren > 0) 
		{
			this.removeChildAt(0);
		}
		this.addChild(mainmenu);
		levelcount = 1;
		mainmenu.x = 0;
		mainmenu.y = 0;
		this.x = 0;
		this.y = 0;
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
			if (e.keyCode == 82) retry();
			if (e.keyCode == 38 || e.keyCode == 32) character.jump();
		}
		//trace(e.keyCode);
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
		if(this.contains(character)) this.removeChild(character);
	}
	
	public function winlevel()
	{
		stopscroll = true;
		this.addChild(winimg);
		winimg.x = door.x+85;
		winimg.y = door.y-30;
		haskey = false;
		for (g in ghosts) g.killed();
		this.addChild(winmenu);
		winmenu.x = door.x +185;
		winmenu.y = door.y-130;
	}
	
	public function looselevel()
	{
		if (origcharay > doory)
		{
			testy = origcharay;
		}
		else if (doory > origcharay)
		{
			testy = doory;
		}
		if (charay > testy+2000)
		{
			stopscroll = true;
			this.addChild(gameover);
			gameover.x = character.x+25;
			gameover.y = 1025;
			this.addChild(deadmenu);
			deadmenu.x = character.x +125;
			deadmenu.y = 1025;
			
		}
		if (character.dead == true)
		{
			stopscroll = true;
			this.addChild(gameover);
			gameover.x = character.x+25;
			gameover.y = character.y -25;
			this.addChild(deadmenu);
			deadmenu.x = character.x +125;
			deadmenu.y = character.y -110;
			
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
			if(this.contains(key)) this.removeChild(key); 
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
