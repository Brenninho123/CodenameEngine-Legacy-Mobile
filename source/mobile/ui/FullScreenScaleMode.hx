package mobile.ui;

import flixel.FlxG;
import flixel.system.scaleModes.BaseScaleMode;

class FullScreenScaleMode extends BaseScaleMode
{
	public function new()
	{
		super();
	}

	override public function onMeasure(width:Int, height:Int):Void
	{
		if (width == 0 || height == 0)
			return;

		var scaleX:Float = width / gameSize.x;
		var scaleY:Float = height / gameSize.y;
		var scale:Float = Math.max(scaleX, scaleY);

		scale = Math.max(scale, 0.01);

		gameScale.x = scale;
		gameScale.y = scale;

		updateGameSize(width, height);
		updateOffset(width, height);
		updateGamePosition();
	}

	override public function updateGameSize(width:Int, height:Int):Void
	{
		gameSize.x = Math.ceil(width / gameScale.x);
		gameSize.y = Math.ceil(height / gameScale.y);
	}

	override public function updateOffset(width:Int, height:Int):Void
	{
		offset.x = (width - gameSize.x * gameScale.x) * 0.5;
		offset.y = (height - gameSize.y * gameScale.y) * 0.5;
	}
}
