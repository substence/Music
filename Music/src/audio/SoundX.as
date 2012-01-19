package audio
{
	import flash.events.SampleDataEvent;
	import flash.media.Sound;
	import flash.media.SoundLoaderContext;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	
	public class SoundX extends Sound
	{
		private var _bytes:ByteArray;
		private var _start:int;
		private var _end:int;
		private var _source:Sound;
		
		public function SoundX(source:Sound)
		{
			_source = source;
			_bytes = new ByteArray();
			this.addEventListener(SampleDataEvent.SAMPLE_DATA, fill);
		}
		
		public function get end():int
		{
			return _end;
		}

		public function set end(value:int):void
		{
/*			if (value == 0)
				value = _source.length - 50;
			value += 50;*/
			_end = 44100 * (value - _start) / 1000;
			reExtract();
		}

		public function get start():int
		{
			return _start;
		}

		public function set start(value:int):void
		{
			//value += 50;
			_start = 44100 * value / 1000;
			//reExtract();
		}
		
		public function reExtract():void
		{
			_source.extract(_bytes, _end, _start);
			_bytes.position = 0;
		}

		private function fill(e:SampleDataEvent):void
		{
			for (var i:int = 0; i < 4096; i++)
			{
				e.data.writeFloat(_bytes.readFloat());
				_bytes.position = _bytes.position % _bytes.length;
				e.data.writeFloat(_bytes.readFloat());
				_bytes.position = _bytes.position % _bytes.length;
			}
		}
	}
}