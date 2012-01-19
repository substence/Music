package entities
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	
	import interfaces.IUserInterface;
	
	public class UIEntity extends Entity implements IUserInterface
	{
		protected var _screen:MovieClip;
		
		public function UIEntity(graphic:MovieClip)
		{
			_screen = graphic;
			super(null);
		}
		
		public function added():void
		{
		}
		
		public function removed():void
		{
		}
		
		public function get graphic():DisplayObject
		{
			return _screen;
		}
	}
}