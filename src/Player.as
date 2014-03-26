package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
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
		
		public function setAction(action:Object):void {
			switch(action.flagID) {
				case 241:
					rope.toLaunch();
					break;
				case Config.ACTION_LAUNCH:
					rope.launch(action);
					break;
				case Config.ACTION_TOOL:
					//...
					break;
				default:
					trace("Unknown action type!!!");
			}
		}
		
		public function getScore():uint {
			return score;
		}
		
		public function getPosition():uint 
		{
			return position;
		}
		
		public function getCharacter():ImageDisplay {
			return character;
		}
		
		public function getPlatform():ImageDisplay {
			return platform;
		}
		
		public function getRope():Rope {
			return rope;
		}
		
		public function getTools():Array {
			return tools;
		}
	}

}