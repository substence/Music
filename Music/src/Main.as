package
{
	import animation.AnimationController;
	import animation.AnimationLibrary;
	
	import audio.*;
	
	import behaviors.Animation;
	
	import cfg.Config;
	
	import entities.Entity;
	
	import flash.display.*;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.ProgressEvent;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.ui.Keyboard;
	
	import instruments.Piano;
	
	import songs.salsa.CalienteSwing;
	
	import ui.UIInstrumentSelection;
	import ui.UIPlaying;
	
	import utils.*;
	import utils.sceneHandler.*;

	[SWF(width="900", height="500", frameRate="30", backgroundColor="#FFFFFF")]
	[Frame(factoryClass="Preloader")]	
	public class Main extends MovieClip
	{
		public static var main:MovieClip;
		public static var level:Level;
		private var _mask:Mask;
		
		public function Main()
		{
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
			GunplayMeta;
		}
		
		private function addedToStage(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			initializeHandlers();
			addEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
			level =	new Level();
			if (Config.IS_DEBUGGING)
				stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		private function removedFromStage(event:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
			soundTransform = new SoundTransform(0);
		}
		
		private function initializeHandlers():void
		{
			UpdateHandler.initialize(this.stage);
			InputHandler.initialize(this.stage);
			AnimationLibrary.initialize();
			AnimationController.initialize();
			AudioHandler.initialize();
			AudioLibrary.initialize();
			UIHandler.initialize();
			UpdateHandler.instance.addUpdatee(UIHandler.instance);
			main = this;
			addChild(AnimationController.container);
			addChild(UIHandler.instance.container);
		}
		
		private function onKeyUp(event:KeyboardEvent):void
		{
			var keyCode:uint = event.keyCode;
			if (keyCode == Keyboard.NUMPAD_1 || keyCode == String("1").charCodeAt())
				Main.level.levelIndex = 1;
			else if (keyCode == Keyboard.NUMPAD_2 || keyCode == String("2").charCodeAt())
				Main.level.levelIndex = 2;
			else if (keyCode == Keyboard.NUMPAD_3 || keyCode == String("3").charCodeAt())
				Main.level.levelIndex = 3;
		}
	}
}
