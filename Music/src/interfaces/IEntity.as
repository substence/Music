package interfaces
{
    public interface IEntity extends IPausable, IDestroyable
    {
        function get name():String;
        function initialize(name:String = null):void;
        function addBehavior(behavior:IBehavior, name:String = "", priority:Number = 0):Boolean;
        function removeBehavior(behavior:IBehavior):Boolean;
        function getBehaviorByType(behaviorType:Class):IBehavior;
        function getAllBehaviorsByType(behaviorType:Class):Array;
        function getBehaviorByName(name:String):IBehavior;
    }
}