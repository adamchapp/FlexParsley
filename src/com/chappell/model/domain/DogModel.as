package com.chappell.model.domain
{
	import com.chappell.events.DogModelEvent;
	import com.ubs.example.domain.Employee;
	
	import mx.collections.ArrayCollection;
	
	import org.spicefactory.lib.logging.LogContext;
	import org.spicefactory.lib.logging.Logger;

	public class DogModel
	{
		public static const LOG : Logger = LogContext.getLogger( DogModel );

		[MessageDispatcher]
		public var dispatcher : Function;
		
		[Bindable]
		public var dogCollection : ArrayCollection;
		
		private var _selectedEmployee : Employee;
		
		[Subscribe]
		[Bindable]
		public function get selectedEmployee():Employee
		{
			return _selectedEmployee;
		}

		public function set selectedEmployee(value:Employee):void
		{
			_selectedEmployee = value;
			
			filterDataProvider();
		}
				
		public function updateDogs( dogArray : Array ) : void
		{
			dogCollection = new ArrayCollection( dogArray );
			
			dispatchUpdateEvent();
		}
		
		private function filterDataProvider():void
		{
			LOG.info('filtering model');
			
			if ( selectedEmployee ) {
				dogCollection.filterFunction = employeeFilterFunction;
			} else { 
				dogCollection.filterFunction = null;
			}

			dogCollection.refresh();
			
			dispatchUpdateEvent();
		}
		
		private function dispatchUpdateEvent():void
		{
			LOG.debug('dispatching model update event');
			dispatcher( new DogModelEvent( DogModelEvent.MODEL_UPDATED, dogCollection ) );
		}
		
		private function employeeFilterFunction( item : Object ) : Boolean {
			return item.owner == selectedEmployee.name;		
		}
	}
}