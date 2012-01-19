package genres
{
	import songs.country.CountryDelight;
	import songs.country.CountryGroove;
	import songs.country.CountrySwing;

	public class Country extends Genre
	{
		public function Country()
		{
			playlist = [new CountrySwing(), new CountryDelight(), new CountryGroove()];
			name = "Country";
			directory = "genres/country/";
			assetDirectory = "Country.swf";
			animationIntro = "CountryIntro";
			animationFinish = "CountryFinish";
			animationStartLevel1 = "CountryStartLevel1";
			animationStartLevel2 = "CountryStartLevel2";
			animationStartLevel3 = "CountryStartLevel3";
			instrumentFrame = 315;
		}
	}
}