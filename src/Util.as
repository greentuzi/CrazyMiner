package  
{
	import net.flashpunk.Entity;
	import flash.events.Event;
	import flash.events.DataEvent;
	import flash.net.XMLSocket;
	import net.flashpunk.graphics.Text;
	/**
	 * ...
	 * @author Greentuzi
	 */
	public class Util extends Entity
	{
		private var xmlSocket:XMLSocket;	
		private static var instance:Util = null;
		public static function getInstance()
		{
			if (instance == null)
				return instance = new Util();
			return instance;
		}
		public function Util() 
		{
			xmlSocket = new XMLSocket();
			xmlSocket.addEventListener(Event.CONNECT, onConnect);
			
			xmlSocket.addEventListener(DataEvent.DATA, onData);
			try{
				xmlSocket.connect("172.18.158.116", 8765);
			}
			catch (e:Error)
			{
				trace(e.getStackTrace());
			}
			
		}
		
		public function send(s:String)
		{
			xmlSocket.send(s);
		}
		private function onConnect (event:Event) :void 
		{

		}
		
		private function onData(event:DataEvent): void {             
			graphic = new Text(event.data,300,300);
			trace(event.data);
		}
	}

}