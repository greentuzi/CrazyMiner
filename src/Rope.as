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
		
		private var stone:Stone;
		private var stoneDeleted:Boolean;
		
		public function Rope(ropeType:uint = 0)
		{
			
			launched = false;
			speed = 0;
			waveSpeed = Config.WAVE_SPEED;
			length = Config.ROPE_LENGTH;
			setLength(length);
			setAngle(Config.WAVE_ANGLE_MIN);
			stone = null;
			stoneDeleted = false;
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
					stone = null;
					stoneDeleted = false;
				}
				else if (stone&&speed<0&&!stoneDeleted){
					stone.destroy();
					stoneDeleted = true;
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
			var catchedStoneID:int = launchInfo.oreID;
			
			var stones:Array = CrazyMiner.gamePlay.getStones();
			for (var i:int = 0; i < stones.length; i++)
				if (stones[i].position == catchedStoneID){
					stone = stones[i];
				}
			
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
			
			var ropeClass:Class = null;
			
			var stoneType:int = -1;
			if(stone)
				stoneType = stone.kind;
				
			//trace("stoneType:" + stoneType);
			if (stoneType >= 0 && stoneType <= 2 && speed<0)
				ropeClass = EmbedImage.ROPE_CATCH_STONE1;
			else if (stoneType >= 3 && stoneType <= 5 && speed<0)
				ropeClass = EmbedImage.ROPE_CATCH_STONE2;
			else
				ropeClass = EmbedImage.ROPE_DEFAULT;
			
			image = new Image(ropeClass, new Rectangle(0, Config.ROPE_MAX_LENGTH-length, Config.ROPE_WIDTH, length));
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
			if (launched)
				return;
			var convertedAngle:Number = 3.14 * (90 - angle) / 180.0;//should be radians
			var toLaunchInfo:Object = new Object;
			toLaunchInfo.flagID = 241;
			toLaunchInfo.flagName = "launchRequire";
			toLaunchInfo.angle = convertedAngle;
			Util.getInstance().send(toLaunchInfo);
		}
	}
}