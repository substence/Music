package audio
{
	import audio.AudioHandler;
	
	import cfg.Config;
	
	import flash.media.Sound;
	
	import instruments.Piano;

	public class AudioLibrary
	{
		//Songs
		public static const SONG_REGGAE_SWING:String = "ReggaeSwing";
		public static const SONG_REGGAE_DELIGHT:String = "ReggaeDelight";
		public static const SONG_REGGAE_GROOVE:String = "ReggaeGroove";
		public static const SONG_CALIENTE_SWING:String = "CalienteSwing";
		public static const SONG_SALSA_DELITE:String = "SalsaDelight";
		public static const SONG_SALSA_GROOVE:String = "SalsaGroove";
		public static const SONG_JAZZ_SWING:String = "JazzSwing";
		public static const SONG_JAZZ_GROOVE:String = "JazzGroove";
		public static const SONG_JAZZ_DELIGHT:String = "JazzDelight";
		public static const SONG_HIPHOP_SWING:String = "HipHopSwing";
		public static const SONG_HIPHOP_GROOVE:String = "HipHopGroove";
		public static const SONG_HIPHOP_DELIGHT:String = "HipHopDelight";
		public static const SONG_COUNTRY_GROOVE:String = "CountryGroove";
		public static const SONG_COUNTRY_SWING:String = "CountrySwing";
		public static const SONG_COUNTRY_DELIGHT:String = "CountryDelight";
		public static const SONG_ROCK_GROOVE:String = "RockGroove";
		public static const SONG_ROCK_SWING:String = "RockSwing";
		public static const SONG_ROCK_DELIGHT:String = "RockDelight";
		//Instruments
			//Piano
			public static const PIANO_A:String = "PianoNoteA";
			public static const PIANO_B:String = "PianoNoteB";
			public static const PIANO_C:String = "PianoNoteC";
			public static const PIANO_D:String = "PianoNoteD";
			//Trombone
			public static const TROMBONE_C:String = "TromboneNoteC";
			public static const TROMBONE_V:String = "TromboneNoteV";
			public static const TROMBONE_B:String = "TromboneNoteB";
			public static const TROMBONE_N:String = "TromboneNoteN";
			//Trumpet
			public static const TRUMPET_C:String = "TrumpetNoteC";
			public static const TRUMPET_V:String = "TrumpetNoteV";
			public static const TRUMPET_B:String = "TrumpetNoteB";
			public static const TRUMPET_N:String = "TrumpetNoteN";
			//Oboe
			public static const OBOE_A:String = "OboeNoteA";
			public static const OBOE_B:String = "OboeNoteB";
			public static const OBOE_C:String = "OboeNoteC";
			public static const OBOE_G:String = "OboeNoteG";
			//Violin
			public static const VIOLIN_A:String = "ViolinNoteA";
			public static const VIOLIN_B:String = "ViolinNoteB";
			public static const VIOLIN_C:String = "ViolinNoteC";
			public static const VIOLIN_G:String = "ViolinNoteG";
			//Guitar
			public static const GUITAR_C:String = "GuitarNoteC";
			public static const GUITAR_V:String = "GuitarNoteV";
			public static const GUITAR_B:String = "GuitarNoteB";
			public static const GUITAR_N:String = "GuitarNoteN";
			//Saxophone
			public static const SAXOPHONE_C:String = "SaxNoteC";
			public static const SAXOPHONE_V:String = "SaxNoteV";
			public static const SAXOPHONE_B:String = "SaxNoteB";
			public static const SAXOPHONE_N:String = "SaxNoteN";
			//ElectGuitar
			public static const ELECTGUITAR_A:String = "ElectGuitarNoteA";
			public static const ELECTGUITAR_B:String = "ElectGuitarNoteB";
			public static const ELECTGUITAR_C:String = "ElectGuitarNoteC";
			public static const ELECTGUITAR_D:String = "ElectGuitarNoteD";
			//ElectPiano
			public static const ELECTPIANO_C:String = "ElectPianoNoteC";
			public static const ELECTPIANO_V:String = "ElectPianoNoteV";
			public static const ELECTPIANO_B:String = "ElectPianoNoteB";
			public static const ELECTPIANO_N:String = "ElectPianoNoteN";
			//Organ
			public static const ORGAN_C:String = "OrganNoteC";
			public static const ORGAN_V:String = "OrganNoteV";
			public static const ORGAN_B:String = "OrganNoteB";
			public static const ORGAN_N:String = "OrganNoteN";
			//Synth
			public static const SYNTH_C:String = "SynthNoteC";
			public static const SYNTH_V:String = "SynthNoteV";
			public static const SYNTH_B:String = "SynthNoteB";
			public static const SYNTH_N:String = "SynthNoteN";
			//Fiddle
			public static const FIDDLE_C:String = "FiddleNoteC";
			public static const FIDDLE_V:String = "FiddleNoteV";
			public static const FIDDLE_B:String = "FiddleNoteB";
			public static const FIDDLE_N:String = "FiddleNoteN";
			//Organ
			public static const BANJO_C:String = "BanjoNoteC";
			public static const BANJO_V:String = "BanjoNoteV";
			public static const BANJO_B:String = "BanjoNoteB";
			public static const BANJO_N:String = "BanjoNoteN";
			//Effects
			public static const PICK_A_SONG:String = "pickASong";
			public static const CROWD_CHEERING:String = "crowdCheering";
			public static const CROWD_CHEERING_ENTHUSED:String = "crowdCheeringEnthused";
			// Channels
			public static const MUSIC_CHANNEL:String = "musicChannel";
			public static const EFFECTS:String = "effectsChannel";		
			public static const INSTRUMENT:String = "instrumentChannel";	
			public static const CROWD:String = "crowdChannel";		
			public static const SONG:String = "songChannel";		

		
		public static function initialize():void
		{
			registerChannels();
			registerSounds();
		}
		
		public static function registerSounds():void
		{
/*			AudioHandler.registerSound(new SalsaSong(), SONG_SALSA);
			AudioHandler.registerSound(new SalsaSongGuitarOnly(), SONG_SALSA_GUITAR);
			AudioHandler.registerSound(new SalsaSongNoSolo(), SONG_SALSA_NOSOLO);
			AudioHandler.registerSound(new SalsaSongTrumpetOnly(), SONG_SALSA_TRUMPET);
			AudioHandler.registerSound(new GuitarNoteA(), GUITAR_A);
			AudioHandler.registerSound(new GuitarNoteC(), GUITAR_C);
			AudioHandler.registerSound(new GuitarNoteB(), GUITAR_B);
			AudioHandler.registerSound(new GuitarNoteD(), GUITAR_D);
			AudioHandler.registerSound(new PianoNoteA(), PIANO_A);
			AudioHandler.registerSound(new PianoNoteB(), PIANO_B);
			AudioHandler.registerSound(new PianoNoteC(), PIANO_C);
			AudioHandler.registerSound(new PianoNoteD(), PIANO_D);
			AudioHandler.registerSound(new TromboneNoteA(), TROMBONE_A);
			AudioHandler.registerSound(new TromboneNoteB(), TROMBONE_B);
			AudioHandler.registerSound(new TromboneNoteC(), TROMBONE_C);
			AudioHandler.registerSound(new TromboneNoteD(), TROMBONE_D);
			AudioHandler.registerSound(new TrumpetNoteA(), TRUMPET_A);
			AudioHandler.registerSound(new TrumpetNoteB(), TRUMPET_B);
			AudioHandler.registerSound(new TrumpetNoteC(), TRUMPET_C);
			AudioHandler.registerSound(new TrumpetNoteD(), TRUMPET_D);*/
			AudioHandler.registerSound(new RamonaPickASong(), PICK_A_SONG);
			AudioHandler.registerSound(new CrowdCheering(), CROWD_CHEERING);
			AudioHandler.registerSound(new CrowdCheeringEnthusiastically(), CROWD_CHEERING_ENTHUSED);
		}
		
		public static function registerChannels():void
		{
			var effectsGroup:ChannelGroup = AudioHandler.registerChannelGroup(EFFECTS);
			AudioHandler.registerChannelGroup(MUSIC_CHANNEL, Config.DEFAULT_MUSIC_VOLUME);
			AudioHandler.registerChannel(INSTRUMENT, Config.DEFAULT_EFFECTS_VOLUME, effectsGroup);
			AudioHandler.registerChannel(CROWD, Config.DEFAULT_CROWD_VOLUME, effectsGroup);
			AudioHandler.registerChannel(SONG, 1, AudioHandler.getChannelGroup(AudioLibrary.MUSIC_CHANNEL));
		}
	}
}