package
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	
	public class Main extends Engine
	{
		public function Main()
		{
			super(Config.RESOLUTION_WIDTH, Config.RESOLUTION_HEIGHT, 60, false);
			Util.getInstance();
		}
		
	}
}