package com.chappell.events
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	public class EmployeeModelEvent extends Event
	{
		public static const MODEL_UPDATED : String = "modelUpdated";
		
		private var _data : ArrayCollection;
		
		public function EmployeeModelEvent( type : String, data : ArrayCollection )
		{
			super( type, false, true );
			_data = data;
		}
		
		public function get data() : ArrayCollection {
			return _data;
		}
		
		override public function clone():Event
		{
			return new EmployeeModelEvent(type, data);
		}
	}
}