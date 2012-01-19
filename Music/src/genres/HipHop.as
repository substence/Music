package genres
{
	import songs.hiphop.HipHopDelight;
	import songs.hiphop.HipHopGroove;
	import songs.hiphop.HipHopSwing;

	public class HipHop extends Genre
	{
		public function HipHop()
		{
			playlist = [new HipHopSwing(), new HipHopDelight(), new HipHopGroove()];
			name = "HipHop";
			directory = "genres/hiphop/";
			assetDirectory = "HipHop.swf";
			animationIntro = "HipHopIntro";
			//animationInstructions = AnimationLibrary.CHARACTERS_INSTRUCTIONS;
			//animationGetReady = AnimationLibrary.CHARACTERS_GET_READY;
			animationFinish = "HipHopFinish";
			animationStartLevel1 = "HipHopStartLevel1";
			animationStartLevel2 = "HipHopStartLevel2";
			animationStartLevel3 = "HipHopStartLevel3";
		}
	}
}