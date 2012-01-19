package songs.reggae
{
	import audio.AudioLibrary;
	
	import instruments.*;
	
	import songs.Song;
	
	public class ReggaeGroove extends Song
	{
		private const ASSET_LOCATION:String = "ReggaeGroove.swf"; 
		
		public function ReggaeGroove()
		{
			super(AudioLibrary.SONG_REGGAE_GROOVE, ASSET_LOCATION, [new Organ(), new Piano(), new Saxophone()]);
			name = "Reggae Groove";
			levelStartTimes = [getMillisecondsFromTime("10.650"), getMillisecondsFromTime("54.025"), getMillisecondsFromTime("1:36.425"), getMillisecondsFromTime("2:22.231")];
			//lEVEL 1
			//1-1
			createSequence(["B", "C"], ["14.208", "15.983"], "21.316"); 			
			//1- 2
			createSequence(["B", "V", "C"], ["21.316", "22.208", "23.091"], "28.433"); 			
			//1 - 3
			createSequence(["B", "N", "B"], ["28.433", "29.316", "30.208"], "35.541"); 			
			//1 - 4
			createSequence(["C", "V", "C"], ["35.541", "36.425", "37.316"], "42.191");
			//LEVEL 2
			//2-1
			createSequence(["B", "N", "B", "C"], ["56.875", "57.758", "58.650", "59.541"], "1:03.983"); 			
			//2- 2
			createSequence(["C", "V", "C", "B"], ["1:03.983", "1:04.875", "1:05.758", "1:06.650"], "1:11.100"); 			
			//2 - 3
			createSequence(["B", "N", "B", "V", "C"], ["1:11.100", "1:11.983", "1:12.875", "1:13.316", "1:13.758"], "1:18.208"); 			
			//2 - 4
			createSequence(["C", "V", "C", "V", "B"], ["1:18.208", "1:19.091", "1:19.983", "1:20.433", "1:20.891"], "1:24.858");
			//LEVEL 3
			//3-1
			createSequence(["C", "V", "B", "V", "B", "N"], ["1:39.550", "1:40.050", "1:40.383", "1:41.329", "1:41.712", "1:42.191"], "1:46.662");
			//3- 2
			createSequence(["B", "N", "B", "V", "B", "C"], ["1:46.662", "1:47.112", "1:47.556", "1:48.440", "1:48.856", "1:49.250"], "1:53.775"); 	
			//3 - 3
			createSequence(["B", "V", "B", "N", "V", "B"], ["1:53.775", "1:54.662", "1:55.066", "1:55.458", "1:55.994", "1:56.433"], "2:00.883"); 			
			//3 - 4
			createSequence(["C", "V", "B", "N", "B", "C"], ["2:00.883", "2:01.771", "2:02.029", "2:02.546", "2:03.204", "2:03.531"], "2:07.537"); //FUCKED
		}
	}
}