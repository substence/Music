package songs.jazz
{
	import audio.AudioLibrary;
	
	import instruments.*;
	
	import songs.Song;
	
	public class JazzGroove extends Song
	{
		private const ASSET_LOCATION:String = "JazzGroove.swf"; 
		
		public function JazzGroove()
		{
			super(AudioLibrary.SONG_JAZZ_GROOVE, ASSET_LOCATION, [new Trumpet(), new ElectricGuitar(), new Piano()]);
			name = "Jazz Groove";
			levelStartTimes = [getMillisecondsFromTime("27.483"), getMillisecondsFromTime("1:40.341"), getMillisecondsFromTime("2:54.241"), getMillisecondsFromTime("3:52.191")];
			//levelStartTimes = [getMillisecondsFromTime("27.483"), getMillisecondsFromTime("2:19.616"), getMillisecondsFromTime("2:54.241"), getMillisecondsFromTime("3:52.191")];
			//lEVEL 1
			//1-1
			createSequence(["C", "C"], ["30.550", "33.616"], "42.783"); 			
			//1- 2
			createSequence(["C", "V", "C"], ["42.783", "44.316", "45.841"], "55.016"); 			
			//1 - 3
			createSequence(["C", "V", "B"], ["55.016", "56.541", "58.066"], "1:07.241"); 			
			//1 - 4
			createSequence(["B", "V", "C"], ["1:07.241", "1:08.775", "1:10.300"], "1:11.558");
			//LEVEL 2
			//2-1
			createSequence(["B", "V", "C", "C"], ["1:43.925", "1:44.741", "1:45.500", "1:46.983"], "1:56.158"); 			
			//2- 2
			createSequence(["B", "V", "C", "B"], ["1:56.158", "1:56.950", "1:57.700", "1:59.216"], "2:08.391"); 			
			//2 - 3
			createSequence(["C", "N", "C", "V", "B"], ["2:08.391", "2:09.166", "2:09.950", "2:10.733", "2:11.491"], "2:20.616"); 			
			//2 - 4
			createSequence(["C", "V", "C", "N", "C"], ["2:20.616", "2:21.416", "2:22.183", "2:22.975", "2:23.716"], "2:29.941");
			//LEVEL 3
			//3-1
			createSequence(["B", "V", "C", "C", "N", "B"], ["2:57.300", "2:58.125", "2:58.883", "3:00.358", "3:01.150", "3:01.941"], "3:09.533"); 			
			//3- 2
			createSequence(["C", "N", "C", "B", "V", "C"], ["3:09.533", "3:10.333", "3:11.108", "3:12.583", "3:13.391", "3:14.158"], "3:21.766"); 			
			//3 - 3
			createSequence(["B", "V", "N", "B", "V", "B"], ["3:21.766", "3:22.575", "3:23.341", "3:24.825", "3:25.608", "3:26.383"], "3:33.991"); 			
			//3 - 4
			createSequence(["C", "B", "N", "B", "V", "C"], ["3:33.991", "3:35.516", "3:36.325", "3:37.083", "3:37.825", "3:38.625"], "3:44.083");	//END TIME?
		}
	}
}