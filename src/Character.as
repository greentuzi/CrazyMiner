package  
{
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Lyudison
	 */
	public class Character 
	{
		private var name:String;
		private var level:uint;
		private var bonus:uint;
		private var ropes:Array;
		private var tools:Array;
		
		public function Character(_name:String, _level:uint, _bonus:uint, _ropes:Array = null, _tools:Array = null) 
		{
			name = _name;
			level = _level;
			bonus = _bonus;
			ropes = _ropes;
			tools = _tools;
		}
		
		//....
		//corresponding 'set' functions are needed later...
		
		public function getName():String {
			return name;
		}
		
		public function getLevel():uint {
			return level;
		}
		
		public function getBonus():uint {
			return bonus;
		}
		
		public function getRopes():Array {
			return ropes;
		}
		
		public function getTools():Array {
			return tools;
		}
	}

}