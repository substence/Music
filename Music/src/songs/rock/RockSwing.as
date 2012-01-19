package songs.rock
{
	import audio.AudioLibrary;
	
	import instruments.ElectricGuitar;
	import instruments.Organ;
	import instruments.Piano;
	
	import songs.Song;
	
	public class RockSwing extends Song
	{
		private const ASSET_LOCATION:String = "RockSwing.swf"; 
		
		public function RockSwing()
		{
			super(AudioLibrary.SONG_ROCK_SWING, ASSET_LOCATION, [new Piano(), new Organ(), new ElectricGuitar()]);
			name = "Rock Swing";
			levelStartTimes = [getMillisecondsFromTime("8.983"), getMillisecondsFromTime("01:01.425"), getMillisecondsFromTime("01:44.908"), getMillisecondsFromTime("02:38.766")];
			//lEVEL 1
			//1-1
			createSequence(["C", "C"], ["17.858", "19.950"], "26.216"); 			
			//1- 2
			createSequence(["B", "V", "C"], ["26.216", "27.250", "28.300"], "34.550"); 			
			//1 - 3
			createSequence(["B", "N", "B", "C"], ["34.550", "35.591", "36.641", "37.691"], "42.900"); 		
			//1 - 4
			createSequence(["B", "V", "C", "C"], ["42.900", "43.950", "44.991", "46.041"], "54.900");
			//LEVEL 2
			//2-1
			createSequence(["C", "B", "V", "N"], ["01:07.950", "01:08.991", "01:10.033", "01:11.075"], "01:16.291"); 			
			//2- 2
			createSequence(["B", "N", "B", "V", "C"], ["01:16.291", "01:17.341", "01:17.858", "01:18.391", "01:19.425"], "01:24.641"); 			
			//2 - 3
			createSequence(["B", "V", "B", "N", "V", "B"], ["01:24.641", "01:25.683", "01:26.216", "01:26.725", "01:27.258", "01:27.775"], "01:32.991"); 			
			//2 - 4
			createSequence(["B", "V", "N", "B", "V", "C"], ["01:32.991", "01:34.033", "01:34.558", "01:35.083", "01:35.591", "01:36.133"], "01:44.908");
			//LEVEL 3
			//3-1
			createSequence(["B", "C", "V", "B", "C", "V"], ["01:58.041", "01:58.558", "01:59.066", "02:00.116", "02:00.650", "02:01.166"], "02:06.383");
			//3- 2
			createSequence(["B", "B", "V", "B", "C", "B"], ["02:06.383", "02:07.425", "02:07.941", "02:08.475", "02:08.991", "02:09.516"], "02:14.733"); 	
			//3 - 3
			createSequence(["B", "V", "B", "N", "V", "B"], ["02:14.733", "02:15.766", "02:16.300", "02:16.825", "02:17.333", "02:17.866"], "02:23.075"); 			
			//3 - 4
			createSequence(["B", "N", "V", "B", "V", "C"], ["02:23.075", "02:23.591", "02:24.125", "02:25.166", "02:25.683", "02:26.216"], "02:33.208"); 
		}
	}
}