package interfaces
{
	import math.Vector2D;

	public interface IAdvancedSpatial extends ISpatial
	{
		function get speed():Number;
		function get velocity():Vector2D;
		function get mass():Number;
	}
}