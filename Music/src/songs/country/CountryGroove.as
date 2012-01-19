package songs.country
{
	import audio.AudioLibrary;
	
	import instruments.*;
	
	import songs.Song;
	
	public class CountryGroove extends Song
	{
		private const ASSET_LOCATION:String = "CountryGroove.swf"; 
		
		public function CountryGroove()
		{
			super(AudioLibrary.SONG_COUNTRY_GROOVE, ASSET_LOCATION, [new Fiddle(), new Organ(), new Piano()]);
			name = "Country Groove";
			levelStartTimes = [getMillisecondsFromTime("10.158"), getMillisecondsFromTime("52.612"), getMillisecondsFromTime("1:34.165"), getMillisecondsFromTime("2:14.184")];
			//lEVEL 1
			//1-1
			createSequence(["C", "V"], ["14.358", "16.100"], "21.316"); 			
			//1- 2
			createSequence(["B", "V", "C"], ["21.316", "22.183", "23.033"], "28.275"); 			
			//1 - 3
			createSequence(["C", "V", "B", "C"], ["28.275", "29.150", "30.019", "30.881"], "35.231"); 			
			//1 - 4
			createSequence(["C", "V", "C", "B"], ["35.231", "36.100", "36.956", "37.844"], "42.144");
			//LEVEL 2
			//2-1
			createSequence(["C", "V", "B", "N", "B"], ["56.100", "56.969", "57.296", "57.854", "58.721"], "1:03.066"); 			
			//2- 2
			createSequence(["N", "B", "V", "B", "C"], ["1:03.066", "1:03.937", "1:04.375", "1:04.800", "1:05.675"], "1:10.021"); 			
			//2 - 3
			createSequence(["C", "V", "B", "N", "B", "V"], ["1:10.021", "1:10.472", "1:10.806", "1:11.337", "1:12.200", "1:12.637"], "1:16.981"); 			
			//2 - 4
			createSequence(["N", "B", "N", "V", "B", "N"], ["1:16.981", "1:17.415", "1:17.812", "1:18.287", "1:19.156", "1:19.612"], "1:23.890");
			//LEVEL 3
			//3-1
			createSequence(["B", "B", "N", "V", "C", "V"], ["1:37.865", "1:38.731", "1:39.172", "1:39.609", "1:40.050", "1:40.484"], "1:44.819");
			//3- 2
			createSequence(["C", "C", "V", "B", "B"], ["1:44.819", "1:45.690", "1:46.134", "1:46.569", "1:47.428"], "1:51.775"); 	
			//3 - 3
			createSequence(["C", "B", "V", "N", "B", "B"], ["1:51.775", "1:52.228", "1:52.647", "1:53.094", "1:53.540", "1:54.387"], "1:58.734"); 			
			//3 - 4
			createSequence(["B", "V", "B", "V", "C", "C"], ["1:58.734", "1:59.169", "1:59.606", "2:00.044", "2:00.494", "2:01.340"], "2:02.269"); //FUCKED
		}
	}
}
