package songs.reggae
{
	import audio.AudioLibrary;
	
	import instruments.Guitar;
	import instruments.Saxophone;
	import instruments.Trombone;
	
	import songs.Song;
	
	public class ReggaeSwing extends Song
	{
		private const ASSET_LOCATION:String = "ReggaeSwing.swf"; 
		
		public function ReggaeSwing()
		{
			super(AudioLibrary.SONG_REGGAE_SWING, ASSET_LOCATION, [new Saxophone(), new Guitar(), new Trombone()]);
			name = "Reggae Swing";
			levelStartTimes = [getMillisecondsFromTime("8.608"), getMillisecondsFromTime("53.550"), getMillisecondsFromTime("1:42.187"), getMillisecondsFromTime("2:26.291")];
			//lEVEL 1
			//1-1
			createSequence(["N", "N"], ["17.266", "19.183"], "24.950"); 			
			//1- 2
			createSequence(["B", "C"], ["24.950", "26.875"], "32.625"); 			
			//1 - 3
			createSequence(["B", "V", "C"], ["32.625", "33.591", "34.550"], "40.308"); 			
			//1 - 4
			createSequence(["V", "B", "N"], ["40.308", "41.266", "42.225"], "47.308");
			//LEVEL 2
			//2-1
			createSequence(["N", "B", "V", "C"], ["1:03.341", "1:04.300", "1:05.266", "1:06.225"], "1:11.025"); 			
			//2- 2
			createSequence(["C", "V", "B", "N"], ["1:11.025", "1:11.991", "1:12.950", "1:13.908"], "1:18.708"); 			
			//2 - 3
			createSequence(["C", "V", "C", "B", "C"], ["1:18.708", "1:19.666", "1:20.150", "1:20.637", "1:21.587"], "1:26.394"); 			
			//2 - 4
			createSequence(["N", "B", "N", "V", "C"], ["1:26.394", "1:27.350", "1:27.850", "1:28.337", "1:29.269"], "1:33.297");
			//LEVEL 3
			//3-1
			createSequence(["C", "V", "B", "C", "V", "B"], ["1:49.431", "1:49.919", "1:50.425", "1:51.350", "1:51.837", "1:52.319"], "1:57.112");
			//3- 2
			createSequence(["C", "B", "V", "C", "B"], ["1:57.112", "1:58.075", "1:58.541", "1:59.050", "1:59.983"], "2:04.783"); 	
			//3 - 3
			createSequence(["B", "V", "C", "V", "B"], ["2:04.783", "2:05.741", "2:06.708", "2:07.183", "2:07.708"], "2:12.466"); 			
			//3 - 4
			createSequence(["B", "N", "B", "V", "B", "C"], ["2:12.466", "2:12.966", "2:13.458", "2:13.900", "2:14.391", "2:15.341"], "2:19.472"); 
		}
	}
}