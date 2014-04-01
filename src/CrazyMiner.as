package
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	
	public class CrazyMiner extends Engine
	{
		public static var util:Util = null;
		//public static var room:Room = null;
		public static var gamePlay:GamePlay = null;
		
		public function CrazyMiner()
		{
			super(Config.RESOLUTION_WIDTH, Config.RESOLUTION_HEIGHT, 60, false);
			util = Util.getInstance();
		}
		
		public static function createGamePlay(_playerPosition:Number = 0, _players:Array = null, _stones:Array = null):GamePlay {
			if (gamePlay) {
				FP.world = gamePlay;
				return null;
			}
			//else
			gamePlay = new GamePlay(_playerPosition, _players, _stones);
			FP.world = gamePlay;
			return gamePlay;
		}
		
		public static function destroyGamePlay():Boolean {
			if (!gamePlay)
				return false;
			//else
			gamePlay = null;
			return true;
		}
	}
}