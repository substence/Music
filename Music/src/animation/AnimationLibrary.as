package animation
{
	import flash.display.MovieClip;
	import flash.utils.Dictionary;
	
	import instruments.Organ;

	public class AnimationLibrary
	{
		public static const CHARACTERS_INTRO:String = "charactersIntro";
		public static const CHARACTERS_INSTRUCTIONS:String = "charactersInstructions";
		public static const CHARACTERS_GET_READY:String = "charactersGetReady";
		public static const CHARACTERS_FINISH:String = "charactersFinish";
		public static const CHARACTERS_START_LEVEL:String = "startLevel";
		public static const CHARACTERS_START_LEVEL_1:String = "startLevel1";
		public static const CHARACTERS_START_LEVEL_2:String = "startLevel2";
		public static const CHARACTERS_START_LEVEL_3:String = "startLevel3";
		public static const CHARACTERS_HELP:String = "charactersHelp";
		public static const GENERIC_POST_SELECT:String = "GenericPostSelect";
		
		public static const ORGAN_BUTTON:String = "OrganButton";
		public static const ORGAN_PRE_SELECT:String = "OrganPreSelect";
		public static const ORGAN_POST_SELECT:String = "OrganPostSelect";
		public static const GUITAR_BUTTON:String = "GuitarButton";
		public static const GUITAR_PRE_SELECT:String = "GuitarPreSelect";
		public static const GUITAR_POST_SELECT:String = "GuitarPostSelect";
		public static const TRUMPET_BUTTON:String = "TrumpetButton";
		public static const TRUMPET_PRE_SELECT:String = "TrumpetPreSelect";
		public static const TRUMPET_POST_SELECT:String = "TrumpetPostSelect";
		public static const PIANO_BUTTON:String = "PianoButton";
		public static const PIANO_PRE_SELECT:String = "PianoPreSelect";
		public static const PIANO_POST_SELECT:String = "PianoPostSelect";
		public static const TROMBONE_BUTTON:String = "TromboneButton";
		public static const TROMBONE_PRE_SELECT:String = "TrombonePreSelect";
		public static const TROMBONE_POST_SELECT:String = "TrombonePostSelect";
		public static const OBOE_BUTTON:String = "OboeButton";
		public static const OBOE_PRE_SELECT:String = "OboePreSelect";
		public static const OBOE_POST_SELECT:String = "OboePostSelect";
		public static const VIOLIN_BUTTON:String = "ViolinButton";
		public static const VIOLIN_PRE_SELECT:String = "ViolinPreSelect";
		public static const VIOLIN_POST_SELECT:String = "ViolinPostSelect";
		public static const SAX_BUTTON:String = "SaxButton";
		public static const SAX_PRE_SELECT:String = "SaxPreSelect";
		public static const SAX_POST_SELECT:String = "SaxPostSelect";
		public static const ELECTPIANO_BUTTON:String = "ElectPianoButton";
		public static const ELECTPIANO_PRE_SELECT:String = "ElectPianoPreSelect";
		public static const ELECTPIANO_POST_SELECT:String = "ElectPianoPostSelect";
		public static const ELECTGUITAR_BUTTON:String = PIANO_BUTTON;
		public static const ELECTGUITAR_PRE_SELECT:String = "ElectGuitarPreSelect";
		public static const ELECTGUITAR_POST_SELECT:String = "ElectGuitarPostSelect";
		public static const SYNTH_BUTTON:String = PIANO_BUTTON;
		public static const SYNTH_PRE_SELECT:String = "SynthPreSelect";
		public static const SYNTH_POST_SELECT:String = "SynthPostSelect";
		public static const FIDDLE_BUTTON:String = "FiddleButton";
		public static const FIDDLE_PRE_SELECT:String = "FiddlePreSelect";
		public static const FIDDLE_POST_SELECT:String = "FiddlePostSelect";
		public static const BANJO_BUTTON:String = "BanjoButton";
		public static const BANJO_PRE_SELECT:String = "BanjoPreSelect";
		public static const BANJO_POST_SELECT:String = "BanjoPostSelect";
		private static var _animations:Dictionary;

		public static function initialize():void
		{
			_animations = new Dictionary();
			addAnimations();
		}
		
		private static function addAnimations():void
		{
			addAnimation(GUITAR_BUTTON, GuitarButton);
			addAnimation(GUITAR_PRE_SELECT, characters_master_Line158B);
			addAnimation(TRUMPET_BUTTON, TrumpetButton);
			addAnimation(TRUMPET_PRE_SELECT, characters_master_Line158E);
			addAnimation(PIANO_PRE_SELECT, characters_master_Line158F);
			addAnimation(PIANO_BUTTON, PianoButton);
			addAnimation(TROMBONE_PRE_SELECT, characters_master_Line158D);
			addAnimation(TROMBONE_BUTTON, TromboneButton);
			addAnimation(OBOE_BUTTON, OboeButton);
			addAnimation(OBOE_PRE_SELECT, OboePreSelect);
			addAnimation(VIOLIN_BUTTON, ViolinButton);
			addAnimation(VIOLIN_PRE_SELECT, ViolinPreSelect);
			addAnimation(SAX_PRE_SELECT, SaxPreSelect);
			addAnimation(SAX_BUTTON, SaxButton);
			addAnimation(ELECTGUITAR_PRE_SELECT, ElectGuitarPreSelect);
			addAnimation(ELECTGUITAR_BUTTON, ElectGuitarButton);
			addAnimation(ORGAN_BUTTON, OrganButton);
			addAnimation(ORGAN_PRE_SELECT, OrganPreSelect);
			addAnimation(FIDDLE_BUTTON, FiddleButton);
			addAnimation(FIDDLE_PRE_SELECT, FiddlePreSelect);
			addAnimation(BANJO_BUTTON, BanjoButton);
			addAnimation(BANJO_PRE_SELECT, BanjoPreSelect);
			addAnimation(GENERIC_POST_SELECT, GenericPostSelect);
			//
			addAnimation(CHARACTERS_GET_READY, character_master_Line168);
			addAnimation(CHARACTERS_INSTRUCTIONS, characters_master_line248);
			addAnimation(CHARACTERS_HELP, characters_master_Line42HELP);
			///ROUND3?
			//USE GET READY
		}
		
		public static function addAnimation(key:String, type:Class):void
		{
			_animations[key] = type;
		}
		
		public static function getAnimation(key:String):MovieClip
		{
			var type:Class = _animations[key];
			if (type)
				return new type();
			return null;
		}
		
		public static function getAnimationType(key:String):Class
		{
			return  _animations[key];
		}
	}
}