package utils.sceneHandler
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	public class SceneLayer
	{					
		public var index:int;
		public var damping:Number;		
		public var canvas:Sprite;		
		
		public function SceneLayer(index:int = 0, damping:Number = 1, canvas:Sprite = null)
		{
			this.damping = damping;
			this.canvas = !canvas ? new Sprite() : canvas;
			this.index = index;
		}
		
		public function addChild(displayObject:DisplayObject):DisplayObject
		{
			return canvas.addChild(displayObject);
		}
		
		public function clearCanvas():void
		{
			canvas = new Sprite();
		}
	}
}