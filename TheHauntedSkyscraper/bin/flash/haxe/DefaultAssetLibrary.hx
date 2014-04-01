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
		
		className.set ("img/cat.png", __ASSET__img_cat_png);
		type.set ("img/cat.png", Reflect.field (AssetType, "image".toUpperCase ()));
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
		className.set ("img/Character.png", __ASSET__img_character_png);
		type.set ("img/Character.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/death.png", __ASSET__img_death_png);
		type.set ("img/death.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/door.png", __ASSET__img_door_png);
		type.set ("img/door.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/gameover.png", __ASSET__img_gameover_png);
		type.set ("img/gameover.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/ghost.png", __ASSET__img_ghost_png);
		type.set ("img/ghost.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/key.png", __ASSET__img_key_png);
		type.set ("img/key.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/mainmenu.png", __ASSET__img_mainmenu_png);
		type.set ("img/mainmenu.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/mmplay.png", __ASSET__img_mmplay_png);
		type.set ("img/mmplay.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/mmscores.png", __ASSET__img_mmscores_png);
		type.set ("img/mmscores.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/replaylevel.png", __ASSET__img_replaylevel_png);
		type.set ("img/replaylevel.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/win.png", __ASSET__img_win_png);
		type.set ("img/win.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("audio/Breathing_Cyborg.mp3", __ASSET__audio_breathing_cyborg_mp3);
		type.set ("audio/Breathing_Cyborg.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		className.set ("audio/Breathing_Cyborg.wav", __ASSET__audio_breathing_cyborg_wav);
		type.set ("audio/Breathing_Cyborg.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		
		
		#elseif html5
		
		path.set ("img/cat.png", "img/cat.png");
		type.set ("img/cat.png", Reflect.field (AssetType, "image".toUpperCase ()));
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
		path.set ("img/Character.png", "img/Character.png");
		type.set ("img/Character.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/death.png", "img/death.png");
		type.set ("img/death.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/door.png", "img/door.png");
		type.set ("img/door.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/gameover.png", "img/gameover.png");
		type.set ("img/gameover.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/ghost.png", "img/ghost.png");
		type.set ("img/ghost.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/key.png", "img/key.png");
		type.set ("img/key.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/mainmenu.png", "img/mainmenu.png");
		type.set ("img/mainmenu.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/mmplay.png", "img/mmplay.png");
		type.set ("img/mmplay.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/mmscores.png", "img/mmscores.png");
		type.set ("img/mmscores.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/replaylevel.png", "img/replaylevel.png");
		type.set ("img/replaylevel.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/win.png", "img/win.png");
		type.set ("img/win.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("audio/Breathing_Cyborg.mp3", "audio/Breathing_Cyborg.mp3");
		type.set ("audio/Breathing_Cyborg.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		path.set ("audio/Breathing_Cyborg.wav", "audio/Breathing_Cyborg.wav");
		type.set ("audio/Breathing_Cyborg.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		
		
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

class __ASSET__img_cat_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_catdead_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_catleft_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_catleftkey_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_catright_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_catrightkey_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_character_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_death_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_door_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_gameover_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_ghost_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_key_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_mainmenu_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_mmplay_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_mmscores_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_replaylevel_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_win_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__audio_breathing_cyborg_mp3 extends flash.media.Sound { }
class __ASSET__audio_breathing_cyborg_wav extends flash.media.Sound { }


#elseif html5






















#end