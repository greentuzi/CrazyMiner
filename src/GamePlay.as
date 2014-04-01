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
		private var playerNumber:Number;
		private var playerPosition:Number;
		
		//entities
		private var playerArea:ImageDisplay;
		private var mineArea:ImageDisplay;
		private var players:Array;
		private var stones:Array;
		
		public function GamePlay(_playerPosition:Number = 0, _players:Array = null, _stones:Array = null) 
		{
			playerNumber = _players.length;
			//trace(playerNumber);
			playerPosition = _playerPosition;
			
			//background
			playerArea = new ImageDisplay(Config.DISPLAY_PLAYER_BACKGROUND);//default display at (0,0)
			mineArea = new ImageDisplay(Config.DISPLAY_MINE_BACKGROUND);
			mineArea.moveTo(0, Config.PLAYER_AREA_HEIGHT);
			
			//players
			players = _players;
			
			if(players)
			for (var i:int = 0; i < players.length; i++){
				players[i].move(Config.RESOLUTION_WIDTH * (2 * i + 1) / playerNumber / 2.0 - Config.PLAYER_WIDTH / 2.0, Config.PLAYER_Y);
				trace("x:" + (Config.RESOLUTION_WIDTH * (2 * i + 1) / playerNumber / 2.0 - Config.PLAYER_WIDTH / 2.0));
			}
			
			//stones
			stones = _stones;
			if (stones) 
			for (var j:int = 0; j < stones.length; j++) {
				var col:Number = stones[j].position%24;
				var row:Number = stones[j].position/24;
				stones[j].moveTo(col * Config.STONE_BOX + Config.MINE_LEFT, row * Config.STONE_BOX + Config.MINE_TOP);
			}
			
			addEntities();
		}
		
		private function addEntities():void {
			
			add(playerArea);
			add(mineArea);
			
			if(players)
			for (var i:int = 0; i < players.length; i++) {
				add(players[i].getCharacter());
				add(players[i].getPlatform());
				add(players[i].getRope());
			}
			
			if (stones) 
			for (var j:int = 0; j < stones.length; j++) {
				add(stones[j]);
			}
		}
		
		public function receive(actionInfo:Object):void
		{
			players[actionInfo.playID].setAction(actionInfo);
		}
		
		override public function update():void 
		{
			super.update();
			if (Input.mousePressed && Input.mouseY > Config.PLAYER_AREA_HEIGHT) {
				var toLaunchInfo:Object = new Object;
				toLaunchInfo.flagID = 241;
				players[playerPosition].setAction(toLaunchInfo);
			}
		}
	}

}