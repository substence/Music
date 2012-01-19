package events
{
	import flash.events.Event;
	
	public class NoteActivatorEvent extends Event
	{
		public static const ACTIVATED:String = "noteActivated";
		private var _noteActivator:NoteActivator;
		
		public function NoteActivatorEvent(type:String, noteActivator:NoteActivator, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			_noteActivator = noteActivator;
			super(type, bubbles, cancelable);
		}

		public function get noteActivator():NoteActivator
		{
			return _noteActivator;
		}

	}
}