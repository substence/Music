package audio{
	import flash.events.EventDispatcher;
	
	public class ChannelGroup extends AChannel{
		private var _channels:Array;
		
		public function ChannelGroup(label:String, volume:Number = 1)
		{
			_channels = new Array();			
			super(label, volume);		
		}
		
		override public function set isMuted(value:Boolean):void
		{
			if (_isMuted == value)
				return;
			for(var i:int = 0; i < _channels.length; i++)
			{
				_channels[i].isMuted = value;
			}	
			_isMuted = value;		
		}
		
		override internal function applyVolume(volume:Number):Number
		{
			if(_isMuted)
				return 0;
			for(var i:int = 0; i < _channels.length; i++)
			{
				applyChildVolume(_channels[i]);
			}				
			return _volume;
		}
		
		public function addChannel(channel:AChannel):void
		{
			_channels.push(channel);
			channel.addEventListener(ChannelEvent.UPDATE_VOLUME, childVolumeChanged);
		}
		
		public function removeChannel(channel:AChannel):void
		{
			var index:int = _channels.indexOf(channel);
			if(index >= 0){
				_channels[index].removeEventListener(ChannelEvent.UPDATE_VOLUME, childVolumeChanged);
				_channels.splice(index,1);
			}
		}
		
		private function childVolumeChanged(event:ChannelEvent):void
		{
			applyChildVolume(event.channel);
		}
		
		private function applyChildVolume(channel:AChannel):Number
		{
			return channel.applyVolume(_volume * channel.volume);			
		}
	}
}