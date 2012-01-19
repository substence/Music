package behaviors
{
	import events.AnimationEvent;
	
	import flash.display.MovieClip;
	import flash.events.EventDispatcher;
	
	import interfaces.IUpdatable;

	public class Animation extends EventDispatcher implements IUpdatable
	{
		public var type:Class;
		public var label:String;
		public var graphic:MovieClip;
		
		public function Animation(type:Class, label:String)
		{
			this.type = type;
			this.label = label;
		}
		
		public function activate():void
		{
			graphic = new type();
			reset();
		}
		
		public function deactivate():void
		{
			graphic = null;
		}
		
		public function reset():void
		{
			graphic.gotoAndStop(label);
		}
		
		public function update():void
		{
			graphic.nextFrame();
			if (graphic.currentLabel != label || graphic.currentFrame >= graphic.totalFrames)
				animationComplete();
		}
		
		private function animationComplete():void
		{
			dispatchEvent(new AnimationEvent(AnimationEvent.ANIMATION_CYCLE_COMPLETE, this));
		}
	}
}