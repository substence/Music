package instruments
{
	import animation.AnimationLibrary;
	
	import audio.AudioLibrary;
	
	import cfg.Config;
	
	public class Synth extends Instrument
	{
		public function Synth()
		{
			name = "Synthesizer";
			preSelectAnimation = AnimationLibrary.SYNTH_PRE_SELECT;
			postSelectAnimation = AnimationLibrary.SYNTH_POST_SELECT;
			buttonGraphic = AnimationLibrary.SYNTH_BUTTON;
			addNote(Config.NOTE_C, AudioLibrary.SYNTH_C);	
			addNote(Config.NOTE_V, AudioLibrary.SYNTH_V);			
			addNote(Config.NOTE_B, AudioLibrary.SYNTH_B);			
			addNote(Config.NOTE_N, AudioLibrary.SYNTH_N);
		}
	}
}