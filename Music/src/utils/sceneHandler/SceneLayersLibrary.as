package utils.sceneHandler
{
	public class SceneLayersLibrary
	{
		public static const UI:String = "uiSceneLayer";
		public static const FOREGROUND:String = "foregroundSceneLayer";
		public static const BACKGROUND:String = "backgroundSceneLayer";
		
		public static function addLayers():void
		{
			SceneHandler.instance.addCameraLayer(BACKGROUND, new SceneLayer());
			SceneHandler.instance.addCameraLayer(FOREGROUND, new SceneLayer());
			SceneHandler.instance.addCameraLayer(UI, new SceneLayer());
		}
	}
}