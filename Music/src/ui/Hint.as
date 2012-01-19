package ui
{
	import events.cueEvents.CueEvent;
	
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;

	public class Hint
	{
		private var _button:HintButton;
		private var _isActive:Boolean;
		private var _level:Level;
		private const _NORMAL_COLOR:String = "00CC00";
		private const _HIGHLIGHT_COLOR:String = "666666";
		
		public function Hint(button:HintButton, level:Level)
		{
			_button = button;
			_level = level;
			_button.buttonMode = true;
			_button.addEventListener(MouseEvent.CLICK, clickedButton);
			_button.addEventListener(MouseEvent.ROLL_OUT, rollOut);
			_button.addEventListener(MouseEvent.ROLL_OVER, rollOver);
			_button.addEventListener(MouseEvent.MOUSE_DOWN, down);
			_level.addEventListener(Level.CORRECT_NOTE_PRESSED, correctNotePressed);
			_level.addEventListener(CueEvent.INPUT_SEQUENCE, startedSequence);
			_level.addEventListener(CueEvent.END_COMPLETE_SEQUENCE, completeSequence);
		}
		
		private function completeSequence(event:Event):void
		{
			isActive = false;
			isClickable = false;
		}
		
		private function startedSequence(event:Event):void
		{
			isClickable = true;
			correctNotePressed();
		}
		
		private function correctNotePressed(event:Event = null):void
		{
			if (_isActive)
				updateString();
		}
		
		private function down(event:MouseEvent):void
		{
			if (_isActive)
				return;
			_button.gotoAndStop("down");
		}
		
		private function rollOut(event:MouseEvent):void
		{
			if (_isActive)
				return;
			deHighlight();
		}
		
		private function rollOver(event:MouseEvent):void
		{
			if (_isActive)
				return;
			_button.gotoAndStop("over");
			//highlight();
		}
		
		public function get isActive():Boolean
		{
			return _isActive;
		}
		
		public function set isClickable(value:Boolean):void
		{
			_button.mouseChildren = value;
			_button.mouseEnabled = value;
		}

		public function set isActive(value:Boolean):void
		{
			_isActive = value;
			_isActive ? highlight() : deHighlight();
		}
		
		private function highlight():void
		{
			_button.hintText.textColor = 0x00CC00;
		}
		
		private function deHighlight():void
		{
			_button.gotoAndStop("out");
			if (!_button.hintText)
				return;
			_button.hintText.textColor = 0x333333;
			_button.hintText.text = "Hint";
		}

		private function clickedButton(event:MouseEvent):void
		{
			if (!_level.noteSequence)
				return;
			isActive = !_isActive;
			_isActive ? updateString() : deHighlight();
		}
		
		private function updateString():void
		{
			var sequenceString:String = _level.noteSequence.sequence;
			var index:int = _level.noteSequenceIndex;
			_button.hintText.htmlText = "<font color='#00CC00'>" + sequenceString.substr(0,index) + "</font>";
			_button.hintText.htmlText += "<font color='#333333'>" + sequenceString.substr(index, sequenceString.length) + "</font>"
		}
		
		public function destroy():void
		{
			_button.removeEventListener(MouseEvent.CLICK, clickedButton);
			_button.removeEventListener(MouseEvent.ROLL_OUT, rollOut);
			_button.removeEventListener(MouseEvent.ROLL_OVER, rollOver);
			_button.removeEventListener(MouseEvent.MOUSE_DOWN, down);
			_level.removeEventListener(Level.CORRECT_NOTE_PRESSED, correctNotePressed);
			_level.removeEventListener(CueEvent.INPUT_SEQUENCE, startedSequence);
			_level.removeEventListener(CueEvent.END_COMPLETE_SEQUENCE, completeSequence);
		}
	}
}