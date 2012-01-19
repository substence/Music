package behaviors
{
	import entities.Entity;
	
	import interfaces.IBehavior;
	import interfaces.IEntity;
	import interfaces.IUpdatable;

	public class Behavior implements IBehavior
	{
		protected var _owner:Entity;
		private var _name:String;
		private var _priority:Number = 0;
		
		public function get priority():Number
		{
			return _priority;
		}
		
		public function set priority(value:Number):void
		{
			_priority = value;
		}
		
		public function get owner():Entity
		{
			return _owner;
		}
		
		public function get name():String
		{
			return _name;
		}
		
		public function get isRegistered():Boolean
		{
			return _owner != null;
		}
		
		public function register(owner:Entity, name:String):void
		{
			if (isRegistered)
			{
				trace("WARNING: Trying to register an already-registered behavior");
			}
			_name = name;
			_owner = owner;
			onAdd();
		}
		
		public function unregister():void
		{
			if (!isRegistered)
			{
				trace("WARNING: Trying to unregister an unregistered behavior");
			}
			onRemove();
			_owner = null;
			_name = null;
		}
		
		public function reset():void
		{
			onReset();
		}
		
		protected function onAdd():void
		{
		}
		
		protected function onRemove():void
		{
		}
		
		protected function onReset():void
		{
		}
	}
}