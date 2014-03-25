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
		private var score:uint;
		private var position:uint;
		
		private var character:ImageDisplay;
		private var platform:ImageDisplay;
		private var rope:Rope;
		private var tools:Array;
		
		public function Player(_postion:uint, _characterType:uint = 0, _platformType:uint = 0, _ropeType:uint = 0, toolTypes:Array = null) 
		{
			score = 0;
			position = _postion;
			character = new ImageDisplay(Config.DISPLAY_CHARACTER, _characterType);
			platform = new ImageDisplay(Config.DISPLAY_PLATFORM, _platformType);
			rope = new Rope(_ropeType);
			
			character.moveTo(x + Config.PLAYER_WIDTH / 2.0 - Config.PLAYER_WIDTH / 2.0, y + Config.PLAYER_HEIGHT - Config.PLAYER_HEIGHT);
			platform.moveTo(x + Config.PLAYER_WIDTH / 2.0 - Config.PLATFORM_WIDTH / 2.0, y + Config.PLAYER_HEIGHT - Config.PLATFORM_HEIGHT);
			rope.moveTo(x + Config.PLAYER_WIDTH / 2.0, y + Config.PLAYER_HEIGHT);
		}
	}

}