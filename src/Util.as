package  
{
	import net.flashpunk.Entity;
	import flash.events.Event;
	import flash.events.DataEvent;
	import flash.net.XMLSocket;
	import net.flashpunk.graphics.Text;
	import com.adobe.serialization.json.JSON;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Greentuzi
	 */
	public class Util extends Entity
	{
		private var xmlSocket:XMLSocket;	
		private static var instance:Util = null;
		
		public static function getInstance():Util
		{
			if (instance == null)
				return instance = new Util;
			return instance;
		}
		
		public function Util() 
		{
			xmlSocket = new XMLSocket();
			xmlSocket.addEventListener(Event.CONNECT, onConnect);
			
			xmlSocket.addEventListener(DataEvent.DATA, onData);
			try{
				xmlSocket.connect("172.18.157.116", 8765);
			}
			catch (e:Error)
			{
				trace(e.getStackTrace());
			}
		}
		
		public function send(jsonObject:Object):void
		{
			var jsonString : String = JSON.encode(jsonObject);
			xmlSocket.send(jsonString);
		}
		
		private function onConnect (event:Event) :void 
		{

		}
		
		private function onData(event:DataEvent): void {
			
			if (event.data == "") return;
			//trace(event.data);
			var jsonObject:Object = JSON.decode(event.data);
			
			var stone:Stone;
			switch(jsonObject.flagID)
			{
				case "201":
					var array:Array = new Array;
					for (var i:int = 0; i < jsonObject.ores.length; i++)
					{
						stone = new Stone(uint(jsonObject.ores[i].orePos), uint(jsonObject.ores[i].oreType));
						array.push(stone);
					}
					GamePlay.getInstance().setInstance(0, null, array);
					FP.world = GamePlay.getInstance();
					break;
			}
			
		}
	}

}