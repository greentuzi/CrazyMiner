package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Lyudison
	 */
	public class Stone extends Entity
	{
		private var kind:int;
		private var postion:int;
		
		public function Stone(postion:int = 0,kind:int = 0) 
		{
			this.kind = kind;
			switch(kind){
				default:
					graphic = Image.createCircle(25, 0xff0000);
					break;
			}
		}
		
	}

}