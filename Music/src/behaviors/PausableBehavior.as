package behaviors
{
import interfaces.IPausable;

public class PausableBehavior extends Behavior implements IPausable
{
    private var _isPaused:Boolean;

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

    }

    override protected function onAdd():void
    {
        //UpdateModule.getInstance().addUpdatee(this);
    }

    override protected function onRemove():void
    {
        //UpdateModule.getInstance().removeUpdatee(this);
    }
}
}