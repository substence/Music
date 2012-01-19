package
{
	import animation.AnimationController;
	import animation.AnimationLibrary;
	
	import audio.AudioHandler;
	import audio.AudioLibrary;
	
	import behaviors.Animation;
	
	import cfg.Config;
	
	import events.NoteActivatorEvent;
	import events.cueEvents.CueEvent;
	import events.cueEvents.CueSequenceEvent;
	import events.cueEvents.CueSimulateEvent;
	
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.events.*;
	import flash.media.Sound;
	
	import genres.Genre;
	import genres.Jazz;
	import genres.Salsa;
	
	import instruments.*;
	
	import interfaces.IDrawable;
	import interfaces.IUpdatable;
	
	import songs.Song;
	import songs.salsa.CalienteSwing;
	
	import ui.UIInstrumentSelection;
	import ui.UIPlaying;
	
	import utils.*;
	import utils.sceneHandler.SceneHandler;
	import utils.sceneHandler.SceneLayersLibrary;

	public class Level extends EventDispatcher implements IUpdatable, IDrawable
	{
		public static const CORRECT_NOTE_PRESSED:String = "correctNotePressed";
		public static const CHANGED_INSTRUMENT:String = "changedInstrument";
		public static const SONG_COMPLETE:String = "songComplete";
		public static const LEVEL_COMPLETE:String = "levelComplete";
		public static const LEVEL_START:String = "levelStart";
		public static const INVALID_NOTE_PRESSED:String = "invalidNotePressed";
		public static const READY_TO_START:String = "readyToStart";		
		public static const END_ANIMATION_COMPLETE:String = "endAnimationComplete";
		public static const END_GAME:String = "endGame";
		public var roundIndex:int = 1;
		public var levelIndex:int = Config.STARTING_LEVEL;
		public var isInputEnabled:Boolean;
		public static var genre:Genre;
		private var _song:Song;
		private var _instrument:Instrument;
		private var _noteSequence:NoteSequence;
		private var _noteSequenceIndex:int;
		private var _graphic:MovieClip;
		private var _noteActivators:Array;
		private var _isSequenceComplete:Boolean;
		private var _loopIndex:int;
		private var _playingUI:UIPlaying;
		private var _isReadyToContinue:Boolean;
		private var _activeRound:CueSequenceEvent;
		
		public function get noteSequenceIndex():int
		{
			return _noteSequenceIndex;
		}

		public function get noteSequence():NoteSequence
		{
			return _noteSequence;
		}

		public function get instrument():Instrument
		{
			return _instrument;
		}

		public function set instrument(value:Instrument):void
		{
			_instrument = value;
			dispatchEvent(new Event(CHANGED_INSTRUMENT));
		}

		public function get graphic():MovieClip
		{
			return _graphic;
		}

		public function set graphic(value:MovieClip):void
		{
			_graphic = value;
		}

		public function set song(value:Song):void
		{
			if (_song)
			{
				_song.destroy();
				_song = null;
				return;
			}
			if (!value)
				return;
			_song = value;
			_song.addEventListener(CueEvent.START_SEQUENCE, startSequence);
			_song.addEventListener(CueEvent.INPUT_SEQUENCE, inputSequence);
			_song.addEventListener(CueEvent.END_SEQUENCE, endSequence);			
			_song.addEventListener(CueEvent.SIMULATE_KEY_PRESS, simulateKeyPress);
			_song.addEventListener(Event.SOUND_COMPLETE, completedSong);
		}
		
		public function Level(song:Song = null, instrument:Instrument = null)
		{
			_graphic = AnimationController.keyboard;
			_noteActivators = new Array();
			_noteActivators.push(new NoteActivator(Config.NOTE_B, _graphic.buttonB));
			_noteActivators.push(new NoteActivator(Config.NOTE_C, _graphic.buttonC));
			_noteActivators.push(new NoteActivator(Config.NOTE_N, _graphic.buttonN));
			_noteActivators.push(new NoteActivator(Config.NOTE_V, _graphic.buttonV));
			for (var i:int = 0; i < _noteActivators.length; i++)
			{
				_noteActivators[i].addEventListener(NoteActivatorEvent.ACTIVATED, activatedNote);
			}
			UpdateHandler.instance.addUpdatee(this);
			AnimationController.eventDispatcher.addEventListener(AnimationController.PAUSE, pause);
			AnimationController.eventDispatcher.addEventListener(UIPlaying.RESTART_GAME, clickedRestartGame);
			AnimationController.eventDispatcher.addEventListener(AnimationController.ANIMATION_COMPLETE, loopRockAnimation);
			AnimationController.keyboard.playBtn.addEventListener(MouseEvent.CLICK, skipIntro, false, 0, true);
			loadGenre();
		}
		
		private function loadGenre():void
		{
			genre = new Config.GENRE();
			var loader:Loader = genre.load();
			var preLoader:ChuckVPreloader = new ChuckVPreloader(loader.contentLoaderInfo);
			genre.addEventListener(Event.COMPLETE, loadedGenre);
			Main.main.addChild(preLoader);
		}
		
		private function loadedGenre(event:Event):void
		{
			event.target.removeEventListener(Event.COMPLETE, loadedGenre);
			restartGame();
		}
		
		private function clickedRestartGame(event:Event):void
		{
			restartGame();
		}
		
		private function skipIntro(event:MouseEvent = null):void
		{
			AnimationController.charactersAnimation.removeEventListener(Event.ENTER_FRAME, exitFrame);
			showSelectionUI();
		}
		
		private function pause(event:Event):void
		{
			if (_song)
				_song.isPaused = AnimationController.isPaused;
		}

		public function showInstructions():void
		{
			isInputEnabled = true;
			AnimationController.changeCharacterAnimation(AnimationLibrary.CHARACTERS_INSTRUCTIONS);
			AnimationController.keyboard.playNow.visible = true;
			AnimationController.keyboard.playNow.addEventListener(MouseEvent.CLICK, startGame);
		}
		
		private function startGame(event:Event = null):void
		{
			isInputEnabled = false;
			AnimationController.keyboard.playNow.visible = false;
			AnimationController.keyboard.playNow.removeEventListener(MouseEvent.CLICK, startGame);
			AnimationController.keyboard.playBtn.visible = true;
			AnimationController.changeCharacterAnimation(AnimationLibrary.CHARACTERS_START_LEVEL_1);
			AnimationController.keyboard.playBtn.addEventListener(MouseEvent.CLICK, readyToStartGame);
			AnimationController.eventDispatcher.addEventListener(AnimationController.ANIMATION_COMPLETE, readyToStartGame);
		}		
		
		private function readyToStartGame(event:Event = null):void
		{
			if (event)
			{
				AnimationController.eventDispatcher.removeEventListener(AnimationController.ANIMATION_COMPLETE, readyToStartGame);
				AnimationController.keyboard.playBtn.removeEventListener(MouseEvent.CLICK, readyToStartGame);
				AnimationController.charactersAnimation.stop();
			}
			AnimationController.keyboard.playBtn.visible = false;
			UIHandler.instance.changeUI(_playingUI);
			AnimationController.progress();
			readyToStartLevel();
		}
		
		private function readyToStartLevel():void
		{			
			dispatchEvent(new Event(READY_TO_START));
			_isReadyToContinue = false;
		}
		
		private function resetGame():void
		{
			song = null;
			_instrument = null;
			levelIndex = Config.STARTING_LEVEL;
			roundIndex = Config.STARTING_ROUND;
			AnimationController.restart();
			AudioHandler.getChannel(AudioLibrary.CROWD).stop();
			UIHandler.instance.removeAllScreens();			
			_playingUI = new UIPlaying(this);
			_playingUI.addEventListener(UIPlaying.COUNTDOWN_COMPLETE, startLevel, false, 0, true);
			_playingUI.addEventListener(UIPlaying.REPEAT_PATTERN_CLICKED, repeatSequence, false, 0, true);	
			_playingUI.addEventListener(UIPlaying.CONTINUE, startLevel, false, 0, true);		
			_playingUI.addEventListener(UIPlaying.QUIT, clickedQuit, false, 0, true);		
			_playingUI.addEventListener(UIPlaying.RESTART_GAME, clickedRestartGame, false, 0, true);
			_playingUI.addEventListener(UIPlaying.FREE_PLAY, freePlay, false, 0, true);
		}
		
		private function clickedQuit(event:Event):void
		{
			Preloader.dispatchExternalEvent(new Event(Config.BACK));
			AnimationController.isPaused = true;
		}
		
		public function restartGame(doesSkipIntro:Boolean = false):void
		{
			resetGame();
			if (Config.DOES_SKIP_SELECTION)
			{
				song = new Config.DEFAULT_SONG();
				instrument = new Config.DEFAULT_INSTRUMENT();
				_song.loadAssets();
				readyToStartGame();
			}
			else
			{
				if (Config.DOES_SKIP_INTRO || doesSkipIntro)
				{
					showSelectionUI();
				}
				else
				{
					AnimationController.changeCharacterAnimation(AnimationLibrary.CHARACTERS_INTRO);
					AnimationController.charactersAnimation.addEventListener(Event.ENTER_FRAME, exitFrame);
					//AnimationController.eventDispatcher.addEventListener(AnimationController.ANIMATION_COMPLETE, showSelectionUI);		
					AudioHandler.playSoundByLabels(AudioLibrary.CROWD_CHEERING, AudioLibrary.CROWD);					
				}
			}
		}
		
		private function freePlay(event:Event):void
		{
			resetGame();
			AnimationController.changeCharacterAnimation(AnimationLibrary.CHARACTERS_INTRO);
			AnimationController.charactersAnimation.stop();
			AnimationController.keyboard.freePlaySign.visible = true;
			AnimationController.navigation.mainMenuButton.visible = true;
			isInputEnabled = true;
		}
		
		private function exitFrame(event:Event):void
		{
			if (AnimationController.charactersAnimation.currentFrame >= genre.instrumentFrame)
				skipIntro();
		}
		
		private function showSelectionUI(event:Event = null):void
		{
			if (event)
				AnimationController.eventDispatcher.removeEventListener(AnimationController.ANIMATION_COMPLETE, showSelectionUI);
			AnimationController.keyboard.playBtn.removeEventListener(MouseEvent.CLICK, skipIntro);
			AnimationController.keyboard.playBtn.visible = false;
			UIHandler.instance.changeUI(new UIInstrumentSelection());
		}
		
		private function repeatSequence(event:Event):void
		{
			replaySequence();
		}
		
		private function startLevel(event:Event = null):void
		{
			dispatchEvent(new Event(LEVEL_START));
			_song.play(_song.levelStartTimes[levelIndex - 1]);
			new QuickFrameTimer(1, startGetReadyAnimation);
			AnimationController.keyboard.pause_btn.visible = true;
			_graphic.stage.focus = _graphic.stage;			
			_isReadyToContinue = true;
/*			if (_song.isPaused)
				_song.isPaused = false; */			
		}
		
		private function loopRockAnimation(event:Event):void
		{
			if (AnimationController.charactersAnimation is AnimationLibrary.getAnimationType(AnimationLibrary.CHARACTERS_GET_READY))	
				new QuickFrameTimer(1, playGetReadyAnimation);
		}
		
		private function playGetReadyAnimation():void
		{
			AnimationController.changeCharacterAnimation(AnimationLibrary.CHARACTERS_GET_READY);
		}
		
		private function startGetReadyAnimation():void
		{
			playGetReadyAnimation();
			AnimationController.charactersAnimation.gotoAndPlay("getReady");
		}
		
		private function inputSequence(event:CueSequenceEvent):void
		{
			dispatchEvent(new Event(CueEvent.INPUT_SEQUENCE));
			isInputEnabled = true;		
			if (_noteSequence)
				return;
			_noteSequenceIndex = 0;
			_noteSequence = event.sequence;
			_isSequenceComplete = false;
		}
		
		private function startSequence(event:CueSequenceEvent = null):void
		{
			if (!_activeRound && event)
				_activeRound = event;
			_loopIndex = 0;
			dispatchEvent(new Event(CueEvent.START_SEQUENCE));
			isInputEnabled = false;
		}
				
		private function completedSong(event:Event):void
		{
			endGame();
		}
		
		private function replaySequence(doesForce:Boolean =  false):void
		{
			if (!_activeRound)
				return;
			_song.play(_activeRound.endTime);
			_noteSequenceIndex = 0;
			startSequence();
		}
		
		private function endSequence(event:CueSequenceEvent = null):void
		{
			if (!_activeRound)
				return;
			if (_isSequenceComplete)
			{
				_activeRound = null;
				dispatchEvent(new Event(CueEvent.END_COMPLETE_SEQUENCE));

			}
			else
			{
				_loopIndex++;
				if (_loopIndex >= Config.MAX_LOOPS_TILL_RESET)	//play tutorial again
				{
					replaySequence(true);
				}
				else
				{
					_song.play(event.startTime);
				}
			}
			dispatchEvent(new Event(CueEvent.END_SEQUENCE));
		}
		
		private function simulateKeyPress(event:CueSimulateEvent):void
		{
			getActivatorFromNote(event.note).press();
		}
		
		private function activatedNote(event:NoteActivatorEvent):void
		{
			if (!isInputEnabled && Config.ARE_KEYS_LOCKED)
				return;
			event.noteActivator.activate();
			playNote(event.noteActivator.note);
		}
		
		private function playNote(note:String):void
		{
			if (_instrument && _instrument.playNote(note) && _noteSequence)
			{
				if (_noteSequence.getNoteAt(_noteSequenceIndex) == note)
					validNotePressed();
				else
					invalidNotePressed();
			}
		}
		
		private function validNotePressed():void
		{
			_noteSequenceIndex++;
			dispatchEvent(new Event(CORRECT_NOTE_PRESSED));
			if (_noteSequenceIndex >= _noteSequence.length)
				sequenceComplete();
		}
		
		private function invalidNotePressed():void
		{
			isInputEnabled = false;
			_noteSequenceIndex = 0;
			_loopIndex = Config.MAX_LOOPS_TILL_RESET; //force reset
			dispatchEvent(new Event(INVALID_NOTE_PRESSED));
		}
		
		private function sequenceComplete():void
		{
			isInputEnabled = false;
			_isSequenceComplete = true;
			_noteSequence = null;
			roundIndex++;
			dispatchEvent(new Event(CueEvent.COMPLETE_SEQUENCE));
			endSequence();
			if (roundIndex > 4)
				levelComplete();
		}
		
		private function levelComplete():void
		{
			if (levelIndex == 1)
				Preloader.dispatchExternalEvent(new Event(Config.FINISHED_LEVEL_1));
			levelIndex++;
			if (levelIndex == 4)
				return;
			roundIndex = 1;
			AnimationController.changeCharacterAnimation(AnimationLibrary.CHARACTERS_START_LEVEL + levelIndex);
			AnimationController.eventDispatcher.addEventListener(AnimationController.ANIMATION_COMPLETE, introAnimationComplete);
			AudioHandler.playSoundByLabels(AudioLibrary.CROWD_CHEERING_ENTHUSED, AudioLibrary.CROWD);
			_isReadyToContinue = false;
			dispatchEvent(new Event(LEVEL_COMPLETE));
			_song.stop();
		}
		
		private function endGame():void
		{
			song = null;
			AnimationController.keyboard.pause_btn.visible = false;
			AnimationController.changeCharacterAnimation(AnimationLibrary.CHARACTERS_FINISH);
			AnimationController.eventDispatcher.addEventListener(AnimationController.ANIMATION_COMPLETE, endAnimationComplete);
			AudioHandler.playSoundByLabels(AudioLibrary.CROWD_CHEERING_ENTHUSED, AudioLibrary.CROWD);
			dispatchEvent(new Event(END_GAME));
		}
		
		private function endAnimationComplete(event:Event):void
		{
			AnimationController.eventDispatcher.removeEventListener(AnimationController.ANIMATION_COMPLETE, endAnimationComplete);
			//AnimationController.keyboard.playBtn.removeEventListener(MouseEvent.CLICK, readyToStartGame);
			dispatchEvent(new Event(END_ANIMATION_COMPLETE));
		}
		
		private function introAnimationComplete(event:Event):void
		{
			AnimationController.eventDispatcher.removeEventListener(AnimationController.ANIMATION_COMPLETE, introAnimationComplete);
			readyToStartLevel();
		}
		
		public function update():void
		{
			if (_song)
				_song.update();
		}
		
		public function draw():void
		{
		}
		
		public function destroy():void
		{
		}
		
		private function getActivatorFromNote(note:String):NoteActivator
		{
			for (var i:int = 0; i < _noteActivators.length; i++)
			{
				var activator:NoteActivator = _noteActivators[i];
				if(activator.note == note)
					return activator;
			}
			return null;
		}
	}
}