package instruments
{
	import animation.AnimationLibrary;
	
	import audio.AudioLibrary;
	
	import cfg.Config;
	
	public class ElectricPiano extends Instrument
	{
		public function ElectricPiano()
		{
			name = "Electric Piano";
			preSelectAnimation = AnimationLibrary.ELECTPIANO_PRE_SELECT;
			postSelectAnimation = AnimationLibrary.ELECTPIANO_POST_SELECT;
			buttonGraphic = AnimationLibrary.ELECTPIANO_BUTTON;
			addNote(Config.NOTE_C, AudioLibrary.ELECTPIANO_C);	
			addNote(Config.NOTE_V, AudioLibrary.ELECTPIANO_V);			
			addNote(Config.NOTE_B, AudioLibrary.ELECTPIANO_B);			
			addNote(Config.NOTE_N, AudioLibrary.ELECTPIANO_N);
		}
	}
}