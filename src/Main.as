package
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	public class Main extends Engine
	{
		public function Main()
		{
			super(Config.RESOLUTION_WIDTH, Config.RESOLUTION_HEIGHT, 60, false);
			//FP.world = new Room;
			FP.world = new GamePlay(4);
		}

		override public function init():void
		{
			trace("FlashPunk has started successfully!");
		}
	}
}