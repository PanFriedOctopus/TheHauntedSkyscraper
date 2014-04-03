package;


import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.MovieClip;
import flash.text.Font;
import flash.media.Sound;
import flash.net.URLRequest;
import flash.utils.ByteArray;
import haxe.Unserializer;
import openfl.Assets;

#if (flash || js)
import flash.display.Loader;
import flash.events.Event;
import flash.net.URLLoader;
#end

#if ios
import openfl.utils.SystemPath;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public static var className (default, null) = new Map <String, Dynamic> ();
	public static var path (default, null) = new Map <String, String> ();
	public static var type (default, null) = new Map <String, AssetType> ();
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		className.set ("img/catdead.png", __ASSET__img_catdead_png);
		type.set ("img/catdead.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/catleft.png", __ASSET__img_catleft_png);
		type.set ("img/catleft.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/catleftkey.png", __ASSET__img_catleftkey_png);
		type.set ("img/catleftkey.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/catright.png", __ASSET__img_catright_png);
		type.set ("img/catright.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/catrightkey.png", __ASSET__img_catrightkey_png);
		type.set ("img/catrightkey.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/death.png", __ASSET__img_death_png);
		type.set ("img/death.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/door.png", __ASSET__img_door_png);
		type.set ("img/door.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/ghost.png", __ASSET__img_ghost_png);
		type.set ("img/ghost.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/key.png", __ASSET__img_key_png);
		type.set ("img/key.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/mmplay.png", __ASSET__img_mmplay_png);
		type.set ("img/mmplay.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/mmscores.png", __ASSET__img_mmscores_png);
		type.set ("img/mmscores.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/nextlevel.png", __ASSET__img_nextlevel_png);
		type.set ("img/nextlevel.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/no.png", __ASSET__img_no_png);
		type.set ("img/no.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/retry.png", __ASSET__img_retry_png);
		type.set ("img/retry.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/themainmenu.png", __ASSET__img_themainmenu_png);
		type.set ("img/themainmenu.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/win.png", __ASSET__img_win_png);
		type.set ("img/win.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/yes.png", __ASSET__img_yes_png);
		type.set ("img/yes.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("audio/buttontouch.wav", __ASSET__audio_buttontouch_wav);
		type.set ("audio/buttontouch.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("audio/getkey.wav", __ASSET__audio_getkey_wav);
		type.set ("audio/getkey.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("audio/hurt.wav", __ASSET__audio_hurt_wav);
		type.set ("audio/hurt.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("audio/jump.wav", __ASSET__audio_jump_wav);
		type.set ("audio/jump.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("audio/opendoor.wav", __ASSET__audio_opendoor_wav);
		type.set ("audio/opendoor.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("audio/Out_of_Sight_Into_the_Mind.mp3", __ASSET__audio_out_of_sight_into_the_mind_mp3);
		type.set ("audio/Out_of_Sight_Into_the_Mind.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		className.set ("leveltext/level1.txt", __ASSET__leveltext_level1_txt);
		type.set ("leveltext/level1.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("leveltext/level2.txt", __ASSET__leveltext_level2_txt);
		type.set ("leveltext/level2.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("leveltext/test.txt", __ASSET__leveltext_test_txt);
		type.set ("leveltext/test.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("leveltext/testlevel.txt", __ASSET__leveltext_testlevel_txt);
		type.set ("leveltext/testlevel.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		
		
		#elseif html5
		
		path.set ("img/catdead.png", "img/catdead.png");
		type.set ("img/catdead.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/catleft.png", "img/catleft.png");
		type.set ("img/catleft.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/catleftkey.png", "img/catleftkey.png");
		type.set ("img/catleftkey.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/catright.png", "img/catright.png");
		type.set ("img/catright.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/catrightkey.png", "img/catrightkey.png");
		type.set ("img/catrightkey.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/death.png", "img/death.png");
		type.set ("img/death.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/door.png", "img/door.png");
		type.set ("img/door.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/ghost.png", "img/ghost.png");
		type.set ("img/ghost.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/key.png", "img/key.png");
		type.set ("img/key.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/mmplay.png", "img/mmplay.png");
		type.set ("img/mmplay.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/mmscores.png", "img/mmscores.png");
		type.set ("img/mmscores.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/nextlevel.png", "img/nextlevel.png");
		type.set ("img/nextlevel.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/no.png", "img/no.png");
		type.set ("img/no.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/retry.png", "img/retry.png");
		type.set ("img/retry.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/themainmenu.png", "img/themainmenu.png");
		type.set ("img/themainmenu.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/win.png", "img/win.png");
		type.set ("img/win.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/yes.png", "img/yes.png");
		type.set ("img/yes.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("audio/buttontouch.wav", "audio/buttontouch.wav");
		type.set ("audio/buttontouch.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		path.set ("audio/getkey.wav", "audio/getkey.wav");
		type.set ("audio/getkey.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		path.set ("audio/hurt.wav", "audio/hurt.wav");
		type.set ("audio/hurt.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		path.set ("audio/jump.wav", "audio/jump.wav");
		type.set ("audio/jump.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		path.set ("audio/opendoor.wav", "audio/opendoor.wav");
		type.set ("audio/opendoor.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		path.set ("audio/Out_of_Sight_Into_the_Mind.mp3", "audio/Out_of_Sight_Into_the_Mind.mp3");
		type.set ("audio/Out_of_Sight_Into_the_Mind.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		path.set ("leveltext/level1.txt", "leveltext/level1.txt");
		type.set ("leveltext/level1.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("leveltext/level2.txt", "leveltext/level2.txt");
		type.set ("leveltext/level2.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("leveltext/test.txt", "leveltext/test.txt");
		type.set ("leveltext/test.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("leveltext/testlevel.txt", "leveltext/testlevel.txt");
		type.set ("leveltext/testlevel.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		
		
		#else
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<AssetData> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							path.set (asset.id, asset.path);
							type.set (asset.id, asset.type);
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest");
				
			}
			
		} catch (e:Dynamic) {
			
			trace ("Warning: Could not load asset manifest");
			
		}
		
		#end
		
	}
	
	
	public override function exists (id:String, type:AssetType):Bool {
		
		var assetType = DefaultAssetLibrary.type.get (id);
		
		#if pixi
		
		if (assetType == IMAGE) {
			
			return true;
			
		} else {
			
			return false;
			
		}
		
		#end
		
		if (assetType != null) {
			
			if (assetType == type || ((type == SOUND || type == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if ((assetType == BINARY || assetType == TEXT) && type == BINARY) {
				
				return true;
				
			} else if (path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (type == BINARY || type == null) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getBitmapData (id:String):BitmapData {
		
		#if pixi
		
		return BitmapData.fromImage (path.get (id));
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), BitmapData);
		
		#elseif js
		
		return cast (ApplicationMain.loaders.get (path.get (id)).contentLoaderInfo.content, Bitmap).bitmapData;
		
		#else
		
		return BitmapData.load (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if pixi
		
		return null;
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif js
		
		var bytes:ByteArray = null;
		var data = ApplicationMain.urlLoaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}

		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if pixi
		
		return null;
		
		#elseif (flash || js)
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		return new Font (path.get (id));
		
		#end
		
	}
	
	
	public override function getMusic (id:String):Sound {
		
		#if pixi
		
		//return null;		
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}
	
	
	public override function getPath (id:String):String {
		
		#if ios
		
		return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		#else
		
		return path.get (id);
		
		#end
		
	}
	
	
	public override function getSound (id:String):Sound {
		
		#if pixi
		
		return null;
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return new Sound (new URLRequest (path.get (id)), null, type.get (id) == MUSIC);
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:AssetType):Bool {
		
		#if flash
		
		if (type != AssetType.MUSIC && type != AssetType.SOUND) {
			
			return className.exists (id);
			
		}
		
		#end
		
		return true;
		
	}
	
	
	public override function loadBitmapData (id:String, handler:BitmapData -> Void):Void {
		
		#if pixi
		
		handler (getBitmapData (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBitmapData (id));
			
		}
		
		#else
		
		handler (getBitmapData (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if pixi
		
		handler (getBytes (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		handler (getBytes (id));
		
		#end
		
	}
	
	
	public override function loadFont (id:String, handler:Font -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getFont (id));
			
		//}
		
		#else
		
		handler (getFont (id));
		
		#end
		
	}
	
	
	public override function loadMusic (id:String, handler:Sound -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}
	
	
	public override function loadSound (id:String, handler:Sound -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getSound (id));
			
		//}
		
		#else
		
		handler (getSound (id));
		
		#end
		
	}
	
	
}


#if pixi
#elseif flash

class __ASSET__img_catdead_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_catleft_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_catleftkey_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_catright_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_catrightkey_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_death_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_door_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_ghost_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_key_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_mmplay_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_mmscores_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_nextlevel_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_no_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_retry_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_themainmenu_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_win_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_yes_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__audio_buttontouch_wav extends flash.media.Sound { }
class __ASSET__audio_getkey_wav extends flash.media.Sound { }
class __ASSET__audio_hurt_wav extends flash.media.Sound { }
class __ASSET__audio_jump_wav extends flash.media.Sound { }
class __ASSET__audio_opendoor_wav extends flash.media.Sound { }
class __ASSET__audio_out_of_sight_into_the_mind_mp3 extends flash.media.Sound { }
class __ASSET__leveltext_level1_txt extends flash.utils.ByteArray { }
class __ASSET__leveltext_level2_txt extends flash.utils.ByteArray { }
class __ASSET__leveltext_test_txt extends flash.utils.ByteArray { }
class __ASSET__leveltext_testlevel_txt extends flash.utils.ByteArray { }


#elseif html5






























#end