package Buttons
{
	/**
	 * ...
	 * @author Lyudison
	 */
	
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	 
	public class Button extends Entity
	{	
		private var clicked:Boolean;
		private var unclickedImage:Image;
		private var clickedImage:Image;
		
		public function Button(_unclickedImageSource:Class, _clickedImageSource:Class) {
			clicked = false;
			unclickedImage = new Image(_unclickedImageSource);
			clickedImage = new Image(_clickedImageSource);
		}
		
		override public function update():void 
		{
			if (isClicked()) {
				trace("u have clicked button!");
				if(!clicked)
					graphic = unclickedImage;
				else graphic = clickedImage;
				clicked = (clicked == true?false:true);
			}
		}
		
		public function isClicked():Boolean {
			if(Input.mousePressed)
				if (Input.mouseX >= x && Input.mouseX <= x + width
					&&Input.mouseY >= y && Input.mouseY <= y + height)
					return true;
			return false;
		}
	}

}