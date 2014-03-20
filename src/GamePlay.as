package  
{
	import adobe.utils.CustomActions;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author Lyudison
	 */
	public class GamePlay extends World
	{
		//game info
		private var playerNum:Number;
		
		//entities
		private var playerArea:ImageDisplay;
		private var mineArea:ImageDisplay;
		private var players:Array;
		private var stones:Array;
		private var stoneCount:int = 10;
		
		private static var instance:GamePlay = null;
		
		public static function getInstance():GamePlay
		{
			if (instance == null)
				return instance = new GamePlay();
			return instance;
		}
		
		
		public function GamePlay(playerNumber:Number = 2, playerPosition:Number = 0, stones:Array = null) 
		{
			playerNum = playerNumber;
			initEntities();
			addEntities();
		}
		
		private function initEntities():void {
			playerArea = new ImageDisplay(0, 0, Config.PLAYER_AREA);
			mineArea = new ImageDisplay(0, 0, Config.MINE_AREA);
			mineArea.moveTo(0, Config.PLAYER_AREA_HEIGHT);
			
			players = new Array;
			for (var i:int = 0; i < playerNum; i++){
				players.push(new Player(Config.RESOLUTION_WIDTH * (2 * i + 1) / playerNum / 2.0 - Config.PLAYER_WIDTH / 2.0, Config.PLAYER_Y));
			}
			/*
			stones = new Array;
			for (var j:int = 0; j < stoneCount; j++) {
				var x:Number = Math.random() * Config.RESOLUTION_WIDTH;
				var y:Number = Math.random() * Config.MINE_AREA_HEIGHT + Config.PLAYER_AREA_HEIGHT + Config.ROPE_LENGTH * 2;
				stones.push(new Stone(x, y));
			}*/
		}
		
		private function addEntities():void {
			add(playerArea);
			add(mineArea);
			for (var i:int = 0; i < playerNum; i++) {
				add(players[i].header);
				add(players[i].platform);
				add(players[i].rope);
			}
			/*
			for (var j:int = 0; j < stoneCount; j++) {
				add(stones[j]);
			}*/
		}
		
		public function receive(string:String):void
		{
			var array:Array = string.split("\n");
			var i:int = array[0];
			players[i].rope.launch(array);
		}
	}

}