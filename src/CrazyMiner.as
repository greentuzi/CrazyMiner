package
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	
	public class CrazyMiner extends Engine
	{
		public static var util:Util = null;
		public static var room:Room = null;
		public static var gamePlay:GamePlay = null;
		
		public function CrazyMiner()
		{
			super(Config.RESOLUTION_WIDTH, Config.RESOLUTION_HEIGHT, 60, false);
			util = Util.getInstance();
			
			//test room
			//var characters:Array = new Array;
			//for (var i:int = 0; i < 2; i++)
			//	characters.push(new Character("myCharacter", 3, 100));
			
			//setView(createRoom(0, "Test Room", characters));
		}
		
		public static function createRoom(_roomNumber:uint = 0, _roomName:String = null, _characters:Array = null):Room {
			if (!room)
				room = new Room(_roomNumber, _roomName, _characters);
			return room;
		}
		
		public static function createGamePlay(_playerPosition:Number = 0, _players:Array = null, _stones:Array = null):GamePlay {
			if (!gamePlay) 
				gamePlay = new GamePlay(_playerPosition, _players, _stones);
			return gamePlay;
		}
		
		public static function destroyGamePlay():Boolean {
			if (!gamePlay)
				return false;
			//else
			gamePlay = null;
			return true;
		}
		
		public static function setView(view:World):void {
			FP.world = view;
		}
	}
}