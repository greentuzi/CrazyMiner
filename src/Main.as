package
{
	import adobe.utils.CustomActions;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	
	public class Main extends Engine
	{
		private var state:int = 0;
		public var gamePlay:GamePlay = null;

		public function Main()
		{
			super(Config.RESOLUTION_WIDTH, Config.RESOLUTION_HEIGHT, 60, false);
			gamePlay = GamePlay.getInstance(0,null,null);
			FP.world = gamePlay;
		}
	}
}