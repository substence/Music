package instruments
{
	import animation.AnimationLibrary;
	
	import audio.AudioLibrary;
	
	import cfg.Config;
	
	public class Fiddle extends Instrument
	{
		public function Fiddle()
		{
			name = "Fiddle";
			preSelectAnimation = AnimationLibrary.FIDDLE_PRE_SELECT;
			postSelectAnimation = AnimationLibrary.FIDDLE_POST_SELECT;
			buttonGraphic = AnimationLibrary.FIDDLE_BUTTON;
			addNote(Config.NOTE_C, AudioLibrary.FIDDLE_C);	
			addNote(Config.NOTE_V, AudioLibrary.FIDDLE_V);			
			addNote(Config.NOTE_B, AudioLibrary.FIDDLE_B);			
			addNote(Config.NOTE_N, AudioLibrary.FIDDLE_N);
		}
	}
}