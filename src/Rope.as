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
		private var isCatch:Boolean;
		private var speed:Number;
		private var launchSpeed:Number;
		private var backSpeed:Number;
		private var waveSpeed:Number;
		private var angle:Number;
		private var endX:Number;
		private var endY:Number;
		private var length:Number;
		private var finalLength:Number;
		private var image:EmbedImage;
		
		public function Rope(ropeType:uint = 0)
		{
			
			launched = false;
			speed = 0;
			waveSpeed = Config.WAVE_SPEED;
			length = Config.ROPE_LENGTH;
			image = new EmbedImage(Config.ROPE, new Rectangle(0, Config.ROPE_MAX_LENGTH-length, Config.ROPE_WIDTH, length));
			image.originX = Config.ROPE_WIDTH / 2;
			graphic = image;
			setAngle(Config.WAVE_ANGLE_MIN);
			isCatch = false;
		}
		
		override public function update():void 
		{
			//rope launch
			if(launched) {
				length = length + speed * FP.elapsed;
				if (length>=finalLength) {
					speed = -backSpeed;
				}
				//already back
				else if (speed < 0 && length <= Config.ROPE_LENGTH) {
					length = Config.ROPE_LENGTH;
					speed = launchSpeed;
					launched = false;
					isCatch = false;
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
		
		public function launch(launchInfo:Array):void {
			launched = true;
			endX = launchInfo[1];
			endY = launchInfo[2];
			var forwardTime:Number = launchInfo[3];
			var backwardTime:Number = launchInfo[4];
			
			finalLength = Math.sqrt((x - endX) * (x - endX) + (y - endY) * (y - endY));
			angle = 90 - (Math.acos((endX - x) / finalLength))* 180 / 3.14;
			//trace("output angle:"+(Math.acos((endX - x) / finalLength))* 180 / 3.14);
			speed = launchSpeed = (finalLength-Config.ROPE_LENGTH) / forwardTime;
			backSpeed = (finalLength - Config.ROPE_LENGTH) / backwardTime;
			
			//trace("launchInfo:" + launchInfo);
			//trace("finalLength:" + finalLength);
			//trace("angle:" + angle);
		}
		
		public function setLength(distance:Number):void {
			length = distance;
			image = new EmbedImage(Config.ROPE, new Rectangle(0, Config.ROPE_MAX_LENGTH-length, Config.ROPE_WIDTH, length));
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
			Util.getInstance().send("241##launchRequire##" + convertedAngle + "##");
		}
	}

}