package  
{
	import flash.events.DRMAuthenticationCompleteEvent;
	/**
	 * ...
	 * @author Lyudison
	 */
	public class Config 
	{
		//global
		public static var RESOLUTION_WIDTH:Number = 1366;
		public static var RESOLUTION_HEIGHT:Number = 768;
		
		//category
		public static var DISPLAY_CHARACTER:uint = 0;
		public static var DISPLAY_PLATFORM:uint = 1;
		public static var DISPLAY_ROPE:uint = 2;
		public static var DISPLAY_PLAYER_BACKGROUND:uint = 3;
		public static var DISPLAY_MINE_BACKGROUND:uint = 4;
		
		//stones
		public static var STONE1_SMALL:uint = 0;
		public static var STONE1_MIDDLE:uint = 1;
		public static var STONE1_BIG:uint = 2;
		public static var STONE2_SMALL:uint = 3;
		public static var STONE2_MIDDLE:uint = 4;
		public static var STONE2_BIG:uint = 5;
		
		//gameplay display
		public static var PLAYER_AREA_HEIGHT:Number = 144;
		public static var MINE_AREA_HEIGHT:Number = RESOLUTION_HEIGHT - PLAYER_AREA_HEIGHT;
		public static var PLAYER_WIDTH:Number = 114;
		public static var PLAYER_HEIGHT:Number = 144;
		public static var PLATFORM_WIDTH:Number = 57;
		public static var PLATFORM_HEIGHT:Number = 48;
		public static var ROPE_LENGTH:Number = 100;
		public static var ROPE_MAX_LENGTH:Number = 1338;
		public static var ROPE_WIDTH:Number = 38;
		public static var FIRE_SPEED:Number = 300;
		public static var WAVE_ANGLE_MIN:Number = -80;
		public static var WAVE_ANGLE_MAX:Number = -WAVE_ANGLE_MIN;
		public static var WAVE_SPEED:Number = 50;
		public static var CLAW_WIDTH:Number = 38;
		public static var ROPE_COLOR:Number = 0x0000FF;
		public static var CLAW_HEIGHT:Number = 38;
		public static var PLAYER_Y:Number = PLAYER_AREA_HEIGHT - PLAYER_HEIGHT;
		public static var PLATFORM_Y:Number = PLAYER_AREA_HEIGHT - PLATFORM_HEIGHT;
		public static var ROPE_Y:Number = PLAYER_AREA_HEIGHT;
		public static var STONE_BOX:Number = 60;
		public static var CLAW_Y:Number = PLAYER_AREA_HEIGHT + ROPE_LENGTH;
		
		//action
		public static var ACTION_LAUNCH:uint = 0;
		public static var ACTION_TOOL:uint = 1;
	}

}