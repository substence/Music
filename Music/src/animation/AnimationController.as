package animation
{
	import cfg.Config;
	
	import events.cueEvents.CueEvent;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.media.SoundTransform;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.ui.Keyboard;
	
	import genres.Genre;
	
	import utils.QuickFrameTimer;
	import utils.sceneHandler.SceneHandler;
	import utils.sceneHandler.SceneLayersLibrary;

	public class AnimationController
	{
		private static const _BACKGROUND_OFFSET:Point = new Point(638.35, -16.85);
		public static const RTG_PRESSED:String = "rtgPressed";
		public static const PAUSE:String = "pause";
		public static const ANIMATION_COMPLETE:String = "animationsComplete";
		public static var container:Sprite;
		public static var background:BackgroundUI;
		public static var keyboard:KeyboardUI;
		public static var charactersAnimation:MovieClip;
		public static var isAnimationComplete:Boolean;
		public static var eventDispatcher:EventDispatcher;
		public static var navigation:wslw_HelpPanel;
		public static var instance:AnimationController;
		private static var _charactersContainer:Sprite;
		private static var _isPaused:Boolean;
		private static var _helpAnimation:MovieClip;
		//private var p:wslw_HelpPanel;

		public static function get isPaused():Boolean
		{
			return _isPaused;
		}

		public static function set isPaused(value:Boolean):void
		{
			_isPaused = value;
			if (_isPaused)
			{
				charactersAnimation.stop();
				background.stop();
				keyboard.pause_btn.gotoAndStop(2);
			}
			else
			{
				charactersAnimation.play();
				new QuickFrameTimer(5, function():void{charactersAnimation.soundTransform = new SoundTransform(1)});
				background.play();
				keyboard.pause_btn.gotoAndStop(1);
			}
			eventDispatcher.dispatchEvent(new Event(PAUSE));
		}

		public static function initialize():void
		{
			instance = new AnimationController();
			eventDispatcher = new EventDispatcher();
			container = new Sprite();	
			_charactersContainer = new Sprite();
			_charactersContainer.x = 450;// - 20;
			_charactersContainer.y = 250;// - 45;
			background = new BackgroundUI();
			background.x = _BACKGROUND_OFFSET.x;
			background.y = _BACKGROUND_OFFSET.y;
			keyboard = new KeyboardUI();
			keyboard.x = _BACKGROUND_OFFSET.x;
			keyboard.y = _BACKGROUND_OFFSET.y;
			container.addChild(background);
			container.addChild(_charactersContainer);
			container.addChild(keyboard);
			_charactersContainer.addEventListener(Event.ENTER_FRAME, onExitFrame);
			keyboard.rtgButton.addEventListener(MouseEvent.CLICK, clickedRTG);
			keyboard.pause_btn.addEventListener(MouseEvent.CLICK, pause);
		}

		private static function mainMenu(event:MouseEvent):void
		{
			Main.level.restartGame(true);
		}
		
		private static function backToSalsa(event:MouseEvent):void
		{
			isPaused = true;
			Preloader.dispatchExternalEvent(new Event(Config.BACK));
		}
		
		private static function help(event:MouseEvent):void
		{
			isPaused = true;
			_helpAnimation = AnimationLibrary.getAnimation(AnimationLibrary.CHARACTERS_HELP);
			_helpAnimation.kids.gotoAndPlay("begin");
			_helpAnimation.bg_btn.addEventListener(MouseEvent.CLICK, closedHelp);
			Main.main.addChild(_helpAnimation);
		}
		
		private static function closedHelp(event:MouseEvent):void 
		{
			_helpAnimation.bg_btn.removeEventListener(MouseEvent.CLICK, closedHelp);
			_helpAnimation.stop();
			_helpAnimation.soundTransform = new SoundTransform(0);
			Main.main.removeChild(_helpAnimation);
			_helpAnimation = null;
			isPaused = false;
		}
		
		public static function delayedUnPause():void
		{
			isPaused = false;
		}
		
		private static function pause(event:MouseEvent):void
		{
			isPaused = !_isPaused; 
		}
		
		private static function clickedRTG(event:Event = null):void
		{
			eventDispatcher.dispatchEvent(new Event(RTG_PRESSED));
			//_keyboard.rtgButton.gotoAndPlay("hide");
		}
		
		public static function progress():void
		{
			background.curtains.gotoAndPlay("curtains open");
			keyboard.play();
		}
		
		public static function restart():void
		{
			if (navigation && navigation.parent == keyboard)
				keyboard.removeChild(navigation);
			navigation = new wslw_HelpPanel();
			navigation.x = -557;
			navigation.y = 104;
			keyboard.addChild(navigation);
			background.curtains.gotoAndStop(1);
			keyboard.gotoAndStop(1);
			navigation.mainMenuButton.visible = false;
			navigation.mainMenuButton.addEventListener(MouseEvent.CLICK, mainMenu, false, 0, true);
			navigation.backButton.addEventListener(MouseEvent.CLICK, backToSalsa, false, 0, true);
			navigation.helpButton.addEventListener(MouseEvent.CLICK, help, false, 0, true);
			//TextField(navigation.backButton.genreName).defaultTextFormat = new TextFormat("GunplayMeta", Level.genre.fontSize);
			var textField:TextField = TextField(navigation.backButton.genreName);
			var genre:Genre = Level.genre;
			//textField.defaultTextFormat = new TextFormat("GunplayMeta", 44 - (genre.name.length * 4));

			textField.defaultTextFormat = new TextFormat("GunplayMeta", 24);
			//textField.y += textField.textHeight;
			navigation.backButton.genreName.text = genre.name.toUpperCase();
			keyboard.pause_btn.visible = false;
			keyboard.playNow.visible = false;
			//keyboard.playBtn.visible = false;
			keyboard.freePlaySign.visible = false;
		}
		
		public static function changeCharacterAnimation(animation:String):void
		{
			var potentialAnimation:Class = AnimationLibrary.getAnimationType(animation);
			if (!potentialAnimation)
				return;
			if (charactersAnimation)
			{
				if (charactersAnimation is potentialAnimation)
				{
					playActiveCharacterAnimation();
					charactersAnimation.gotoAndPlay(1);
					return;
				}
				charactersAnimation.stop();
				_charactersContainer.removeChild(charactersAnimation);
				charactersAnimation = null;
			}
			charactersAnimation = AnimationLibrary.getAnimation(animation);
			charactersAnimation.soundTransform = new SoundTransform(Config.DEFAULT_EFFECTS_VOLUME);
			_charactersContainer.addChild(charactersAnimation);
			playActiveCharacterAnimation()
		}
		
		public static function playActiveCharacterAnimation():void
		{
			//charactersAnimation.gotoAndPlay(1);
			isAnimationComplete = false;
		}
		
		private static function onExitFrame(event:Event):void
		{
			if (charactersAnimation && !isAnimationComplete && charactersAnimation.currentFrame >= charactersAnimation.totalFrames)
			{
				eventDispatcher.dispatchEvent(new Event(ANIMATION_COMPLETE));
				charactersAnimation.stop();
				isAnimationComplete = true;
			}
		}
	}
}