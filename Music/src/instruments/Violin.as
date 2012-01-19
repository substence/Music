package instruments
{
	import animation.AnimationLibrary;
	
	import audio.AudioLibrary;
	
	import cfg.Config;

	public class Violin extends Instrument
	{
		public function Violin()
		{
			name = "Violin";
			preSelectAnimation = AnimationLibrary.VIOLIN_PRE_SELECT;
			postSelectAnimation = AnimationLibrary.VIOLIN_POST_SELECT;
			buttonGraphic = AnimationLibrary.VIOLIN_BUTTON;
			addNote(Config.NOTE_C, AudioLibrary.VIOLIN_A);	
			addNote(Config.NOTE_V, AudioLibrary.VIOLIN_B);			
			addNote(Config.NOTE_B, AudioLibrary.VIOLIN_C);			
			addNote(Config.NOTE_N, AudioLibrary.VIOLIN_G);
		}
	}
}