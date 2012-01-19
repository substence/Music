package songs.rock
{
	import audio.AudioLibrary;
	
	import instruments.ElectricGuitar;
	import instruments.Guitar;
	import instruments.Organ;
	import instruments.Piano;
	
	import songs.Song;
	
	public class RockGroove extends Song
	{
		private const ASSET_LOCATION:String = "RockGroove.swf"; 
		
		public function RockGroove()
		{
			super(AudioLibrary.SONG_ROCK_GROOVE, ASSET_LOCATION, [new Guitar(), new Organ(), new ElectricGuitar()]);
			name = "RockGroove";
			levelStartTimes = [getMillisecondsFromTime("17.425"), getMillisecondsFromTime("58.275"), getMillisecondsFromTime("01:39.000"), getMillisecondsFromTime("2:25.212")];
			//lEVEL 1
			//1-1
			createSequence(["B", "C"], ["20.425", "22.106"], "27.212"); 			
			//1- 2
			createSequence(["C", "V", "B"], ["27.212", "28.094", "28.931"], "34.037"); 			
			//1 - 3
			createSequence(["B", "V", "B", "C"], ["34.037", "34.462", "34.887", "35.725"], "40.831"); 		
			//1 - 4
			createSequence(["C", "V", "C", "B"], ["40.831", "41.275", "41.687", "42.544"], "52.687");
			//LEVEL 2
			//2-1
			createSequence(["B", "V", "V", "C"], ["1:01.275", "1:01.669", "1:02.550", "1:02.962"], "1:07.062"); 			
			//2- 2
			createSequence(["C", "V", "V", "B", "C"], ["1:08.062", "1:08.500", "1:09.356", "1:09.781", "1:10.619"], "1:14.875"); 			
			//2 - 3
			createSequence(["C", "V", "C", "B", "N", "B"], ["1:14.875", "1:15.319", "1:15.725", "1:16.594", "1:16.987", "1:17.444"], "1:21.694"); 			
			//2 - 4
			createSequence(["B", "V", "B", "C", "V", "C"], ["1:21.694", "1:22.131", "1:22.556", "1:23.381", "1:23.831", "1:24.237"], "1:33.531");
			//LEVEL 3
			//3-1
			createSequence(["B", "V", "C", "V", "C", "B"], ["1:42.125", "1:42.525", "1:42.962", "1:43.400", "1:43.819", "1:44.675"], "1:48.919");
			//3- 2
			createSequence(["C", "C", "V", "B", "V", "C"], ["1:48.919", "1:49.769", "1:50.212", "1:50.637", "1:51.031", "1:51.475"], "1:55.731"); 	
			//3 - 3
			createSequence(["C", "B", "N", "V", "B", "C"], ["1:55.731", "1:56.162", "1:56.562", "1:57.019", "1:57.444", "1:58.275"], "2:02.544"); 			
			//3 - 4
			createSequence(["B", "V", "V", "B", "V", "C"], ["2:02.544", "2:02.950", "2:03.825", "2:04.250", "2:04.644", "2:05.094"], "2:10.719"); 
		}
	}
}