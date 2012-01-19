package cfg
{
	import genres.Country;
	import genres.Jazz;
	import genres.Reggae;
	import genres.Rock;
	import genres.Salsa;
	
	import instruments.Trumpet;
	
	import songs.country.CountryGroove;
	import songs.jazz.JazzGroove;
	import songs.rock.RockGroove;

	public class Config
	{
		//SWF Settings
		public static const BG_COLOR:uint = 0xFFFFFF;
		public static const FRAME_RATE:Number = 30;
		public static const STAGE_WIDTH:Number = 900;
		public static const STAGE_HEIGHT:Number = 500;	
		//Keys
		public static const NOTE_C:String = "C";	
		public static const NOTE_V:String = "V";	
		public static const NOTE_B:String = "B";	
		public static const NOTE_N:String = "N";	
		//Volume
		public static const DEFAULT_MUSIC_VOLUME:Number = .50//.33;	
		public static const DEFAULT_CROWD_VOLUME:Number = .5//.5;
		public static const DEFAULT_EFFECTS_VOLUME:Number = .75//.66;
		//Options
		public static const ARE_KEYS_LOCKED:Boolean = true;
		public static const MAX_LOOPS_TILL_RESET:int = 4;
		//Debug
		public static const IS_DEBUGGING:Boolean = true;		
		public static var DOES_SKIP_SELECTION:Boolean = false;
		public static var DOES_SKIP_INTRO:Boolean = false;
		public static var STARTING_LEVEL:int = 1;
		public static var STARTING_ROUND:int = 1;
		//
		public static const SONG_TIME_BUFFER:Number = 800;
		//
		public static const MAIN_DIRECTORY:String = "../";
		public static const ASSET_DIRECTORY:String = MAIN_DIRECTORY + "assets/";
		public static const SONG_DIRECTORY:String = ASSET_DIRECTORY + "songs/";
		//
		public static const GENRE:Class = Rock;
		public static const DEFAULT_SONG:Class = RockGroove;			//only works if DOES_SKIP_SELECTION == true
		public static const DEFAULT_INSTRUMENT:Class = Trumpet;	//only works if DOES_SKIP_SELECTION == true
		//External Events
		public static const BACK:String = "event_back";
		public static const FINISHED_LEVEL_1:String = "gameFinished";
	}
}