package songs
{
	import audio.AChannel;
	import audio.AudioHandler;
	import audio.AudioLibrary;
	import audio.Channel;
	
	import cfg.Config;
	
	import events.cueEvents.CueEvent;
	import events.cueEvents.CueSequenceEvent;
	import events.cueEvents.CueSimulateEvent;
	
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	
	import instruments.Instrument;
	
	import interfaces.IDestroyable;
	import interfaces.IUpdatable;
	
	import math.Vector2D;
	
	public class Song extends EventDispatcher implements IUpdatable
	{
		private const _WARNING_DELAY:Number = -2000;
		private var _sound:Sound;
		private var _channel:Channel;
		private var _cuePoints:Array;
		private var _isPaused:Boolean;
		private var _position:Number;
		private var _lastCue:CueEvent;
		private var _loader:Loader;
		protected var _songDirectory:String;
		protected var _songName:String;
		public var levelStartTimes:Array;
		public var instruments:Array;
		public var name:String;
		
		public function Song(songName:String, songDirectory:String, instruments:Array)
		{
			_songDirectory = songDirectory;
			_songName = songName;
			_isPaused = false;
			_cuePoints = new Array();
			_channel = AudioHandler.getChannel(AudioLibrary.SONG);
			_position = 0;
			this.instruments = instruments;
		}

		public function get loader():Loader
		{
			return _loader;
		}

		public function get channel():Channel
		{
			return _channel;
		}

		public function get sound():Sound
		{
			return _sound;
		}

		public function get position():Number
		{
			return _channel.position;
		}
		
		public function get isPaused():Boolean
		{
			return _isPaused;
		}

		public function set isPaused(value:Boolean):void
		{
			if (value)
			{
				_position = stop();
			}
			else
			{
				play(_position);
			}
			_isPaused = value;
		}

		public function update():void
		{
			if (_isPaused)
				return;
			for (var i:int = 0; i < _cuePoints.length; i++)
			{
				var cue:CueEvent = _cuePoints[i];
				var position:Number = _channel.position;
				if (Math.abs(cue.startTime - position) <= 100 && cue != _lastCue)
				{
					//recreate event
					var custom:CueEvent;
					if (cue is CueSequenceEvent)
						custom = new CueSequenceEvent(CueSequenceEvent(cue).inputTime, cue.startTime, CueSequenceEvent(cue).endTime, CueSequenceEvent(cue).sequence, cue.type);
					else 
						custom = new CueSimulateEvent(cue.startTime, CueSimulateEvent(cue).note);
					dispatchEvent(custom);
					_lastCue = cue;
					trace(cue.startTime, cue.type);
					//trace(levelStartTimes);
				}
			}
			if (position >= levelStartTimes[levelStartTimes.length - 1])
				dispatchEvent(new Event(Event.SOUND_COMPLETE));
			//trace(_channel.position);
		}
		
		public function play(startTime:Number):void
		{
			AudioHandler.playSound(_sound, _channel, startTime);
		}
		
		public function stop():Number
		{
			return _channel.stop();
		}
				
		protected function addSequence(startTime:Number, inputTime:Number, endTime:Number, sequence:String):Number
		{
			trace(this, startTime, inputTime, endTime, sequence);
			var noteSequence:NoteSequence = new NoteSequence(sequence);
			var cue:CueSequenceEvent = new CueSequenceEvent(inputTime, endTime, inputTime, noteSequence, CueEvent.INPUT_SEQUENCE);
			_cuePoints.push(cue);
			cue = new CueSequenceEvent(endTime, startTime, inputTime, noteSequence,  CueEvent.END_SEQUENCE);		
			_cuePoints.push(cue);
			cue = new CueSequenceEvent(startTime, endTime, inputTime, noteSequence,  CueEvent.START_SEQUENCE);		
			_cuePoints.push(cue);
			//_cuePoints.push(new CueEvent(endTime + _WARNING_DELAY, CueEvent.INPUT_WARNING));
			return startTime;
		}
		
		protected function addSimulateCue(startTime:Number, note:String):CueSimulateEvent
		{
			var cue:CueSimulateEvent = new CueSimulateEvent(startTime, note);
			_cuePoints.push(cue);
			return cue;
		}
		
		public function destroy():void
		{
			AudioHandler.playSound(_sound, _channel, 0);
			_channel.stop();
			//_cuePoints = null;
		}
		
		private function verifyTime(time:*):Number
		{
			return time is String ? getMillisecondsFromTime(time): time;
		}
				
		protected function createSequence(notes:Array, times:Array, nextSequenceStartTime:*):void
		{
			var length:Number = notes.length;
			if (length != times.length)
				throw new Error("note length doesnt match time length");
			var noteString:String = new String();
			for(var i:int = 0; i < length; i++)
			{
				addSimulateCue(verifyTime(times[i]), notes[i]);
				noteString += notes[i];
			}
			var input:Number = verifyTime(nextSequenceStartTime);
			var inputAdjusted:Number = input - (Config.SONG_TIME_BUFFER * 2);
			addSequence(verifyTime(times[0]) - Config.SONG_TIME_BUFFER, verifyTime(times[times.length - 1]) + Config.SONG_TIME_BUFFER, inputAdjusted, noteString);
		}
		
		public static function getMillisecondsFromTime(time:String):Number
		{
			var minutesString:* = time.split(":", 1);
			minutesString = minutesString[0].length == time.length ? 0 : minutesString;
			var minutes:Number = Number(minutesString);
			var seconds:Number = Number(time.substr(time.indexOf(":") + 1, 2));
			var milliseconds:Number = Number(time.substring(time.indexOf(".") + 1, time.length));
			return ((minutes * 60) * 1000) + (seconds * 1000) + milliseconds;
		}
		
		public function loadAssets():void
		{
			var url:URLRequest = new URLRequest(Config.SONG_DIRECTORY + _songDirectory);
			_loader = new Loader();
			var context:LoaderContext = new LoaderContext();
			context.applicationDomain = ApplicationDomain.currentDomain;
			_loader.load(url, context);
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE,loadComplete);
			_loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,loadError);
			_loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loadError);
		}
		
		private function loadError(event:Event):void
		{
			trace(event.type);
		}
		
		private function loadComplete(event:Event):void
		{
			var type:Class = Class(_loader.contentLoaderInfo.applicationDomain.getDefinition(_songName));
			var sound:Sound = new type();
			AudioHandler.registerSound(sound, _songName);
			_sound = sound;
			for (var i:int = 0; i < (this.instruments as Array).length; i++) 
			{
				Instrument(instruments[i]).loadAudio(_loader);
			}
			dispatchEvent(new Event(Event.COMPLETE));
		}
	}
}