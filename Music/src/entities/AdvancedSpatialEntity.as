package entities
{
	import flash.display.MovieClip;
	
	import interfaces.IAdvancedSpatial;
	
	import math.Vector2D;
	
	public class AdvancedSpatialEntity extends VisibleEntity implements IAdvancedSpatial
	{
		protected var _speed:Number;
		protected var _velocity:Vector2D;
		private var _mass:Number;
		
		public function AdvancedSpatialEntity(graphic:MovieClip=null, position:Vector2D=null, speed:Number = 0, mass:Number = 1)
		{
			super(graphic, position, name);
			_speed = speed;
			_mass = mass;
			_velocity = new Vector2D();
		}

		public function get mass():Number
		{
			return _mass;
		}

		public function get velocity():Vector2D
		{
			return _velocity;
		}

		public function get speed():Number
		{
			return _speed;
		}
		
		override public function update():void
		{
			super.update();
			_velocity = _velocity.multiply(.9);
			_position = _position.add(_velocity);
		}

	}
}