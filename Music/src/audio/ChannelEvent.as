package audio{
	import flash.events.Event;
	
	public class ChannelEvent extends Event{
		public static const UPDATE_VOLUME:String = "updatevolume";
		private var _channel:AChannel;
		
		public function ChannelEvent(type:String, channel:AChannel, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			_channel = channel;
		}
		
		public function get channel():AChannel
		{
			return _channel;
		}
	}
}