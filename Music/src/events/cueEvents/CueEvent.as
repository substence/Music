package events.cueEvents
{
	import flash.events.Event;
	
	public class CueEvent extends Event
	{
		public static const INPUT_WARNING:String = "inputWarning";
		public static const START_SEQUENCE:String = "startSequence";
		public static const INPUT_SEQUENCE:String = "inputSequence";
		public static const END_SEQUENCE:String = "endSequence";	
		public static const END_COMPLETE_SEQUENCE:String = "endSequenceComplete";				
		public static const COMPLETE_SEQUENCE:String = "completeSequence";				
		public static const SIMULATE_KEY_PRESS:String = "simulateKeyPress";
		public var startTime:Number;
		
		public function CueEvent(startTime:Number, type:String)
		{
			this.startTime = startTime;
			super(type);
		}
	}
}