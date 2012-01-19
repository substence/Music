package instruments
{
	import animation.AnimationLibrary;
	
	import audio.AudioLibrary;
	
	import cfg.Config;

	public class Trumpet extends Instrument
	{
		public function Trumpet()
		{
			name = "Trumpet";
			preSelectAnimation = AnimationLibrary.TRUMPET_PRE_SELECT;
			postSelectAnimation = AnimationLibrary.TRUMPET_POST_SELECT;
			buttonGraphic = AnimationLibrary.TRUMPET_BUTTON;
			addNote(Config.NOTE_C, AudioLibrary.TRUMPET_C);	
			addNote(Config.NOTE_V, AudioLibrary.TRUMPET_V);			
			addNote(Config.NOTE_B, AudioLibrary.TRUMPET_B);			
			addNote(Config.NOTE_N, AudioLibrary.TRUMPET_N);	
		}
	}
}