package ui
{
	import animation.AnimationController;
	import animation.AnimationLibrary;
	
	import audio.AudioHandler;
	import audio.AudioLibrary;
	
	import entities.UIEntity;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.SoundTransform;
	
	import instruments.Guitar;
	import instruments.Instrument;
	import instruments.Piano;
	import instruments.Trombone;
	import instruments.Trumpet;
	
	import songs.Song;
	import songs.salsa.CalienteSwing;
	
	import utils.QuickFrameTimer;
	
	public class UIInstrumentSelection extends UIEntity
	{
		public static const INSTRUMENT_SELECTION_FRAME:int = 315;
		private var _graphic:SelectionUI;
		private var _song:Song;
		private var _instrument:Instrument;
		private var _instrumentButtons:Array;
		private var _songButtons:Array;
		private var _preLoader:ChuckVPreloader;
		
		public function UIInstrumentSelection()
		{
			_graphic = new SelectionUI();
			_instrumentButtons = new Array();
			_songButtons = new Array();
			addSongButtons();
			if (AnimationController.charactersAnimation is AnimationLibrary.getAnimationType(AnimationLibrary.CHARACTERS_INTRO))
			{
				
			}
			else
			{
				AnimationController.changeCharacterAnimation(AnimationLibrary.CHARACTERS_INTRO);
			}
			AnimationController.charactersAnimation.stop();
			AudioHandler.playSoundByLabels(AudioLibrary.CROWD_CHEERING, AudioLibrary.CROWD);
			AudioHandler.getSound(AudioLibrary.PICK_A_SONG).play();
			super(_graphic);
		}
		
		private function addSongButtons():void
		{
			var setList:Array = Level.genre.playlist;
			for (var i:int = 0; i < 4; i++) 
			{
				var button:GSongButton = GSongButton(_graphic.setList.getChildByName("songButton" + (i + 1)));
				button.textField.mouseEnabled = false;
				if (setList.length <= i)
				{
					button.visible = false;
					continue;
				}
				var songButton:SongButton = new SongButton(button, setList[i]);
				songButton.addEventListener(MouseEvent.CLICK, selectSong);
				_songButtons.push(songButton);
			}
		}
		
		private function removeSongButtons():void
		{
			for (var i:int = 0; i < _songButtons.length; i++) 
			{		
				var songButton:SongButton = _songButtons[i];
				songButton.removeEventListener(MouseEvent.CLICK, selectSong);
				songButton.destroy();
			}	
		}
		
		private function addInstrumentButtons():void
		{
			for (var i:int = 0; i < _song.instruments.length; i++)
			{
				var inst:Instrument = _song.instruments[i];
				var button:SimpleButton = SimpleButton(_graphic.getChildByName("instrumentButton" + (i + 1)));
				var graphic:InstrumentFrame = InstrumentFrame(_graphic.getChildByName("instrumentGraphic" + (i + 1)));
				graphic.addChildAt(AnimationLibrary.getAnimation(inst.buttonGraphic), 1);
				var instrumentButton:InstrumentButton = new InstrumentButton(button, inst);
				instrumentButton.addEventListener(MouseEvent.CLICK, clickedInstrumentButton);
				instrumentButton.addEventListener(MouseEvent.MOUSE_OVER, rollOverInstrumentButton);
				_instrumentButtons.push(instrumentButton);
			}
		}
		
		private function removeInstrumentButtons():void
		{
			for (var i:int = 0; i < _instrumentButtons.length; i++)
			{
				var button:InstrumentButton = _instrumentButtons[i];
				button.removeEventListener(MouseEvent.CLICK, clickedInstrumentButton);
				button.removeEventListener(MouseEvent.MOUSE_OVER, rollOverInstrumentButton);
				button.destroy();
			}
		}
		
		private function clickedSkip(event:MouseEvent):void
		{
			introAnimationComplete();
		}
		
		private function selectSong(event:MouseEvent):void
		{
			removeSongButtons();
			_song = SongButton(event.target).song;
			_song.loadAssets();
			_preLoader = new ChuckVPreloader(_song.loader.contentLoaderInfo);
			_preLoader.addEventListener(Event.COMPLETE, songLoaded);
			_graphic.addChild(_preLoader);
		}
		
		private function songLoaded(event:Event):void
		{
			_preLoader.removeEventListener(Event.COMPLETE, songLoaded);
			addInstrumentButtons();
			_graphic.play();
			introAnimationComplete();
			AnimationController.navigation.mainMenuButton.visible = true;
		}
		
		private function introAnimationComplete(event:Event = null):void
		{
			AnimationController.charactersAnimation.soundTransform = new SoundTransform(1);
			AnimationController.charactersAnimation.gotoAndPlay(Level.genre.instrumentFrame + 1);
			AnimationController.eventDispatcher.removeEventListener(AnimationController.ANIMATION_COMPLETE, introAnimationComplete);
		}
		
		private function rollOverInstrumentButton(event:MouseEvent):void
		{
			var instrumentButton:InstrumentButton = InstrumentButton(event.target);
			AnimationController.changeCharacterAnimation(instrumentButton.instrument.preSelectAnimation);
		}
		
		private function clickedInstrumentButton(event:MouseEvent):void
		{
			var instrumentButton:InstrumentButton = InstrumentButton(event.target);
			AnimationController.changeCharacterAnimation(instrumentButton.instrument.postSelectAnimation);
			AnimationController.eventDispatcher.addEventListener(AnimationController.ANIMATION_COMPLETE, postSelectAnimationComplete);
			_graphic.play();
			Main.level.song = _song;
			Main.level.instrument = instrumentButton.instrument;
		}
		
		private function postSelectAnimationComplete(event:Event):void
		{
			AnimationController.eventDispatcher.removeEventListener(AnimationController.ANIMATION_COMPLETE, postSelectAnimationComplete);
			proceedToPlaying();
		}
		
		private function proceedToPlaying():void
		{
			new QuickFrameTimer(1, Main.level.showInstructions);
		}
		
		override public function removed():void
		{
			destroy();
		}
		
		override public function destroy():void
		{
			removeInstrumentButtons();
			_graphic.continueButton.removeEventListener(MouseEvent.CLICK, selectSong);
		}
	}
}
import flash.display.MovieClip;
import flash.display.SimpleButton;
import flash.events.*;

import instruments.Instrument;

import songs.Song;

class InstrumentButton extends EventDispatcher
{
	public var instrument:Instrument;
	public var button:SimpleButton;
	
	public function InstrumentButton(button:SimpleButton, instrument:Instrument)
	{
		this.instrument = instrument;
		this.button = button;
		button.addEventListener(MouseEvent.CLICK, clickButton);
		button.addEventListener(MouseEvent.MOUSE_OVER, rollOverButton);
	}
	
	private function rollOverButton(event:MouseEvent):void
	{
		dispatchEvent(event);
	}
	
	private function clickButton(event:MouseEvent):void
	{
		dispatchEvent(event);
	}
	
	public function destroy():void
	{
		button.removeEventListener(MouseEvent.CLICK, clickButton);
		button.removeEventListener(MouseEvent.MOUSE_OVER, rollOverButton);
	}
}

class SongButton extends EventDispatcher
{
	public var song:Song;
	public var button:GSongButton;
	
	public function SongButton(button:GSongButton, song:Song)
	{
		this.song = song;
		this.button = button;
		button.textField.text = song.name;
		button.addEventListener(MouseEvent.CLICK, clickButton);
	}
	
	private function clickButton(event:MouseEvent):void
	{
		dispatchEvent(event);
	}
	
	public function destroy():void
	{
		button.removeEventListener(MouseEvent.CLICK, clickButton);
	}
}