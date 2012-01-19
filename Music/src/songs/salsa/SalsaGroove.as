package songs.salsa
{
	import audio.AudioLibrary;
	
	import instruments.ElectricGuitar;
	import instruments.Piano;
	import instruments.Trumpet;
	
	import songs.Song;
	
	public class SalsaGroove extends Song
	{
		private const ASSET_LOCATION:String = "SalsaGroove.swf"; 
		
		public function SalsaGroove()
		{
			super(AudioLibrary.SONG_SALSA_GROOVE, ASSET_LOCATION, [new ElectricGuitar(), new Piano(), new Trumpet()]);
			name = "Salsa Groove";
			levelStartTimes = [getMillisecondsFromTime("20.433 "), getMillisecondsFromTime("1:34.566"), getMillisecondsFromTime("2:48.133"), getMillisecondsFromTime("3:50.533")];
			//lEVEL 1
			//1-1
			createSequence(["V", "V"], ["24.441", "27.508"], "36.675"); 			
			//1- 2
			createSequence(["V", "B", "V"], ["36.675", "38.208", "39.733"], "48.900"); 			
			//1 - 3
			createSequence(["V", "B", "N"], ["48.900", "50.433", "51.958"], "1:01.133"); 			
			//1 - 4
			createSequence(["N", "B", "V"], ["1:01.133", "1:02.658", "1:04.191"], "1:13.358");
			//LEVEL 2
			//2-1
			createSequence(["V", "C", "B", "V"], ["1:37.825", "1:38.585", "1:39.350", "1:40.875"], "1:50.050"); 			
			//2- 2
			createSequence(["V", "B", "N", "V"], ["1:50.050", "1:50.825", "1:51.600", "1:53.108"], "2:02.275"); 			
			//2 - 3
			createSequence(["V", "N", "B", "C", "V"], ["2:02.275", "2:03.033", "2:03.808", "2:04.650", "2:05.333"], "2:14.508");		
			//2 - 4
			createSequence(["V", "C", "B", "N", "V"], ["2:14.508", "2:15.300", "2:16.041", "2:16.858", "2:17.558"], "2:26.733");
			//LEVEL 3
			//3-1
			createSequence(["N", "B", "V", "V", "B", "N"], ["2:51.191", "2:51.958", "2:52.708", "2:54.250", "2:55.016", "2:55.775"], "3:03.425");
			//3- 2
			createSequence(["V", "C", "V", "N", "B", "V"], ["3:03.425", "3:04.200", "3:04.950", "3:06.491", "3:07.266", "3:08.033"], "3:15.650"); 	
			//3 - 3
			createSequence(["N", "B", "V", "B", "N", "N"], ["3:15.650", "3:16.425", "3:17.208", "3:17.983", "3:18.725", "3:20.241"], "3:27.883"); 			
			//3 - 4
			createSequence(["N", "B", "V", "B", "N", "V"], ["3:27.883", "3:28.658", "3:29.433", "3:30.208", "3:30.958", "3:32.466"], "3:40.125"); //FUCKED
		}
	}
}