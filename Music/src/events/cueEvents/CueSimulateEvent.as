package events.cueEvents
{
	public class CueSimulateEvent extends CueEvent
	{
		public var note:String;
		
		public function CueSimulateEvent(startTime:Number, note:String)
		{
			super(startTime, CueEvent.SIMULATE_KEY_PRESS);
			this.note = note;
		}
	}
}