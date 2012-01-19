package instruments
{
	import animation.AnimationLibrary;
	
	import audio.AudioLibrary;
	
	import cfg.Config;

	public class Organ extends Instrument
	{
		public function Organ()
		{
			name = "Organ";
			preSelectAnimation = AnimationLibrary.ORGAN_PRE_SELECT;
			postSelectAnimation = AnimationLibrary.ORGAN_POST_SELECT;
			buttonGraphic = AnimationLibrary.ORGAN_BUTTON;
			addNote(Config.NOTE_C, AudioLibrary.ORGAN_C);	
			addNote(Config.NOTE_V, AudioLibrary.ORGAN_V);			
			addNote(Config.NOTE_B, AudioLibrary.ORGAN_B);			
			addNote(Config.NOTE_N, AudioLibrary.ORGAN_N);			
		}
	}
}