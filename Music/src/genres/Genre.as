package genres
{
	import animation.AnimationController;
	import animation.AnimationLibrary;
	
	import cfg.Config;
	
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	
	import instruments.Instrument;
	
	import interfaces.ILoadable;
	
	import songs.Song;

	public class Genre extends EventDispatcher implements ILoadable
	{
		public var playlist:Array;
		public var name:String;
		public var directory:String;
		public var assetDirectory:String;
		public var instrumentFrame:uint = 315;
		//
		public var animationIntro:String = AnimationLibrary.CHARACTERS_INTRO;
		public var animationInstructions:String = AnimationLibrary.CHARACTERS_INSTRUCTIONS;
		public var animationGetReady:String = AnimationLibrary.CHARACTERS_GET_READY;
		public var animationFinish:String = AnimationLibrary.CHARACTERS_FINISH;
		//public var animationStartLevel:String = AnimationLibrary.CHARACTERS_START_LEVEL;
		public var animationStartLevel1:String = AnimationLibrary.CHARACTERS_START_LEVEL_1;
		public var animationStartLevel2:String = AnimationLibrary.CHARACTERS_START_LEVEL_2;
		public var animationStartLevel3:String = AnimationLibrary.CHARACTERS_START_LEVEL_3;
		private var _loader:Loader;
		public var fontSize:uint = 20;
	
		public function get loader():Loader
		{
			return _loader;
		}

		public function load():Loader
		{
			var url:URLRequest = new URLRequest(Config.ASSET_DIRECTORY + directory + assetDirectory);
			_loader = new Loader();
			var context:LoaderContext = new LoaderContext();
			context.applicationDomain = ApplicationDomain.currentDomain;
			_loader.load(url, context);
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE,loadComplete);
			_loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,loadError);
			_loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loadError);
			return _loader;
		}
		
		private function loadError(event:IOErrorEvent):void
		{
			trace("Genre.load(), "+event.text);
		}
		
		private function loadComplete(event:Event):void
		{
			AnimationLibrary.addAnimation(AnimationLibrary.CHARACTERS_INTRO, getClassFromString(animationIntro));
			AnimationLibrary.addAnimation(AnimationLibrary.CHARACTERS_FINISH, getClassFromString(animationFinish));
			AnimationLibrary.addAnimation(AnimationLibrary.CHARACTERS_START_LEVEL_1, getClassFromString(animationStartLevel1));
			AnimationLibrary.addAnimation(AnimationLibrary.CHARACTERS_START_LEVEL_2, getClassFromString(animationStartLevel2));
			AnimationLibrary.addAnimation(AnimationLibrary.CHARACTERS_START_LEVEL_3, getClassFromString(animationStartLevel3));
			for (var i:int = 0; i < playlist.length; i++) 
			{
				var song:Song = playlist[i];
				for (var j:int = 0; j < song.instruments.length; j++) 
				{
					var instrument:Instrument = Instrument(song.instruments[j]);
					var postSelectAnimation:String = instrument.postSelectAnimation;
					var type:Class = getClassFromString(postSelectAnimation);
					if (type)
						AnimationLibrary.addAnimation(postSelectAnimation, type);
					else
						instrument.postSelectAnimation = AnimationLibrary.GENERIC_POST_SELECT;
				}
			}
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
		public function getClassFromString(className:String):Class
		{
			var type:Class;
			try
			{
				type = _loader.contentLoaderInfo.applicationDomain.getDefinition(className) as Class;
			} 
			catch(error:Error) 
			{
				trace(error);
			}
			return type;
		}
	}
}