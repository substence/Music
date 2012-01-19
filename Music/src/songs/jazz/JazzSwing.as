package songs.jazz
{
	import audio.AudioLibrary;
	
	import instruments.*;
	
	import songs.Song;
	
	public class JazzSwing extends Song
	{
		private const ASSET_LOCATION:String = "JazzSwing.swf"; 
		
		public function JazzSwing()
		{
			super(AudioLibrary.SONG_JAZZ_SWING, ASSET_LOCATION, [new Saxophone(), new Trombone(), new Guitar()]);
			name = "Jazz Swing";
			levelStartTimes = [getMillisecondsFromTime("8.797"), getMillisecondsFromTime("1:08.824"), getMillisecondsFromTime("2:06.906"), getMillisecondsFromTime("03:03.033")];
			//lEVEL 1
			//1-1
			createSequence(["C", "C"], ["19.291", "21.700"], "28.941"); 			
			//1- 2
			createSequence(["C", "N"], ["28.941", "31.358"], "38.591"); 			
			//1 - 3
			createSequence(["V", "B", "C"], ["38.591", "39.800", "41.000"], "48.241"); 			
			//1 - 4
			createSequence(["V", "C", "N"], ["48.241", "49.433", "50.641"], "57.900");
			//LEVEL 2
			//2-1
			createSequence(["C", "V", "C", "N"], ["1:17.191", "1:18.391", "1:19.600", "1:20.808"], "1:26.833"); 			
			//2- 2
			createSequence(["V", "B", "C", "N"], ["1:26.833", "1:28.041", "1:29.241", "1:30.450"], "1:36.491"); 			
			//2 - 3
			createSequence(["V", "C", "V", "C", "N"], ["1:36.491", "1:37.341", "1:38.300", "1:38.908", "1:40.108"], "1:46.141"); 			
			//2 - 4
			createSequence(["V", "B", "V", "C", "N"], ["1:46.141", "1:47.341", "1:47.933", "1:48.558", "1:49.758"], "1:55.560");
			//LEVEL 3
			//3-1
			createSequence(["C", "V", "C", "V", "C"], ["2:15.058", "2:15.691", "2:16.291", "2:16.891", "2:17.508"], "2:24.733"); 			
			//3- 2
			createSequence(["V", "C", "B", "V", "C", "N"], ["2:24.733", "2:25.341", "2:25.941", "2:27.141", "2:27.750", "2:28.350"], "2:34.375"); 			
			//3 - 3
			createSequence(["N", "B", "V", "V", "B", "N"], ["2:34.375", "2:34.975", "2:35.666", "2:36.858", "2:37.400", "2:38.000"], "2:44.016"); 			
			//3 - 4
			createSequence(["N", "C", "V", "V", "C", "V"], ["2:44.016", "2:44.625", "2:45.235", "2:46.433", "2:47.041", "2:47.650"], "2:53.650");	//END TIME?
		}
	}
}