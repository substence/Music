﻿package utils.sceneHandler{			import com.greensock.TweenLite;		import flash.display.*;	import flash.events.Event;	import flash.events.MouseEvent;	import flash.filters.BitmapFilter;	import flash.geom.Point;	import flash.geom.Rectangle;	import flash.utils.Dictionary;		import interfaces.*;		public class SceneHandler implements IUpdatable	{							private var _camera:SceneCamera; 		private var _canvas:Bitmap;		private var _magnification:Number;		private var _layers:Dictionary;			private var _trackee:ISpatial;		private var _trackingEase:Number;		private var _trackingOffset:Function;		private var _view:BitmapData;		public var _container:Sprite;		private static var _instance:SceneHandler;		public var doBoundsScaleDynamically:Boolean;				public static function get instance():SceneHandler		{			if(!_instance)				throw new Error("You must first initialize");			return _instance;		}				public function get camera():SceneCamera		{			return _camera;		}				public function set magnification(value:Number):void		{			_magnification = value;		}				public function get magnification():Number		{			return _magnification;		}				public static function initialize(stage:Stage, bounds:Rectangle = null):void		{			if(_instance)				return;			_instance = new SceneHandler(stage, bounds);		}				public function SceneHandler(stage:Stage, bounds:Rectangle = null)		{			_magnification = 1;			_trackingEase = 0;			_layers = new Dictionary();			_container = new Sprite();			_camera = new SceneCamera();			doBoundsScaleDynamically = !bounds;			if (bounds)				_camera.bounds = bounds;			stage.addEventListener(Event.RESIZE, updateCameraSize);			stage.dispatchEvent(new Event(Event.RESIZE));			updateBounds();			//			stage.addChild(_container);		}				private function updateBounds(event:Event = null):void		{			if (!doBoundsScaleDynamically)				return;			_camera.bounds.width = _canvas.stage.stageWidth;			_camera.bounds.height = _canvas.stage.stageHeight;		}				private function updateCameraSize(event:Event = null):void		{			var stage:Stage = Stage(event.target);			var width:Number = stage.stageWidth;			var height:Number = stage.stageHeight;			_camera.width = width;			_camera.height = height;			_view = new BitmapData(width, height);			if (_canvas)				stage.removeChild(_canvas);							_canvas = new Bitmap(_view);				stage.addChild(_canvas);		}				public function setMagnification(value:Number, transitionDuration:Number = 0):void		{			TweenLite.to(this, transitionDuration, {magnification: value});		}				public function addCameraLayer(label:String, layer:SceneLayer, index:int = 0):void		{			index = index == 0 ? _container.numChildren : index;			_layers[label] = layer;			_container.addChildAt(layer.canvas, index);				}				public function removeCameraLayer(label:String):void		{			_container.removeChild(_layers[label].canvas);							_layers[label] = null		}						public function getLayerByLabel(label:String):SceneLayer		{				return _layers[label];		}								public function panCameraTo(x:Number, y:Number, transitionDuration:Number = 0):void		{			TweenLite.to(_camera, transitionDuration, {x:x, y:y});					}				public function track(value:ISpatial, easing:Number = 0):void		{			_trackee = value;			_trackingEase = easing;			setCustomTrackingOffset(getCenterOffset);		}				public function setCustomTrackingOffset(getOffsetPoint:Function):void		{			_trackingOffset = getOffsetPoint;			}				public function update():void		{						if(_trackee)			{				var offset:Point = _trackingOffset();				panCameraTo(_trackee.x + offset.x, _trackee.y + offset.y, _trackingEase);			}			_canvas.scaleX = _magnification;			_canvas.scaleY = _magnification;							_view.lock();				_view.fillRect(_view.rect, 0x00FF00);			var containerBitmapData:BitmapData = new BitmapData(_camera.bounds.width, _camera.bounds.height);			containerBitmapData.draw(_container, null, null, null, _camera.rectangle);			_view.copyPixels(containerBitmapData, _camera.rectangle, new Point());			_view.unlock();						}					public function getScreenPosition(value:ISpatial):Point		{			var x:Number = (value.x - _camera.x) * magnification;			var y:Number = (value.y - _camera.y) * magnification;			return new Point(x,y);		}				public function isObjectOnScreen(value:ISpatial):Boolean		{			var translatedPoint:Point = getScreenPosition(value);			if (translatedPoint.x < 0 || translatedPoint.y < 0|| translatedPoint.x > _camera.width || translatedPoint.y > _camera.height)				return false;			else				return true;		}				private function getCenterOffset():Point		{			return new Point(-(_camera.width * .5) / _magnification, -(_camera.height * .5) / _magnification)		}	}}