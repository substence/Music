package instruments
{
	import audio.AudioHandler;
	import audio.AudioLibrary;
	
	import cfg.Config;
	
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.media.Sound;
	import flash.utils.Dictionary;

	public class Instrument
	{
		public var name:String;
		public var buttonGraphic:String;
		public var preSelectAnimation:String;
		public var postSelectAnimation:String;
		private var _notes:Dictionary; 
		
		public function Instrument()
		{
			_notes = new Dictionary();
		}
		
		protected function addNote(note:String, soundLabel:String):void
		{
			_notes[note] = soundLabel;
		}
		
		public function playNote(note:String):Boolean
		{
			var soundLabel:String = _notes[note];
			if (soundLabel)
			{
				AudioHandler.playSoundByLabels(soundLabel, AudioLibrary.INSTRUMENT);
				return true;
			}
			return false;
		}
		
		public function loadAudio(loader:Loader):void
		{
			loadAuidioAsset(_notes[Config.NOTE_C], loader)
			loadAuidioAsset(_notes[Config.NOTE_B], loader)
			loadAuidioAsset(_notes[Config.NOTE_N], loader)
			loadAuidioAsset(_notes[Config.NOTE_V], loader)
		}
		
		private function loadAuidioAsset(label:String, loader:Loader):Boolean
		{
			var type:Class = Class(loader.contentLoaderInfo.applicationDomain.getDefinition(label));
			AudioHandler.registerSound(new type(), label);
			return true;
		}
	}
}