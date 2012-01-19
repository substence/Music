package genres
{
	import animation.AnimationLibrary;
	
	import songs.salsa.CalienteSwing;
	import songs.salsa.SalsaDelite;
	import songs.salsa.SalsaGroove;

	public class Salsa extends Genre
	{
		public function Salsa()
		{
			playlist = [new CalienteSwing(), new SalsaDelite(), new SalsaGroove()];
			name = "Salsa";
			directory = "genres/salsa/";
			assetDirectory = "Salsa.swf";
			animationIntro = "SalsaIntro";
			//animationInstructions = AnimationLibrary.CHARACTERS_INSTRUCTIONS;
			//animationGetReady = AnimationLibrary.CHARACTERS_GET_READY;
			animationFinish = "SalsaFinish";
			animationStartLevel1 = "SalsaStartLevel1";
			animationStartLevel2 = "SalsaStartLevel2";
			animationStartLevel3 = "SalsaStartLevel3";
		}
	}
}