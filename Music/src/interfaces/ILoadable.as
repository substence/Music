package interfaces
{
	import flash.display.Loader;

	public interface ILoadable
	{
		function get loader():Loader;
		function load():Loader;
	}
}