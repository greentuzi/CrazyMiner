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
		private var playerPosition:Number;
		
		//entities
		private var playerArea:ImageDisplay;
		private var mineArea:ImageDisplay;
		private var players:Array;
		private var stones:Array;
		
		//stones' map
		private var stoneMap:Array;
		
		private static var instance:GamePlay = null;
		
		public static function getInstance(players:Array, playerPosition:Number, stones:Array):GamePlay
		{
			if (instance == null)
				return instance = new GamePlay(players,playerPosition,stones);
			return instance;
		}
		
		public function GamePlay(_playerPosition:Number, _players:Array, _stones:Array) 
		{
			playerPosition = _playerPosition;
			
			//background
			playerArea = new ImageDisplay(Config.DISPLAY_PLAYER_BACKGROUND);//default display at (0,0)
			mineArea = new ImageDisplay(Config.DISPLAY_MINE_BACKGROUND);
			mineArea.moveTo(0, Config.PLAYER_AREA_HEIGHT);
			
			//players
			players = _players;
			for (var i:int = 0; i < players.length; i++)
				players[i].moveTo(Config.RESOLUTION_WIDTH * (2 * i + 1) / playerNum / 2.0 - Config.PLAYER_WIDTH / 2.0, Config.PLAYER_Y);
			
			//stones
			stones = _stones;
			for (var j:int = 0; j < stones.length; j++) {
				var col:Number = Config.RESOLUTION_WIDTH % stones[j].position;
				var row:Number = Config.RESOLUTION_HEIGHT / stones[j].postion * int(Config.RESOLUTION_WIDTH / Config.STONE_BOX);
				stones[j].moveTo(col * Config.STONE_BOX, row * Config.STONE_BOX + Config.PLAYER_AREA_HEIGHT);
			}
			addEntities();
		}
		
		private function addEntities():void {
			add(playerArea);
			add(mineArea);
			for (var i:int = 0; i < players.length; i++) {
				add(players[i].character);
				add(players[i].platform);
				add(players[i].rope);
			}
			for (var j:int = 0; j < stones.length; j++) {
				add(stones[j]);
			}
		}
		
		public function receive(string:String):void
		{
			var array:Array = string.split("\n");
			var i:int = array[0];
			players[i].rope.launch(array);
		}
		
		override public function update():void 
		{
			super.update();
			if (Input.mousePressed && Input.mouseY > Config.PLAYER_AREA_HEIGHT) {
				players[myPos].rope.toLaunch();
			}
		}
	}

}