package com.chappell.commands
{
	import com.chappell.events.SelectEmployeeEvent;
	import com.chappell.model.domain.EmployeeModel;
	
	import org.spicefactory.lib.logging.LogContext;
	import org.spicefactory.lib.logging.Logger;
	
	public class SelectEmployeeCommand
	{
		public var LOG : Logger = LogContext.getLogger( SelectEmployeeCommand );
		
		[Inject]
		[Bindable]
		public var model : EmployeeModel;
		
		public function execute( event : SelectEmployeeEvent ) : void
		{
			LOG.debug('executing select employee command');
			model.selectEmployee( event.index );
		}
	}
}