package entities
{
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.sampler._getInvocationCount;
	
	import interfaces.IDrawable;
	import interfaces.ISpatial;
	
	import math.Vector2D;
	
	public class VisibleEntity extends Entity implements IDrawable, ISpatial
	{
		protected var _graphic:MovieClip;
		protected var _position:Vector2D;
		
		public function VisibleEntity(graphic:MovieClip = null, position:Vector2D = null, name:String = null)
		{
			_graphic = graphic;
			if (!position)
				position = new Vector2D();
			_position = position;
			super(name);
		}
		
		public function get graphic():MovieClip
		{
			return _graphic;
		}
		
		public function set graphic(value:MovieClip):void
		{
			_graphic = value;
		}
		
		public function get x():Number
		{
			return _position.x;
		}
		
		public function get y():Number
		{
			return _position.y;
		}
		
		public function get position():Vector2D
		{
			return _position;
		}
		
		override public function update():void
		{
			draw(); //we'll leave this here for now
			super.update();
		}
		
		public function draw():void
		{
			if (_graphic)
			{
				_graphic.x = x;
				_graphic.y = y;
			}
		}
	}
}