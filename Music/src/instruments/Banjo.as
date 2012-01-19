package instruments
{
	import animation.AnimationLibrary;
	
	import audio.AudioLibrary;
	
	import cfg.Config;
	
	public class Banjo extends Instrument
	{
		public function Banjo()
		{
			name = "Banjo";
			preSelectAnimation = AnimationLibrary.BANJO_PRE_SELECT;
			postSelectAnimation = AnimationLibrary.BANJO_POST_SELECT;
			buttonGraphic = AnimationLibrary.BANJO_BUTTON;
			addNote(Config.NOTE_C, AudioLibrary.BANJO_C);	
			addNote(Config.NOTE_V, AudioLibrary.BANJO_V);			
			addNote(Config.NOTE_B, AudioLibrary.BANJO_B);			
			addNote(Config.NOTE_N, AudioLibrary.BANJO_N);
		}
	}
}