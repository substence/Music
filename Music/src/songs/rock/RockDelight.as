package songs.rock
{
	import audio.AudioLibrary;
	
	import instruments.ElectricGuitar;
	import instruments.Organ;
	import instruments.Piano;
	
	import songs.Song;
	
	public class RockDelight extends Song
	{
		private const ASSET_LOCATION:String = "RockDelight.swf"; 
		
		public function RockDelight()
		{
			super(AudioLibrary.SONG_ROCK_DELIGHT, ASSET_LOCATION, [new ElectricGuitar(), new Organ(), new Piano()]);
			name = "Rock Delight";
			levelStartTimes = [getMillisecondsFromTime("14.283"), getMillisecondsFromTime("01:08.031"), getMillisecondsFromTime("01:59.656"), getMillisecondsFromTime("02:48.275")];
			//lEVEL 1
			//1-1
			createSequence(["B", "C"], ["23.991", "25.858"], "31.391"); 			
			//1- 2
			createSequence(["B", "V", "C"], ["31.391", "32.308", "33.233"], "38.766"); 			
			//1 - 3
			createSequence(["C", "B", "N", "C"], ["38.766", "39.700", "40.616", "41.550"], "46.166"); 			
			//1 - 4
			createSequence(["B", "V", "N", "B"], ["46.166", "47.066", "48.000", "48.933"], "59.219");
			//LEVEL 2
			//2-1
			createSequence(["B", "V", "C", "B"], ["01:15.687", "01:16.616", "01:17.550", "01:18.466"], "01:23.091"); 			
			//2- 2
			createSequence(["B", "V", "B", "C", "C"], ["01:23.091", "01:23.541", "01:24.000", "01:24.941", "01:25.850"], "01:30.475"); 			
			//2 - 3
			createSequence(["C", "B", "N", "B", "V", "C"], ["01:30.475", "01:31.391", "01:31.850", "01:32.325", "01:32.791", "01:33.250"], "01:37.858"); 			
			//2 - 4
			createSequence(["B", "V", "B", "N", "B", "C"], ["01:37.858", "01:38.766", "01:39.012", "01:39.233", "01:39.683", "01:40.625"], "01:51.594");
			//LEVEL 3
			//3-1
			createSequence(["B", "V", "C", "N", "B", "C"], ["02:07.400", "02:07.875", "02:08.333", "02:09.233", "02:09.708", "02:10.175"], "02:14.775");
			//3- 2
			createSequence(["B", "B", "V", "C", "V", "C"], ["02:14.775", "02:15.708", "02:16.175", "02:16.633", "02:17.225", "02:17.566"], "02:22.175"); 	
			//3 - 3
			createSequence(["C", "V", "B", "N", "B", "C"], ["02:22.175", "02:22.633", "02:23.100", "02:23.541", "02:24.025", "02:24.933"], "02:29.558"); 			
			//3 - 4
			createSequence(["B", "V", "B", "C", "C"], ["02:29.558", "02:30.466", "02:30.991", "02:31.441", "02:31.441"], "02:39.625"); //FUCKED
		}
	}
}