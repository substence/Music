package songs.hiphop
{
	import audio.AudioLibrary;
	
	import instruments.*;
	
	import songs.Song;
	
	public class HipHopGroove extends Song
	{
		private const ASSET_LOCATION:String = "HipHopGroove.swf"; 
		
		public function HipHopGroove()
		{
			super(AudioLibrary.SONG_HIPHOP_GROOVE, ASSET_LOCATION, [new Synth(), new ElectricPiano(), new Piano()]);
			name = "HipHop Groove";
			levelStartTimes = [getMillisecondsFromTime("8.812"), getMillisecondsFromTime("1:11.490"), getMillisecondsFromTime("2:09.375"), getMillisecondsFromTime("3:04.700")];
			//lEVEL 1
			//1-1
			createSequence(["C", "C"], ["19.486", "21.866"], "29.125"); 			
			//1- 2
			createSequence(["C", "V", "C"], ["29.125", "30.325", "31.508"], "38.766"); 			
			//1 - 3
			createSequence(["C", "B", "C"], ["38.766", "39.958", "41.175"], "48.400"); 			
			//1 - 4
			createSequence(["C", "V", "B", "C"], ["48.400", "49.608", "50.250", "50.941"], "58.000");
			//LEVEL 2
			//2-1
			createSequence(["N", "V", "B", "C"], ["01:17.350", "01:18.558", "01:19.750", "01:20.975"], "01:27.000"); 			
			//2- 2
			createSequence(["B", "V", "C", "C"], ["01:27.000", "01:28.216", "01:29.430", "01:30.625"], "01:36.641"); 			
			//2 - 3
			createSequence(["B", "N", "C", "V"], ["01:36.641", "01:37.850", "01:39.060", "01:40.275"], "01:46.308"); 			
			//2 - 4
			createSequence(["V", "C", "B", "C"], ["01:46.308", "01:47.508", "01:48.700", "01:49.916"], "1:55.833");
			//LEVEL 3
			//3-1
			createSequence(["N", "V", "B", "N", "C"], ["02:15.233", "02:16.450", "02:17.066", "02:17.675", "02:18.866"], "02:24.900");
			//3- 2
			createSequence(["C", "V", "B", "B", "V", "C"], ["02:24.900", "02:25.525", "02:26.133", "02:27.300", "02:27.925", "02:28.150"], "2:34.458"); 	
			//3 - 3
			createSequence(["N", "C", "V", "B", "N", "C"], ["02:34.528", "02:35.133", "02:35.766", "02:36.950", "02:37.550", "02:38.150"], "02:44.183"); 			
			//3 - 4
			createSequence(["C", "V", "B", "C", "B"], ["02:44.183", "02:45.391", "02:46.025", "02:46.591", "02:47.816"], "2:53.650");
		}
	}
}
