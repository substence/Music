package instruments
{
	import animation.AnimationLibrary;
	
	import audio.AudioLibrary;
	
	import cfg.Config;

	public class Saxophone extends Instrument
	{
		public function Saxophone()
		{
			name = "Saxophone";
			preSelectAnimation = AnimationLibrary.SAX_PRE_SELECT;
			postSelectAnimation = AnimationLibrary.SAX_POST_SELECT;
			buttonGraphic = AnimationLibrary.SAX_BUTTON;
			addNote(Config.NOTE_C, AudioLibrary.SAXOPHONE_C);	
			addNote(Config.NOTE_V, AudioLibrary.SAXOPHONE_V);			
			addNote(Config.NOTE_B, AudioLibrary.SAXOPHONE_B);			
			addNote(Config.NOTE_N, AudioLibrary.SAXOPHONE_N);
		}
	}
}