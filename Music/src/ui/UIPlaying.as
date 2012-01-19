package ui
{
	import animation.AnimationController;
	import animation.AnimationLibrary;
	
	import entities.UIEntity;
	
	import events.cueEvents.CueEvent;
	import events.cueEvents.CueSequenceEvent;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import utils.QuickFrameTimer;
	
	public class UIPlaying extends UIEntity
	{
		public static const FREE_PLAY:String = "freePlay";
		public static const COUNTDOWN_COMPLETE:String = "countdownComplete";
		public static const REPEAT_PATTERN_CLICKED:String = "repeatPatternClicked";
		public static const CONTINUE:String = "continue";
		public static const RESTART_GAME:String = "restartGame";
		public static const QUIT:String = "quit";		
		private const _PLAY:String = "play";
		private const _GOOD_JOB:String = "goodJob";
		private const _LISTEN:String = "listen";
		private const _TRY_AGAIN:String = "tryAgain";
		private var _graphic:PlayingUI;
		private var _level:Level;
		private var _instrumentButton:MovieClip;
		private var _isPanelVisible:Boolean;
		private var _navigation:MovieClip;
		private var _hint:Hint;
		
		public function UIPlaying(level:Level)
		{
			_graphic = new PlayingUI();
			_level = level;
			_level.addEventListener(Level.LEVEL_COMPLETE, changedLevel);
			_level.addEventListener(Level.LEVEL_START, startLevel);
			_level.addEventListener(Level.INVALID_NOTE_PRESSED, pressedInvalidNote);
			_level.addEventListener(Level.CHANGED_INSTRUMENT, changedInstrument);
			_level.addEventListener(Level.READY_TO_START, readyToStartLevel);
			_level.addEventListener(CueEvent.COMPLETE_SEQUENCE, completedSequence);
			_level.addEventListener(CueEvent.START_SEQUENCE, startedSequence);
			_level.addEventListener(CueEvent.INPUT_SEQUENCE, startedInput);
			_level.addEventListener(Level.END_ANIMATION_COMPLETE, endAnimationComplete);
			_level.addEventListener(Level.END_GAME, endGame);
			_graphic.addEventListener(Event.ENTER_FRAME, exitFrame);
			_graphic.hearPattenAgain.addEventListener(MouseEvent.CLICK, clickedHearAgain);
			_graphic.levelPanel.endPanel.playButton.addEventListener(MouseEvent.CLICK, clickedPlay);
			//_graphic.levelPanel.endPanel.freePlayButton.addEventListener(MouseEvent.CLICK, clickedFreePay);
			_graphic.levelPanel.endPanel.quitButton.addEventListener(MouseEvent.CLICK, clickedQuit);
			changedInstrument();
			completedSequence();
			changedLevel();
			updateStatus(_LISTEN);
			_graphic.levelPanel.endPanel.visible = false;
			_graphic.hint.visible = false;
			_graphic.blackout.visible = false;
			//_graphic.freePlaySign.visible = false;
			_graphic.levelPanel.countdown.stop();
			_hint = new Hint(_graphic.hint, level);
			super(_graphic);
		}
		
		private function clickedFreePay(event:MouseEvent):void
		{
			dispatchEvent(new Event(FREE_PLAY));
			hideLevelPanel();
		}
		
		private function endGame(event:Event):void
		{
			_hint.isClickable = false;
			_graphic.hearPattenAgain.mouseEnabled = false;
		}
		
		private function startLevel(event:Event):void
		{
			updateStatus(_LISTEN);
			_graphic.hint.visible = _level.levelIndex == 3;
			_graphic.levelText.text = "LEVEL " + _level.levelIndex;
			new QuickFrameTimer(1, updateRoundStars);
		}
		
		private function endAnimationComplete(event:Event):void
		{
			showLevelPanel();
			_isPanelVisible = false;
			_graphic.levelPanel.endPanel.visible = true;
			_graphic.blackout.visible = true;
			_graphic.blackout.gotoAndPlay(1);
			_graphic.levelPanel.levelText.lText.visible = false;
			_graphic.levelPanel.countdown.visible = false;
			_navigation = AnimationController.navigation;
			_navigation.x = 82;
			_navigation.y = 93;
			_graphic.addChild(_navigation);
		}
		
		private function clickedQuit(event:MouseEvent):void
		{
			dispatchEvent(new Event(QUIT));
			hideLevelPanel();
		}
		
		private function clickedContinue(event:MouseEvent):void
		{
			dispatchEvent(new Event(CONTINUE));
			hideLevelPanel();
		}
		
		private function clickedPlay(event:MouseEvent):void
		{
			hideLevelPanel();
			dispatchEvent(new Event(RESTART_GAME));
		}
		
		private function clickedHearAgain(event:MouseEvent):void
		{
			dispatchEvent(new Event(REPEAT_PATTERN_CLICKED));
		}
		
		private function exitFrame(event:Event):void
		{
			var countdown:MovieClip = _graphic.levelPanel.countdown;
			if (countdown.currentFrame == countdown.totalFrames - 1 && _isPanelVisible)
			{
				_isPanelVisible = false;
				dispatchEvent(new Event(COUNTDOWN_COMPLETE));
				hideLevelPanel();
			}
		}
		
		private function hideLevelPanel():void
		{
			//_graphic.levelPanel.levelText.lText.visible = false;
			_isPanelVisible = false;
			_graphic.levelPanel.gotoAndPlay(10);
		}
		
		private function showLevelPanel():void
		{
			_graphic.levelPanel.gotoAndPlay(2);
			_graphic.levelPanel.countdown.gotoAndPlay(1);
			_graphic.levelPanel.levelText.lText.visible = true;
			_graphic.levelPanel.countdown.visible = true;
			_isPanelVisible = true;
		}
		
		private function readyToStartLevel(event:Event = null):void
		{
			showLevelPanel();
		}
		
		private function changedLevel(event:Event = null):void
		{
			_graphic.levelPanel.levelText.lText.text = "LEVEL " + _level.levelIndex;
/*			new QuickFrameTimer(1, updateRoundStars);
			_graphic.hint.visible = _level.levelIndex == 3;
			new QuickFrameTimer(1, updateStatus, 1, _LISTEN);*/
		}
		
		private function updateStatus(status:String):void
		{
			_graphic.status.gotoAndStop(status);
		}
		
		private function startedSequence(event:Event):void
		{
			updateStatus(_LISTEN);
		}
		
		private function pressedInvalidNote(event:Event = null):void
		{
			updateStatus(_TRY_AGAIN);
		}
		
		private function completedSequence(event:Event = null):void
		{
			updateRoundStars();
			updateStatus(_GOOD_JOB);
		}
		
		private function updateRoundStars():void
		{
			_graphic.stars.gotoAndStop(_level.roundIndex);
		}

		private function startedInput(event:Event):void
		{
			updateStatus(_PLAY);
		}
		
		private function changedInstrument(event:Event = null):void
		{
			if (!_level.instrument)
				return;
			if (_instrumentButton)
				_graphic.instrumentButton.removeChild(_instrumentButton);
			_instrumentButton = AnimationLibrary.getAnimation(_level.instrument.buttonGraphic);
			_graphic.instrumentButton.addChild(_instrumentButton);
		}

		override public function removed():void
		{
			destroy();
		}
		
		override public function destroy():void
		{
			_level.removeEventListener(Level.LEVEL_COMPLETE, changedLevel);
			_level.removeEventListener(Level.LEVEL_START, startLevel);
			_level.removeEventListener(Level.INVALID_NOTE_PRESSED, pressedInvalidNote);
			_level.removeEventListener(Level.CHANGED_INSTRUMENT, changedInstrument);
			_level.removeEventListener(Level.READY_TO_START, readyToStartLevel);
			_level.removeEventListener(CueEvent.COMPLETE_SEQUENCE, completedSequence);
			_level.removeEventListener(CueEvent.START_SEQUENCE, startedSequence);
			_level.removeEventListener(CueEvent.INPUT_SEQUENCE, startedInput);
			_level.removeEventListener(Level.END_ANIMATION_COMPLETE, endAnimationComplete);
			_level.removeEventListener(Level.END_GAME, endGame);
			_graphic.removeEventListener(Event.ENTER_FRAME, exitFrame);
			_graphic.hearPattenAgain.removeEventListener(MouseEvent.CLICK, clickedHearAgain);
			_graphic.levelPanel.endPanel.playButton.removeEventListener(MouseEvent.CLICK, clickedPlay);
			//_graphic.levelPanel.endPanel.freePlayButton.addEventListener(MouseEvent.CLICK, clickedFreePay);
			_graphic.levelPanel.endPanel.quitButton.removeEventListener(MouseEvent.CLICK, clickedQuit);
			_hint.destroy();
		}
	}
}