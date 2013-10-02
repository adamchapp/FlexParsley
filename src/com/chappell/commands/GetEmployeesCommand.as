package com.chappell.commands
{
	import com.chappell.events.GetEmployeesEvent;
	import com.chappell.model.domain.EmployeeModel;
	import com.chappell.remote.IDataService;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.events.ResultEvent;
	
	import org.spicefactory.lib.logging.LogContext;
	import org.spicefactory.lib.logging.Logger;

	public class GetEmployeesCommand
	{
		public var LOG : Logger = LogContext.getLogger( GetEmployeesCommand );
		
		[Inject]
		[Bindable]
		public var service : IDataService;
		
		[Inject]
		[Bindable]
		public var model : EmployeeModel;
		
		public function execute() : AsyncToken
		{
			LOG.debug('executing command');
			return service.getEmployees() as AsyncToken;
		}
		
		public function result( result : ResultEvent ) : void
		{
			LOG.info('got employees');
			model.updateEmployees( result.result as Array );
		}
		
		public function error( fail : Object ) : void
		{
			LOG.error('RESULT FAILED');
		}
	}
}