package songs.salsa
{
	import audio.AudioLibrary;
	
	import instruments.*;
	
	import songs.Song;

	public class SalsaDelite extends Song
	{
		private const ASSET_LOCATION:String = "SalsaDelight.swf"; 

		public function SalsaDelite()
		{
			super(AudioLibrary.SONG_SALSA_DELITE, ASSET_LOCATION, [new Piano(), new Guitar(), new Trumpet()]);
			name = "Salsa Delight";
			levelStartTimes = [getMillisecondsFromTime("9.250"), getMillisecondsFromTime("1:06.125"), getMillisecondsFromTime("2:04.094"), getMillisecondsFromTime("2:58.000")];
			//lEVEL 1
			//1-1
			createSequence(["N", "B"], ["14.441", "17.483"], "24.116"); 			
			//1- 2
			createSequence(["V", "V", "C"], ["24.116", "26.175", "26.533"], "33.766"); 			
			//1 - 3
			createSequence(["N", "V", "C"], ["33.766", "36.175", "36.816"], "43.408"); 			
			//1 - 4
			createSequence(["N", "B", "V", "C"], ["43.408", "44.616", "45.825", "46.475"], "53.008"); //changed end from "1:06.125"
			//LEVEL 2
			//2-1
			createSequence(["V", "B", "N", "B"], ["1:12.358", "1:13.566", "1:14.766", "1:15.416"], "1:22.008"); 			
			//2- 2
			createSequence(["N", "B", "V", "V", "C"], ["1:22.008", "1:23.308", "1:23.850", "1:24.441", "1:25.066"], "1:31.658"); 			
			//2 - 3
			createSequence(["N", "B", "N", "V", "B"], ["1:31.658", "1:32.858", "1:33.483", "1:34.100", "1:34.725"], "1:41.308"); 			
			//2 - 4
			createSequence(["V", "N", "B", "V", "C"], ["1:41.308", "1:42.516", "1:43.125", "1:43.750", "1:44.350"], "1:50.916");
			//LEVEL 3
			//3-1
			createSequence(["V", "B", "N", "B", "V", "C"], ["2:10.241", "2:10.875", "2:11.516", "2:12.658", "2:13.258", "2:13.883"], "2:19.875"); 			
			//3- 2
			createSequence(["V", "C", "V", "N", "B", "N"], ["2:19.891", "2:20.500", "2:21.108", "2:22.290", "2:22.933", "2:23.575"], "2:29.525"); 			
			//3 - 3
			createSequence(["V", "B", "V", "V", "B", "C"], ["2:29.525", "2:30.175", "2:30.775", "2:31.941", "2:32.583", "2:33.175"], "2:39.170"); 			
			//3 - 4
			createSequence(["N", "B", "N", "V", "C", "V"], ["2:39.175", "2:39.850", "2:40.420", "2:41.591", "2:42.258", "2:42.866"], "2:48.833");
		}
	}
}