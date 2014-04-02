package  
{
	/**
	 * ...
	 * @author Lyudison
	 */
	import Buttons.ReadyButton;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.World;
	 
	public class Room extends World
	{
		//info
		private var roomNumber:uint;
		private var roomName:String;
		private var characters:Array;//'Character' used for an always existed identity, while 'Player' for just 'GamePlay'
		private var readyStates:Array;
		
		//image display
		private var roomNameDisplay:TextDisplay;
		private var characterDisplays:Array;
		private var readyDisplays:Array;
		private var infoDisplays:Array;
		
		private var backgroundDisplay:ImageDisplay;
		
		public function Room(_roomNumber:uint = 0, _roomName:String = null, _characters:Array = null) 
		{
			_roomNumber = roomNumber;
			
			if (_roomName)
				roomNameDisplay = new TextDisplay(_roomName);
			else roomNameDisplay = new TextDisplay("My Room");
			
			characters = _characters;
			
			trace(characters.length);
			
			readyStates = new Array;
			for (var i:int = 0; i < characters.length; i++)
				readyStates.push(false);
			
			initEntities();
			addEntities();
		}
		
		private function initEntities():void {
			
			backgroundDisplay = new ImageDisplay(EmbedImage.ROOM_BACKGROUND);
			backgroundDisplay.moveTo(0, 0);
			
			roomNameDisplay.moveTo(Config.ROOM_NAME_X, Config.ROOM_NAME_Y);
			
			if (characters) {
				
				var characterNumber:int = characters.length;
				
				characterDisplays = new Array;
				infoDisplays = new Array;
				readyDisplays = new Array;
				
				for (var i:int = 0; i < characters.length; i++){
					characterDisplays.push(new ImageDisplay(EmbedImage.CHARACTER_DEFAULT));
					infoDisplays.push(new TextDisplay("character info here"));
					readyDisplays.push(new ReadyButton(EmbedImage.READY_BUTTON_UNCLICKED, EmbedImage.READY_BUTTON_CLICKED));
				}
				
				for (var j:int = 0; j < characters.length; j++) {
					trace("x:"+(Config.RESOLUTION_WIDTH * (2 * j + 1) / characterNumber / 2.0 - Config.ROOM_CHARACTER_WIDTH / 2.0));
					characterDisplays[j].moveTo(Config.RESOLUTION_WIDTH * (2 * j + 1)/ characterNumber / 2.0 - Config.ROOM_CHARACTER_WIDTH / 2.0, Config.ROOM_CHARACTER_Y);
					infoDisplays[j].moveTo(Config.RESOLUTION_WIDTH * (2 * j + 1)/ characterNumber / 2.0 - Config.ROOM_INFO_WIDTH / 2.0, Config.ROOM_INFO_Y);
					readyDisplays[j].moveTo(Config.RESOLUTION_WIDTH * (2 * j + 1)/ characterNumber / 2.0 - Config.ROOM_READY_BUTTON_WIDTH / 2.0, Config.ROOM_READY_BUTTON_Y);
				}
			}
			
		}
		
		private function addEntities():void {
			add(backgroundDisplay);
			add(roomNameDisplay);
			
			if (characters)
			for (var i:int = 0; i < characters.length; i++) {
				
				add(characterDisplays[i]);
				add(infoDisplays[i]);
				add(readyDisplays[i]);
			}
		}
	}

}