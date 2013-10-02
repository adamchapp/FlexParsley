package com.chappell.model.domain
{
	import com.chappell.events.EmployeeModelEvent;
	import com.ubs.example.domain.Employee;
	
	import mx.collections.ArrayCollection;
	
	import org.spicefactory.lib.logging.LogContext;
	import org.spicefactory.lib.logging.Logger;
	
	public class EmployeeModel 
	{
		public static const LOG : Logger = LogContext.getLogger( EmployeeModel );
		
		[MessageDispatcher]
		public var dispatcher:Function;
		
		[Bindable]
		public var employeeCollection : ArrayCollection;
		
		[Publish]
		[Bindable]
		public var selectedEmployee : Employee;
		
		public function updateEmployees( employeeArray : Array ) : void
		{
			LOG.info('updating model');
			
			employeeCollection = new ArrayCollection( employeeArray );			
			
			dispatcher( new EmployeeModelEvent(EmployeeModelEvent.MODEL_UPDATED, employeeCollection) );
		}
		
		public function selectEmployee( index : Number ) : void {
			LOG.info('selecting employee');
			selectedEmployee = employeeCollection.getItemAt(index) as Employee;
		}
	}
}