package genres
{
	import songs.reggae.ReggaeDelight;
	import songs.reggae.ReggaeGroove;
	import songs.reggae.ReggaeSwing;

	public class Reggae extends Genre
	{
		public function Reggae()
		{
			playlist = [new ReggaeSwing(), new ReggaeDelight(), new ReggaeGroove()];
			name = "Reggae";
			directory = "genres/reggae/";
			assetDirectory = "Reggae.swf";
			animationIntro = "ReggaeIntro";
			instrumentFrame = 296;
			//animationInstructions = AnimationLibrary.CHARACTERS_INSTRUCTIONS;
			//animationGetReady = AnimationLibrary.CHARACTERS_GET_READY;
			animationFinish = "ReggaeFinish";
			animationStartLevel1 = "ReggaeStartLevel1";
			animationStartLevel2 = "ReggaeStartLevel2";
			animationStartLevel3 = "ReggaeStartLevel3";
		}
	}
}