package entities
{
    import flash.events.Event;
    import flash.events.EventDispatcher;
    
    import interfaces.*;

    public class Entity extends EventDispatcher implements IEntity
    {
        public static const ENTITY_DESTROYED:String = "entityDestroyed";
        private var _behaviors:Array;
        private var _name:String;
        private var _isPaused:Boolean;

        public function Entity(name:String = null)
        {
            initialize(name);
        }

        public function get name():String
        {
            return _name;
        }

        public function initialize(name:String = null):void
        {
            _name = name;
            //EntityNames.addEntity(this, name);
            _behaviors = new Array();
        }

        public function destroy():void
        {
            dispatchEvent(new Event(ENTITY_DESTROYED));
            // EntityNames.removeEntity(this);
            _name = null;
            for (var i:int = 0; i < _behaviors.length; ++i)
            {
                _behaviors[i].unregister();
            }
        }

        public function addBehavior(behavior:IBehavior, name:String = "", priority:Number = 0):Boolean
        {
            if (behavior.owner || getBehaviorByName(name) != null)
                return false;
            if (name == "" || name == null)
            {
                trace("Warning: You are trying to add a behavior with an invalid name, a default name has been given");
                name = String(behavior);
            }
            var position:int = -1;
            for (var i:int = 0; i < _behaviors.length; ++i)
            {
                if (_behaviors[i].priority < priority)
                {
                    position = i;
                    break;
                }
            }
            if (position < 0 || position >= _behaviors.length)
                _behaviors.push(behavior);
            else
                _behaviors.splice(position, 0, behavior);
            behavior.register(this, name);
            return true;
        }

        public function removeBehavior(behavior:IBehavior):Boolean
        {
            if (!behavior.isRegistered || behavior.owner != this)
                return false;
            var index:int = _behaviors.indexOf(behavior);
            if (index < 0)
                return false
            behavior.unregister();
            _behaviors.splice(index, 1);
            return true;
        }

        public function getBehaviorByType(behaviorType:Class):IBehavior
        {
            for (var i:int = 0; i < _behaviors.length; ++i)
            {
                if (_behaviors[i] is behaviorType)
                    return _behaviors[i];
            }
            return null;
        }

        public function getAllBehaviorsByType(behaviorType:Class):Array
        {
            var behaviorsOfType:Array = new Array();
            for (var i:int = 0; i < _behaviors.length; ++i)
            {
                if (_behaviors[i] is behaviorType)
                    behaviorsOfType.push(_behaviors[i]);
            }
            return behaviorsOfType;
        }

        public function getBehaviorByName(name:String):IBehavior
        {
            for (var i:int = 0; i < _behaviors.length; ++i)
            {
                if (_behaviors[i].name == name)
                    return _behaviors[i];
            }
            return null;
        }

        override public function toString():String
        {
            return "<Entity: name = " + _name + ">";
        }

        public function get isPaused():Boolean
        {
            return _isPaused;
        }

        public function set isPaused(value:Boolean):void
        {
            _isPaused = value;
        }

        public function update():void
        {
			for (var i:int = 0; i < _behaviors.length; ++i)
			{
				var behavior:IBehavior = _behaviors[i];
				if (behavior is IUpdatable)
					IUpdatable(behavior).update();
			}			
        }
    }
}