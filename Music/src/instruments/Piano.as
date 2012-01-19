package instruments
{
	import animation.AnimationLibrary;
	
	import audio.AudioLibrary;
	
	import cfg.Config;

	public class Piano extends Instrument
	{
		public function Piano()
		{
			name = "Piano";
			buttonGraphic = AnimationLibrary.PIANO_BUTTON;
			preSelectAnimation = AnimationLibrary.PIANO_PRE_SELECT;
			postSelectAnimation = AnimationLibrary.PIANO_POST_SELECT;
			addNote(Config.NOTE_C, AudioLibrary.PIANO_A);	
			addNote(Config.NOTE_V, AudioLibrary.PIANO_B);			
			addNote(Config.NOTE_B, AudioLibrary.PIANO_C);			
			addNote(Config.NOTE_N, AudioLibrary.PIANO_D);
		}
	}
}