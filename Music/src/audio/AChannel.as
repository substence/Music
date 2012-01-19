package audio{
	import flash.events.EventDispatcher;
	import flash.media.Sound;
	import flash.media.SoundTransform;
	
	public class AChannel extends EventDispatcher{
		protected var _label:String;
		protected var _isMuted:Boolean;
		protected var _volume:Number;
		protected var _soundTransform:SoundTransform;
		
		public function AChannel(label:String, volume:Number = 1){
			_label = label;
			isMuted = volume <= 0 ? true : false;
			this.volume = volume;			
		}
		
		public function get label():String{
			return _label;
		}
				
		public function set isMuted(mute:Boolean):void{
			if(mute)
				applyVolume(0);
			else
				volume = volume;	
			_isMuted = mute;			
		}
		
		public function get isMuted():Boolean{
			return _isMuted;
		}
		
		public function get volume():Number{
			return _volume;
		}
		
		public function set volume(volume:Number):void{
			_volume = volume;
			applyVolume(volume);
			dispatchEvent(new ChannelEvent(ChannelEvent.UPDATE_VOLUME, this));
		}
		
		internal function play(sound:Sound, startTime:Number = 0, loops:int = 0):void
		{
			volume = _volume;
			sound.play(startTime, loops, _soundTransform);
		}		
		
		virtual internal function applyVolume(volume:Number):Number
		{
			return -1;
		}		
	}
}