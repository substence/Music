package songs.country
{
	import audio.AudioLibrary;
	
	import instruments.*;
	
	import songs.Song;
	
	public class CountryDelight extends Song
	{
		private const ASSET_LOCATION:String = "CountryDelight.swf"; 
		
		public function CountryDelight()
		{
			super(AudioLibrary.SONG_COUNTRY_DELIGHT, ASSET_LOCATION, [new Fiddle(), new Banjo(), new Piano()]);
			name = "Country Delight";
			//levelStartTimes = [getMillisecondsFromTime("8.812"), getMillisecondsFromTime("1:11.490"), getMillisecondsFromTime("02:44.183"), getMillisecondsFromTime("3:04.700")];
			levelStartTimes = [getMillisecondsFromTime("8.812"), getMillisecondsFromTime("41.966"), getMillisecondsFromTime("1:17.958"), getMillisecondsFromTime("2:09.200")];
			//lEVEL 1
			//1-1
			createSequence(["B", "C"], ["11.983", "13.491"], "17.991"); 			
			//1- 2
			createSequence(["C", "V", "B"], ["17.991", "18.741", "19.491"], "23.983"); 			
			//1 - 3
			createSequence(["B", "N", "B", "C"], ["23.983", "24.741", "25.491", "26.233"], "29.991"); 			
			//1 - 4
			createSequence(["N", "B", "V", "B"], ["29.991", "30.733", "31.483", "32.241"], "35.858");
			//LEVEL 2
			//2-1
			createSequence(["C", "B", "V", "N", "B"], ["47.983", "48.350", "48.733", "49.491", "50.233"], "53.991"); 			
			//2- 2
			createSequence(["B", "N", "B", "V", "C"], ["53.991", "54.358", "54.750", "55.491", "56.233"], "59.991"); 			
			//2 - 3
			createSequence(["C", "B", "V", "B", "C"], ["59.991", "1:00.733", "1:01.008", "1:01.483", "1:02.241"], "1:05.991"); 			
			//2 - 4
			createSequence(["B", "N", "B", "V", "C", "C"], ["1:05.991", "1:06.358", "1:06.741", "1:07.108", "1:07.483", "1:08.241"], "1:11.816");
			//LEVEL 3
			//3-1
			createSequence(["C", "V", "B", "N", "B"], ["1:23.991", "1:24.733", "1:25.108", "1:25.475", "1:26.233"], "1:29.983");
			//3- 2
			createSequence(["B", "N", "B", "V", "B", "C"], ["1:29.983", "1:30.358", "1:30.725", "1:31.491", "1:31.858", "1:32.233"], "1:35.883"); 	
			//3 - 3
			createSequence(["C", "V", "B", "N", "B", "B"], ["1:35.983", "1:36.366", "1:36.733", "1:37.108", "1:37.491", "1:38.233"], "1:41.991"); 			
			//3 - 4
			createSequence(["B", "B", "B", "V", "C"], ["1:41.991", "1:42.733", "1:43.491", "1:43.858", "1:44.241"], "1:47.866"); //FUCKED
		}
	}
}
