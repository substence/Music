package instruments
{
	import animation.AnimationLibrary;
	
	import audio.AudioLibrary;
	
	import cfg.Config;

	public class Oboe extends Instrument
	{
		public function Oboe()
		{
			name = "Oboe";
			preSelectAnimation = AnimationLibrary.OBOE_PRE_SELECT;
			postSelectAnimation = AnimationLibrary.OBOE_POST_SELECT;
			buttonGraphic = AnimationLibrary.OBOE_BUTTON;
			addNote(Config.NOTE_C, AudioLibrary.OBOE_A);	
			addNote(Config.NOTE_V, AudioLibrary.OBOE_B);			
			addNote(Config.NOTE_B, AudioLibrary.OBOE_C);			
			addNote(Config.NOTE_N, AudioLibrary.OBOE_G);			
		}
	}
}