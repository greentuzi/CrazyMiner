package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.utils.Input;
	/**
	 * ...
	 * @author Lyudison
	 */
	public class Player extends Entity
	{
		//display
		public var header:ImageDisplay;
		public var platform:ImageDisplay;
		public var rope:Rope;
		//info
		private var playerName:String;
		
		public function Player(position_x:Number = 0.0, position_y:Number = 0.0) 
		{
			x = position_x;
			y = position_y;
			header = new ImageDisplay(x + Config.PLAYER_WIDTH / 2.0 - Config.PLAYER_WIDTH/2.0, y + Config.PLAYER_HEIGHT - Config.PLAYER_HEIGHT,Config.PLAYER);
			platform = new ImageDisplay(x + Config.PLAYER_WIDTH/2.0 - Config.PLATFORM_WIDTH / 2.0, y + Config.PLAYER_HEIGHT - Config.PLATFORM_HEIGHT,Config.PLATFORM);
			rope = new Rope(x + Config.PLAYER_WIDTH / 2.0, y + Config.PLAYER_HEIGHT);
		}
	}

}