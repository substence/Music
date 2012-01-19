package songs.reggae
{
	import audio.AudioLibrary;
	
	import instruments.Organ;
	import instruments.Saxophone;
	import instruments.Trumpet;
	
	import songs.Song;
	
	public class ReggaeDelight extends Song
	{
		private const ASSET_LOCATION:String = "ReggaeDelight.swf"; 
		
		public function ReggaeDelight()
		{
			super(AudioLibrary.SONG_REGGAE_DELIGHT, ASSET_LOCATION, [new Organ(), new Saxophone(), new Trumpet()]);
			name = "Reggae Delight";
			levelStartTimes = [getMillisecondsFromTime("13.733"), getMillisecondsFromTime("1:20.812"), getMillisecondsFromTime("2:27.462"), getMillisecondsFromTime("3:52.500")];
			//lEVEL 1
			//1-1
			createSequence(["N", "N"], ["23.841", "26.733"], "35.412"); 			
			//1- 2
			createSequence(["V", "C"], ["35.412", "38.304"], "46.979"); 			
			//1 - 3
			createSequence(["C", "V", "N"], ["46.979", "48.425", "49.866"], "58.546"); 			
			//1 - 4
			createSequence(["V", "B", "N"], ["58.546", "59.991", "1:01.437"], "1:08.904");
			//LEVEL 2
			//2-1
			createSequence(["N", "V", "B", "C"], ["1:33.241", "1:34.687", "1:36.133", "1:37.583"], "1:44.812"); 			
			//2- 2
			createSequence(["C", "V", "B", "N"], ["1:44.812", "1:46.258", "1:47.704", "1:49.146"], "1:56.375"); 			
			//2 - 3
			createSequence(["B", "V", "C", "N", "V"], ["1:56.375", "1:57.104", "1:57.825", "1:59.266", "2:00.712"], "2:07.941"); 			
			//2 - 4
			createSequence(["C", "V", "B", "V", "B", "N"], ["2:07.941", "2:08.679", "2:09.433", "2:10.837", "2:11.616", "2:12.304"], "2:18.316");
			//LEVEL 3
			//3-1
			createSequence(["N", "V", "B", "B", "C", "V"], ["2:42.641", "2:43.362", "2:44.087", "2:45.533", "2:46.171", "2:46.979"], "2:54.208");
			//3- 2
			createSequence(["V", "N", "B", "V", "B", "N"], ["2:54.208", "2:54.929", "2:55.654", "2:57.100", "2:57.821", "2:58.546"], "3:05.775"); 	
			//3 - 3
			createSequence(["V", "B", "V", "C", "V", "C"], ["3:05.775", "3:06.496", "3:07.221", "3:08.666", "3:09.387", "3:10.112"], "3:17.337"); 			
			//3 - 4
			createSequence(["V", "N", "C", "V", "B", "N"], ["3:17.337", "3:18.783", "3:19.508", "3:20.229", "3:20.954", "3:21.679"], "3:27.410"); //FUCKED
		}
	}
}