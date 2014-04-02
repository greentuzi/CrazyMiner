package  
{
	/**
	 * ...
	 * @author Lyudison
	 */
	public class EmbedImage 
	{
		//room
		[Embed(source = "../embed/roomResource/notReady.png")] public static var READY_BUTTON_UNCLICKED:Class;
		[Embed(source = "../embed/roomResource/ready.png")] public static var READY_BUTTON_CLICKED:Class;
		[Embed(source = "../embed/roomResource/roomBackground.png")] public static var ROOM_BACKGROUND:Class;
		
		//backgrounds
		[Embed(source = "../embed/playerArea.png")] public static var PLAYER_AREA:Class;
		[Embed(source = "../embed/mineArea.png")] public static var MINE_AREA:Class;
		
		//characters
		[Embed(source = "../embed/player.png")] public static var CHARACTER_DEFAULT:Class;
		
		//platforms
		[Embed(source = "../embed/platform.png")] public static var PLATFORM_DEFAULT:Class;
		
		//ropes
		[Embed(source="../embed/GameRolePic/rope.png")] public static var ROPE_DEFAULT:Class;
		[Embed(source = "../embed/GameRolePic/ropeCatchStone1.png")] public static var ROPE_CATCH_STONE1:Class;
		[Embed(source = "../embed/GameRolePic/ropeCatchStone2.png")] public static var ROPE_CATCH_STONE2:Class;
		
		//stones
		[Embed(source = "../embed/GameRolePic/stone1Big.png")]public static var STONE1_BIG_IMAGE:Class;
		[Embed(source = "../embed/GameRolePic/stone1Middle.png")]public static var STONE1_MIDDLE_IMAGE:Class;
		[Embed(source = "../embed/GameRolePic/stone1Small.png")]public static var STONE1_SMALL_IMAGE:Class;
		[Embed(source = "../embed/GameRolePic/stone2Big.png")]public static var STONE2_BIG_IMAGE:Class;
		[Embed(source = "../embed/GameRolePic/stone2Midle.png")]public static var STONE2_MIDDLE_IMAGE:Class;
		[Embed(source = "../embed/GameRolePic/stone2Small.png")]public static var STONE2_SMALL_IMAGE:Class;
	}

}