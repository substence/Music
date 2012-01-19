package interfaces
{
    public interface IPausable extends IUpdatable
    {
        function get isPaused():Boolean;
        function set isPaused(value:Boolean):void;
    }
}