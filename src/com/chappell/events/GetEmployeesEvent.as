package com.chappell.events
{
	import flash.events.Event;
	
	public class GetEmployeesEvent extends Event
	{
		public static const GET_EMPLOYEES : String = 'getEmployees';
		
		public function GetEmployeesEvent( type : String )
		{
			super(type, false, true);
		}
		
		override public function clone():Event {
			return new GetEmployeesEvent(type);
		}
	}
}