package audio{
	import flash.events.EventDispatcher;
	import flash.media.Sound;
	import flash.media.SoundTransform;
	import flash.utils.Dictionary;
	
	public class AudioHandler
	{
		public static const ALL_SOUNDS:String = "allSounds";
		private static var _sounds:Dictionary;
		private static var _channels:Dictionary;
		
		public function AudioHandler(){};
		
		public static function initialize():void{
			_sounds = new Dictionary();
			_channels = new Dictionary();
			_channels[ALL_SOUNDS] = new ChannelGroup(ALL_SOUNDS, 1);		
		}		
		
		public static function set isMuted(mute:Boolean):void
		{
			getChannelGroup(ALL_SOUNDS).isMuted = mute;	
		}
		
		public static function get isMuted():Boolean
		{
			return getChannelGroup(ALL_SOUNDS).isMuted;
		}		
		
		public static function get volume():Number
		{
			return getChannelGroup(ALL_SOUNDS).volume;		
		}
		
		public static function set volume(value:Number):void
		{
			getChannelGroup(ALL_SOUNDS).volume = value;			
		}
		
		//A shortcut for playSound(), does the look-ups for you.
		public static function playSoundByLabels(soundLabel:String, channelLabel:String = null, startTime:Number = 0, loops:int = 0):Channel
		{
			return playSound(getSound(soundLabel), getChannel(channelLabel), startTime, loops);
		}
		
		public static function playSound(sound:Sound, channel:Channel = null, startTime:Number = 0, loops:int = 0):Channel
		{
			if (!channel)
				channel = new Channel(sound.toString(), getChannelGroup(ALL_SOUNDS).volume); //throw-away channel
			channel.play(sound, startTime, loops);
			return channel;
		}	
				
		public static function registerSound(sound:Sound, label:String):Sound
		{
			_sounds[label] = sound;
			return sound;
		}
		
		public static function getSound(label:String):Sound
		{
			return _sounds[label];
		}
		
		public static function registerChannel(label:String = null, volume:Number = 1, parentGroup:ChannelGroup = null):Channel
		{
			var channel:AChannel = new Channel(label, volume);
			if(!parentGroup)
				parentGroup = getChannelGroup(ALL_SOUNDS);
			parentGroup.addChannel(channel);
			_channels[label] = channel;
			return Channel(channel);
		}

		public static function registerChannelGroup(label:String, volume:Number = 1, parentGroup:ChannelGroup = null):ChannelGroup
		{
			var channelGroup:AChannel = new ChannelGroup(label, volume);
			if(!parentGroup)
				parentGroup = getChannelGroup(ALL_SOUNDS);
			parentGroup.addChannel(channelGroup);
			_channels[label] = channelGroup;
			return ChannelGroup(channelGroup);
		}
		
		public static function getChannelGroup(label:String):ChannelGroup
		{
			return ChannelGroup(_channels[label]);
		}		
		
		public static function getChannel(label:String):Channel
		{
			return Channel(_channels[label]);
		}
	}
}