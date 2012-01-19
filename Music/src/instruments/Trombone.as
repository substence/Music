package instruments
{
	import animation.AnimationLibrary;
	
	import audio.AudioLibrary;
	
	import cfg.Config;

	public class Trombone extends Instrument
	{
		public function Trombone()
		{
			name = "Trombone";
			preSelectAnimation = AnimationLibrary.TROMBONE_PRE_SELECT;
			postSelectAnimation = AnimationLibrary.TROMBONE_POST_SELECT;
			buttonGraphic = AnimationLibrary.TROMBONE_BUTTON;
			addNote(Config.NOTE_C, AudioLibrary.TROMBONE_C);	
			addNote(Config.NOTE_V, AudioLibrary.TROMBONE_V);			
			addNote(Config.NOTE_B, AudioLibrary.TROMBONE_B);			
			addNote(Config.NOTE_N, AudioLibrary.TROMBONE_N);
		}
	}
}