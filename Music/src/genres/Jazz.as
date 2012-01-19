package genres
{
	import songs.jazz.JazzDelight;
	import songs.jazz.JazzGroove;
	import songs.jazz.JazzSwing;

	public class Jazz extends Genre
	{
		public function Jazz()
		{
			playlist = [new JazzSwing(), new JazzDelight(), new JazzGroove()];
			name = "Jazz";
			directory = "genres/jazz/";
			assetDirectory = "Jazz.swf";
			animationIntro = "JazzIntro";
			//animationInstructions = AnimationLibrary.CHARACTERS_INSTRUCTIONS;
			//animationGetReady = AnimationLibrary.CHARACTERS_GET_READY;
			animationFinish = "JazzFinish";
			animationStartLevel1 = "JazzStartLevel1";
			animationStartLevel2 = "JazzStartLevel2";
			animationStartLevel3 = "JazzStartLevel3";
		}
	}
}