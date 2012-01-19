package
{
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	import flash.events.ProgressEvent;
	
	import utils.InputHandler;

	public class ChuckVPreloader extends Sprite
	{
		private var _preLoaderUI:ChuckPreloader;
		private var _loaderInfo:LoaderInfo;
		
		public function ChuckVPreloader(loader:LoaderInfo)
		{
			_loaderInfo = loader;
			_preLoaderUI = new ChuckPreloader();
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
			_preLoaderUI.lbc.text = "5";
		}
		
		public function get preLoaderUI():ChuckPreloader
		{
			return _preLoaderUI;
		}

		private function addedToStage(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			addChild(_preLoaderUI);
			_preLoaderUI.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function error(event:IOErrorEvent):void
		{
			throw new Error(event.toString());
		}
		
		private function onEnterFrame(event:Event):void
		{
			var percentComplete:Number = _loaderInfo.bytesLoaded / _loaderInfo.bytesTotal;
			_preLoaderUI.lbar.scaleX = percentComplete;
			_preLoaderUI.lbc.text = String(int(percentComplete * 100)) + "%";
			if (percentComplete >= 1)
				loadComplete();
		}
		
		private function loadComplete(event:Event = null):void
		{
			_preLoaderUI.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			dispatchEvent(new Event(Event.COMPLETE));
			if (parent)
				removeChild(_preLoaderUI);
		}
	}
}