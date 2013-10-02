package com.chappell.model.presentation
{
	import com.chappell.events.EmployeeModelEvent;
	import com.chappell.events.GetEmployeesEvent;
	import com.chappell.events.SelectEmployeeEvent;
	import com.chappell.model.adapters.EmployeeRendererAdapter;
	import com.chappell.model.adapters.IRendererAdapter;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import mx.collections.ArrayCollection;
	
	import org.spicefactory.lib.logging.LogContext;
	import org.spicefactory.lib.logging.Logger;
	
	[Event(name="getEmployees", type="com.chappell.events.GetEmployeesEvent")]
	[Event(name="selectEmployee", type="com.chappell.events.SelectEmployeeEvent")]
	[ManagedEvents( "getEmployees, selectEmployee" )]
	
	public class EmployeePM extends EventDispatcher implements IPresentationModel
	{
		public static const LOG : Logger = LogContext.getLogger( EmployeePM );
	
		private var _adapter : IRendererAdapter;
		
		private var _dataProvider : ArrayCollection;
		
		[Init]
		public function getData() : void
		{
			LOG.debug('dispatching GetEmployeesEvent');
		
			_adapter = new EmployeeRendererAdapter();
			
			dispatchEvent( new GetEmployeesEvent(GetEmployeesEvent.GET_EMPLOYEES) );
		}
		
		public function selectItem( index : Number ) : void {
			LOG.debug('dispatching SelectEmployeeEvent');
			dispatchEvent( new SelectEmployeeEvent( SelectEmployeeEvent.SELECT_EMPLOYEE, index) );
		}		
		
		[Bindable(event="employeeCollectionUpdated")]
		public function get dataProvider():ArrayCollection
		{
			return _dataProvider;
		}

		public function set dataProvider(value:ArrayCollection):void
		{
			_dataProvider = _adapter.getItemRendererData(value);
			
			dispatchEvent(new Event("employeeCollectionUpdated"));
		}
		
		[MessageHandler(selector="modelUpdated")]
		public function handleModelUpdate( event : EmployeeModelEvent ) : void
		{
			LOG.debug('received EmployeeModelEvent');
			
			dataProvider = event.data;
			
			dispatchEvent( new Event("modelUpdated") );
		}
	}
}


