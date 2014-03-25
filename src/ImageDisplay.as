package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Lyudison
	 */
	public class ImageDisplay extends Entity
	{
		public function ImageDisplay(_display:uint, _type:uint = 0)
		{
			//select your display
			//such as character, platform, rope
			switch(_display) {
				//set character display
				case Config.DISPLAY_CHARACTER:
					switch(_type) {
						default:
							graphic = new Image(Config.CHARACTER_DEFAULT);
					}
					break;
				//set platform display
				case Config.DISPLAY_PLATFORM:
					switch(_type) {
						default:
							graphic = new Image(Config.PLATFORM_DEFAULT);
					}
					break;
				//set rope display
				case Config.DISPLAY_ROPE:
					switch(_type) {
						default:
							graphic = new Image(Config.ROPE_DEFAULT);
					}
					break;
				//set player area background
				case Config.DISPLAY_PLAYER_BACKGROUND:
					switch(_type) {
						default:
							graphic = new Image(Config.PLAYER_AREA);
					}
					break;
				//set player mine area background
				case Config.DISPLAY_MINE_BACKGROUND:
					switch(_type) {
						default:
							graphic = new Image(Config.MINE_AREA);
					}
					break;
				default:
					throw("Bad display category!!!");
			}
		}
	}

}