package instruments
{
	import animation.AnimationLibrary;
	
	import audio.AudioLibrary;
	
	import cfg.Config;

	public class Guitar extends Instrument
	{
		public function Guitar()
		{
			name = "Guitar";
			preSelectAnimation = AnimationLibrary.GUITAR_PRE_SELECT;
			postSelectAnimation = AnimationLibrary.GUITAR_POST_SELECT;
			buttonGraphic = AnimationLibrary.GUITAR_BUTTON;
			addNote(Config.NOTE_C, AudioLibrary.GUITAR_C);	
			addNote(Config.NOTE_V, AudioLibrary.GUITAR_V);			
			addNote(Config.NOTE_B, AudioLibrary.GUITAR_B);			
			addNote(Config.NOTE_N, AudioLibrary.GUITAR_N);			
		}
	}
}