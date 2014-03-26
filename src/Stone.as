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
			//trace(kind);
			switch(kind){
				case Config.STONE1_SMALL:
					graphic = new Image(EmbedImage.STONE1_SMALL_IMAGE);
					break;
				case Config.STONE1_MIDDLE:
					graphic = new Image(EmbedImage.STONE1_MIDDLE_IMAGE);
					break;
				case Config.STONE1_BIG:
					graphic = new Image(EmbedImage.STONE1_BIG_IMAGE);
					break;
				case Config.STONE2_SMALL:
					graphic = new Image(EmbedImage.STONE2_SMALL_IMAGE);
					break;
				case Config.STONE2_MIDDLE:
					graphic = new Image(EmbedImage.STONE2_MIDDLE_IMAGE);
					break;
				case Config.STONE2_BIG:
					graphic = new Image(EmbedImage.STONE2_BIG_IMAGE);
					break;
				default:
					graphic = Image.createCircle(5, 0x00ff00);
			}
		}
		
	}

}