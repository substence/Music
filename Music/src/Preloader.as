package
{
	import cfg.Config;
	
	import flash.display.LoaderInfo;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.media.SoundTransform;
	import flash.system.ApplicationDomain;
	import flash.utils.getDefinitionByName;

	public class Preloader extends MovieClip
	{
		private var _preloader:ChuckVPreloader;
		private static var _staticRefernce:Preloader;
		
		public function Preloader()
		{
			addEventListener(Event.ADDED_TO_STAGE, load);
			_staticRefernce = this;
		}
		
		private function load(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, load);
			_preloader = new ChuckVPreloader(stage.loaderInfo);
			//_preloader.preLoaderUI.y += 100;
			var mask:Mask = new Mask();
			mask.x += 7.5;
			addChild(mask);
			this.mask = mask;
			addChild(_preloader);
			_preloader.addEventListener(Event.COMPLETE, loadComplete);
		}
		
		private function loadComplete(event:Event = null):void
		{
			_preloader.removeEventListener(Event.COMPLETE, loadComplete);
			//var mainClass:* = loaderInfo.applicationDomain.parentDomain.getDefinition("Main");
			var mainClass:* = loaderInfo.applicationDomain.getDefinition("Main");
			var main:* = new mainClass();
			//main.addEventListener("event_back", pressedBack);
			addChild(main);
			addEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
		}
		
/*		private function pressedBack(event:Event):void
		{
			throw new Error("pressed back");
			dispatchEvent(new Event("event_back"));
		}*/
		
		private function removedFromStage(event:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
			soundTransform = new SoundTransform(0);
		}
		
		public static function dispatchExternalEvent(event:Event):void
		{
			Main.main.dispatchEvent(event);
			_staticRefernce.dispatchEvent(event);
		}
	}
}