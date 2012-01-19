package events.cueEvents
{
	public class CueSequenceEvent extends CueEvent
	{
		public var inputTime:Number;
		public var sequence:NoteSequence;
		public var endTime:Number;
		
		public function CueSequenceEvent(startTime:Number, endTime:Number, inputTime:Number, sequence:NoteSequence, type:String)
		{
			super(startTime, type);
			this.inputTime = inputTime;
			this.sequence = sequence;
			this.endTime = endTime;
		}
	}
}