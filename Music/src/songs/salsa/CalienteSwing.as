package songs.salsa
{
	import audio.AudioLibrary;
	
	import instruments.Piano;
	import instruments.Trombone;
	import instruments.Trumpet;
	import songs.Song;
	
	public class CalienteSwing extends Song
	{
		private const ASSET_LOCATION:String = "CalienteSwing.swf"; 
		
		public function CalienteSwing()
		{
			super(AudioLibrary.SONG_CALIENTE_SWING, ASSET_LOCATION, [new Trumpet(), new Piano(), new Trombone()]);
			name = "Caliente Swing";
			//levelStartTimes = [18000, 75000, 133062, 183000];
			levelStartTimes = [16000, 73000, 131062, 181000];			
			//1-1
			createSequence(["C", "C"], [19331, 21740], 28950); 			
			//1- 2
			createSequence(["C", "V", "C"], [28950, 30450, 31350], 38730); 			
			//1 - 3
			createSequence(["C", "B", "V", "C"], [38730, 40000, 40500, 41000], 48000); 			
			//1 - 4
			createSequence(["C", "V", "B", "N"], [48000, 49200, 49800, 50550], 58000); 
			//
			//2 - 1
			createSequence(["V", "C", "V", "C"], [77110, 78250, 79040, 79800], 86440); 
			//2 - 2
			createSequence(["V", "B", "V", "C"], [86440, 88050, 88360, 89170], 96270); 
			//2 - 3
			createSequence(["V", "N", "B", "V", "C"], [96270, 97100, 97600, 98210, 99020], 106100); 
			//2 - 4
			createSequence(["V", "C", "V", "B", "N"], [106100, 106530, 107240, 108030, 108530], 114000); 
			//
			//3 - 1
			createSequence(["V", "N", "B", "V", "C", "C"], [getMillisecondsFromTime("2:15.058"), 
															getMillisecondsFromTime("2:15.700"), 
															getMillisecondsFromTime("2:16.283"), 
															getMillisecondsFromTime("2:16.900"), 
															getMillisecondsFromTime("2:17.525"), 
															getMillisecondsFromTime("2:18.683 ")], 144100);  //special
			//3 - 2
			createSequence(["N", "B", "V", "B", "N", "N"], [getMillisecondsFromTime("2:24.725"), 
															getMillisecondsFromTime("2:25.341"), 
															getMillisecondsFromTime("2:25.941"), 
															getMillisecondsFromTime("2:26.550"), 
															getMillisecondsFromTime("2:27.150"), 
															getMillisecondsFromTime("2:28.330")], getMillisecondsFromTime("2:34.375")); 
			//3 - 3
			createSequence(["C", "V", "B", "C", "V", "C"], [getMillisecondsFromTime("2:34.375"), 
															getMillisecondsFromTime("2:34.983"), 
															getMillisecondsFromTime("2:35.608"), 
															getMillisecondsFromTime("2:36.783"), 
															getMillisecondsFromTime("2:37.400"), 
															getMillisecondsFromTime("2:38.008")], getMillisecondsFromTime("2:44.083")); 
			//3 - 4
			createSequence(["V", "N", "B", "B", "V", "C"], [getMillisecondsFromTime("2:44.083"), 
															getMillisecondsFromTime("2:44.725"), 
															getMillisecondsFromTime("2:45.333"), 
															getMillisecondsFromTime("2:46.525"), 
															getMillisecondsFromTime("2:47.133"), 
															getMillisecondsFromTime("2:47.741")], 174700)
		}
	}
}