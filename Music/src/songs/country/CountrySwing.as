package songs.country
{
	import audio.AudioLibrary;
	
	import instruments.*;
	
	import songs.Song;
	
	public class CountrySwing extends Song
	{
		private const ASSET_LOCATION:String = "CountrySwing.swf"; 
		
		public function CountrySwing()
		{
			super(AudioLibrary.SONG_COUNTRY_SWING, ASSET_LOCATION, [new Organ(), new Fiddle(), new Banjo()]);
			name = "Country Swing";
			levelStartTimes = [getMillisecondsFromTime("9.000"), getMillisecondsFromTime("59.208"), getMillisecondsFromTime("1:49.266"), getMillisecondsFromTime("2:38.281")];
			//lEVEL 1
			//1-1
			createSequence(["C", "N"], ["18.766", "20.858"], "27.116"); 			
			//1- 2
			createSequence(["B", "C"], ["27.116", "29.208"], "35.466"); 			
			//1 - 3
			createSequence(["C", "B", "N"], ["35.466", "36.508", "37.558"], "43.816"); 			
			//1 - 4
			createSequence(["B", "V", "C"], ["43.816", "44.850", "45.908"], "55.008");
			//LEVEL 2
			//2-1
			createSequence(["B", "V", "B", "N"], ["1:08.866", "1:09.900", "1:10.500", "1:10.908"], "1:17.208"); 			
			//2- 2
			createSequence(["B", "B", "V", "C"], ["1:17.208", "1:18.241", "1:18.775", "1:19.275"], "1:25.558"); 			
			//2 - 3
			createSequence(["C", "B", "V", "B", "N"], ["1:25.558", "1:26.075", "1:26.591", "1:27.116", "1:27.633"], "1:33.908"); 			
			//2 - 4
			createSequence(["B", "C", "V", "B", "C", "N"], ["1:33.908", "1:34.425", "1:34.975", "1:35.566", "1:36.050", "1:37.025"], "1:42.999");
			//LEVEL 3
			//3-1
			createSequence(["B", "C", "B", "N", "C", "N"], ["1:58.950", "1:59.475", "1:59.991", "2:01.025", "2:01.533", "2:02.058"], "2:07.300"); 			
			//3- 2
			createSequence(["B", "C", "B", "V", "C", "V"], ["2:07.300", "2:07.816", "2:08.333", "2:09.383", "2:09.891", "2:10.433"], "2:15.650"); 			
			//3 - 3
			createSequence(["B", "C", "B", "V", "B", "C"], ["2:15.650", "2:16.158", "2:16.675", "2:17.716", "2:18.241", "2:18.766"], "2:23.983"); 			
			//3 - 4
			createSequence(["B", "V", "B", "N", "B", "C"], ["2:23.983", "2:25.050", "2:25.550", "2:26.041", "2:26.641", "2:27.108"], "2:32.191");	//END TIME?
		}
	}
}