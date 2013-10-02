package com.chappell.events
{
	import flash.events.Event;
	
	public class GetDogsEvent extends Event
	{
		public static const GET_DOGS : String = "getDogs";
		
		public function GetDogsEvent( type : String )
		{
			super(type, false, true);
		}
		
		override public function clone():Event {
			return new GetDogsEvent(type);
		}
	}
}