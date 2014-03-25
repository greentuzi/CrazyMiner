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
		private var kind:uint;
		private var postion:uint;
		
		public function Stone(postion:uint = 0,kind:uint = 0) 
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