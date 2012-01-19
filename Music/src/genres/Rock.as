package genres
{
	import songs.rock.RockDelight;
	import songs.rock.RockGroove;
	import songs.rock.RockSwing;

	public class Rock extends Genre
	{
		public function Rock()
		{
			playlist = [new RockSwing(), new RockDelight(), new RockGroove()];
			name = "Rock";
			directory = "genres/rock/";
			assetDirectory = "Rock.swf";
			animationIntro = "RockIntro";
			animationFinish = "RockFinish";
			animationStartLevel1 = "RockStartLevel1";
			animationStartLevel2 = "RockStartLevel2";
			animationStartLevel3 = "RockStartLevel3";
			instrumentFrame = 320;
			fontSize = 28;
		}
	}
}