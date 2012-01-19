package
{
	import events.NoteActivatorEvent;
	
	import flash.display.MovieClip;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	import utils.InputHandler;
	
	public class NoteActivator extends EventDispatcher
	{
		public var note:String;
		public var button:*;
		private var _isKeyReleased:Boolean;
		
		public function NoteActivator(note:String, button:*)
		{
			super();
			this.note = note;
			this.button = button;
			_isKeyReleased = true;
			button.addEventListener(MouseEvent.CLICK, clickedButton);
			InputHandler.instance.addEventListener(KeyboardEvent.KEY_DOWN, pressedKey);
			InputHandler.instance.addEventListener(KeyboardEvent.KEY_UP, releasedKey);
		}
		
		private function clickedButton(event:MouseEvent):void
		{
			dispatchEvent(new NoteActivatorEvent(NoteActivatorEvent.ACTIVATED, this));
		}
		
		private function releasedKey(event:KeyboardEvent):void
		{
			_isKeyReleased = true
		}
		
		private function pressedKey(event:KeyboardEvent):void
		{
			if (String.fromCharCode(event.keyCode) == note && _isKeyReleased)
			{
				dispatchEvent(new NoteActivatorEvent(NoteActivatorEvent.ACTIVATED, this));
				_isKeyReleased = false;
			}
		}
		
		public function activate():void
		{
			press();
			//dispatchEvent(new NoteActivatorEvent(NoteActivatorEvent.ACTIVATED, this));
		}
		
		public function press():void
		{
			button.gotoAndPlay(1);
		}
		
		public function destroy():void
		{
			button.removeEventListener(MouseEvent.CLICK, clickedButton);
			InputHandler.instance.removeEventListener(KeyboardEvent.KEY_DOWN, pressedKey);			
		}
	}
}