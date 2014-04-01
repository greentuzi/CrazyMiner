package  
{
	/**
	 * ...
	 * @author Lyudison
	 */
	import net.flashpunk.utils.Draw;
	import net.flashpunk.World;
	 
	public class Room extends World
	{
		//info
		private var roomName:String;
		private var characters:Array;//'Character' used for an always existed identity, while 'Player' for just 'GamePlay'
		private var readyStates:Array;
		
		//image display
		private var characterDisplays:Array;
		private var readyDisplays:Array;
		private var infoDisplays:Array;
		
		public function Room(_roomName:String, _characters:Array, _readyState:Array) 
		{
			initEntities();
			addEntities();
		}
		
		private function initEntities():void {
			
			
			name1 = new TextDisplay("player1");
			name2 = new TextDisplay("player2");
			name1.moveTo(200, 450);
			name2.moveTo(500, 450);
			
			player1 = new ImageDisplay(Config.PLAYER);
			player2 = new ImageDisplay(Config.PLAYER);
			player1.moveTo(120, 50);
			player2.moveTo(450, 50);
		}
		
		private function addEntities():void {
			add(readyBtn1);
			add(readyBtn2);
			add(name1);
			add(name2);
			add(player1);
			add(player2);
		}
	}

}