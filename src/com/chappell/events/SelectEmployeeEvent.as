package com.chappell.events
{
	import flash.events.Event;
	
	public class SelectEmployeeEvent extends Event
	{
		public static const SELECT_EMPLOYEE : String = 'selectEmployee';
		
		private var _index : Number;
		
		public function SelectEmployeeEvent(type:String, index : Number)
		{
			super(type, true, true);
			_index = index;	
		}
		
		public function get index() : Number
		{
			return _index;
		}
		
		override public function clone():Event {
			return new SelectEmployeeEvent(type, index);
		}
	}
}