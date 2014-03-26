package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.filters.BitmapFilter;
	import flash.filters.BitmapFilterType;
	import flash.geom.Rectangle;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Canvas;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Graphic;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	/**
	 * ...
	 * @author Lyudison
	 */
	public class Rope extends Entity
	{
		private var launched:Boolean;
		private var catchStone:uint;
		private var speed:Number;
		private var launchSpeed:Number;
		private var backSpeed:Number;
		private var waveSpeed:Number;
		private var angle:Number;
		private var endX:Number;
		private var endY:Number;
		private var length:Number;
		private var finalLength:Number;
		private var image:Image;
		
		public function Rope(ropeType:uint = 0)
		{
			
			launched = false;
			speed = 0;
			waveSpeed = Config.WAVE_SPEED;
			length = Config.ROPE_LENGTH;
			setLength(length);
			setAngle(Config.WAVE_ANGLE_MIN);
			catchStone = 0;
		}
		
		override public function update():void 
		{
			//rope launch
			if(launched) {
				length = length + speed * FP.elapsed;
				if (length >= finalLength) {
					speed = -backSpeed;
				}
				//already back
				else if (speed < 0 && length <= Config.ROPE_LENGTH) {
					length = Config.ROPE_LENGTH;
					speed = launchSpeed;
					launched = false;
					catchStone = 0;
				}
				setLength(length);
			}
			//rope wave
			else {
				angle = angle + waveSpeed * FP.elapsed;
				if (angle <= Config.WAVE_ANGLE_MIN) {
					angle = Config.WAVE_ANGLE_MIN;
					waveSpeed = -waveSpeed;
				}
				else if (angle >= Config.WAVE_ANGLE_MAX) {
					angle = Config.WAVE_ANGLE_MAX;
					waveSpeed = -waveSpeed;
				}
				setAngle(angle);
			}
		}
		
		public function launch(launchInfo:Object):void {
			launched = true;
			endX = launchInfo.destX;
			endY = launchInfo.destY;
			catchStone = launchInfo.oriID;
			var forwardTime:Number = launchInfo.reachTime;
			var backwardTime:Number = launchInfo.returnTime;
			
			finalLength = Math.sqrt((x - endX) * (x - endX) + (y - endY) * (y - endY));
			angle = 90 - (Math.acos((endX - x) / finalLength))* 180 / 3.14;
			//trace("output angle:"+(Math.acos((endX - x) / finalLength))* 180 / 3.14);
			speed = launchSpeed = (finalLength-Config.ROPE_LENGTH) / forwardTime;
			backSpeed = (finalLength - Config.ROPE_LENGTH) / backwardTime;
			
			//trace("launchInfo:" + launchInfo);
			//trace("finalLength:" + finalLength);
			//trace("angle:" + angle);
		}
		
		public function setLength(_length:Number):void {
			length = _length;
			/*
			var ropeClass:Class = EmbedImage.ROPE_DEFAULT;
			switch(catchStone) {
				case Config.ROPE_DEFAULT:
					ropeClass = EmbedImage.ROPE_DEFAULT;
					break;
				case Config.ROPE_CATCH_STONE1:
					ropeClass = EmbedImage.ROPE_CATCH_STONE1;
					break;
				case Config.ROPE_CATCH_STONE2:
					ropeClass = EmbedImage.ROPE_CATCH_STONE2;
					break;
				default:
					trace("Unknown catch stone state. Check at Rope.setLength()");
			}*/
			image = new Image(EmbedImage.ROPE_DEFAULT, new Rectangle(0, Config.ROPE_MAX_LENGTH-length, Config.ROPE_WIDTH, length));
			image.originX = Config.ROPE_WIDTH / 2;
			image.angle = angle;
			graphic = image;
		}
		
		public function setAngle(angles:Number):void {
			angle = angles;
			image.angle = angle;
			graphic = image;
		}
		
		public function getAngle():Number {
			return angle;
		}
		
		public function toLaunch():void {
			//trace("my angle:" + angle);
			var convertedAngle:Number = 3.14 * (90 - angle) / 180;//should be radians
			var toLaunchInfo:Object = new Object;
			toLaunchInfo.flagID = 241;
			toLaunchInfo.flagName = "launchRequire";
			toLaunchInfo.angle = convertedAngle;
			Util.getInstance().send(toLaunchInfo);
		}
	}

}