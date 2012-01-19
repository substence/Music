package audio{
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;

	public class Channel extends AChannel{
		private var _soundChannel:SoundChannel;
		private var _sound:Sound;
		
		public function Channel(label:String = null, volume:Number = 1)
		{
			_soundChannel = new SoundChannel();		
			super(label, volume);	
		}
		
		public function get position():Number
		{
			if (!_soundChannel)
				return 0;
			return _soundChannel.position;
		}
		
		public function get isPlaying():Boolean
		{
			return _soundChannel && _soundChannel.position > 0;
		}
		
		public function get soundTransform():SoundTransform
		{
			return _soundChannel.soundTransform;
		}		
		
		override internal function applyVolume(volume:Number):Number
		{
			if (_isMuted)
				return 0;
			_soundTransform = new SoundTransform(volume);
			if(!_soundChannel)
				return 0;
			_soundChannel.soundTransform = _soundTransform;
			return volume;
		}			
		
		override internal function play(sound:Sound, startTime:Number = 0, loops:int = 0):void
		{
/*			if (_sound == sound)
				return;*/
			volume = _volume;
			_sound = sound;
			_soundChannel.stop();
			_soundChannel = sound.play(startTime, loops, _soundTransform);
		}

		public function stop():Number{
			if(!_soundChannel)
				return 0;
			var position:Number = position;
			_soundChannel.stop();
			return position;
		}		
	}
}