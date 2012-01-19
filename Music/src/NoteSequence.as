package
{
	public class NoteSequence
	{
		public var sequence:String;
		public var length:int;
		
		public function NoteSequence(sequence:String)
		{
			this.sequence = sequence;
			length = sequence.length;
		}
		
		public function getNoteAt(index:int):String
		{
			return sequence.charAt(index);
		}
		
		public function toString():String
		{
			return sequence;
		}
	}
}