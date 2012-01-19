package math
{

public class Vector2D
{
    private var _x:Number;
    private var _y:Number;

    public function Vector2D(x:Number = 0, y:Number = 0)
    {
        _x = x;
        _y = y;
    }

    public static function getAngleBetween(v1:Vector2D, v2:Vector2D):Number
    {
        return 0;
    }

    public function set angle(angle:Number):void
    {
        var length:Number = this.length;
        _x = Math.cos(angle) * length;
        _y = Math.sin(angle) * length;
    }

    public function get angle():Number
    {
        return Math.atan2(_y, _x);
    }

    public function set length(length:Number):void
    {
        var angle:Number = this.angle;
        _x = Math.cos(angle) * length;
        _y = Math.sin(angle) * length;
    }

    public function get length():Number
    {
        return Math.sqrt(lengthSQ);
    }

    public function get lengthSQ():Number
    {
        return _x * _x + _y * _y;
    }

    public function get y():Number
    {
        return _y;
    }

    public function set y(y:Number):void
    {
        _y = y;
    }

    public function get x():Number
    {
        return _x;
    }

    public function set x(x:Number):void
    {
        _x = x;
    }

    public function angleTo(v2:Vector2D):Number
    {
        return Math.atan2(_x - v2.x, _y - v2.y);
    }

    public function distanceTo(v2:Vector2D):Number
    {
        var dx:Number = v2.x - x;
        var dy:Number = v2.y - y;
        return Math.sqrt(dx * dx + dy * dy);
    }

    public function normalize():Vector2D
    {
        if (length == 0)
        {
            _x = 1;
            return this;
        }
        var length:Number = this.length;
        _x /= length;
        _y /= length;
        return this;
    }

    public function truncate(max:Number):Vector2D
    {
        length = Math.min(max, length);
        return this;
    }

    public function add(v2:Vector2D):Vector2D
    {
        return new Vector2D(_x + v2.x, _y + v2.y);
    }

    public function subtract(v2:Vector2D):Vector2D
    {
        return new Vector2D(_x - v2.x, _y - v2.y);
    }

    public function multiply(value:Number):Vector2D
    {
        return new Vector2D(_x * value, _y * value);
    }

    public function divide(value:Number):Vector2D
    {
        return new Vector2D(_x / value, _y / value);
    }

    public function clone():Vector2D
    {
        return new Vector2D(_x, _y);
    }

    public function toString():String
    {
        return "x: " + _x + ", y: " + _y;
    }

}
}