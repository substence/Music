package instruments
{
	import animation.AnimationLibrary;
	
	import audio.AudioLibrary;
	
	import cfg.Config;
	
	public class ElectricGuitar extends Instrument
	{
		public function ElectricGuitar()
		{
			name = "Electric Guitar";
			preSelectAnimation = AnimationLibrary.ELECTGUITAR_PRE_SELECT;
			postSelectAnimation = AnimationLibrary.ELECTGUITAR_POST_SELECT;
			buttonGraphic = AnimationLibrary.ELECTGUITAR_BUTTON;
			addNote(Config.NOTE_C, AudioLibrary.ELECTGUITAR_A);	
			addNote(Config.NOTE_V, AudioLibrary.ELECTGUITAR_B);			
			addNote(Config.NOTE_B, AudioLibrary.ELECTGUITAR_C);			
			addNote(Config.NOTE_N, AudioLibrary.ELECTGUITAR_D);
		}
	}
}