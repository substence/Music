package interfaces
{
    import flash.display.DisplayObjectContainer;
    import flash.display.MovieClip;

    public interface IDrawable
    {
        function get graphic():MovieClip;
        function set graphic(value:MovieClip):void;
        function draw():void;
    }
}