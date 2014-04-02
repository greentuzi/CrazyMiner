package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Lyudison
	 */
	public class Stone extends Entity
	{
		public var kind:uint;
		public var position:uint;
		
		public function Stone(_position:uint = 0, _kind:uint = 0) 
		{
			kind = _kind;
			position = _position;
			
			switch(kind){
				case Config.STONE1_SMALL:
					graphic = new Image(EmbedImage.STONE1_SMALL_IMAGE);
					width = Config.STONE_SMALL_WIDTH;
					break;
				case Config.STONE1_MIDDLE:
					graphic = new Image(EmbedImage.STONE1_MIDDLE_IMAGE);
					width = Config.STONE_MIDDLE_WIDTH;
					break;
				case Config.STONE1_BIG:
					graphic = new Image(EmbedImage.STONE1_BIG_IMAGE);
					width = Config.STONE_BIG_WIDTH;
					break;
				case Config.STONE2_SMALL:
					graphic = new Image(EmbedImage.STONE2_SMALL_IMAGE);
					width = Config.STONE_SMALL_WIDTH;
					break;
				case Config.STONE2_MIDDLE:
					graphic = new Image(EmbedImage.STONE2_MIDDLE_IMAGE);
					width = Config.STONE_MIDDLE_WIDTH;
					break;
				case Config.STONE2_BIG:
					graphic = new Image(EmbedImage.STONE2_BIG_IMAGE);
					width = Config.STONE_BIG_WIDTH;
					break;
				default:
					graphic = Image.createCircle(5, 0x00ff00);
			}
		}
		
		public function destroy():void {
			FP.world.remove(this);
		}
		
	}

}