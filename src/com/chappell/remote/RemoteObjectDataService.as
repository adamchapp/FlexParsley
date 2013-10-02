package com.chappell.remote
{
	import flash.events.EventDispatcher;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;
	
	import org.spicefactory.lib.logging.LogContext;
	import org.spicefactory.lib.logging.Logger;
	
	public class RemoteObjectDataService extends EventDispatcher implements IDataService
	{
		public static const LOG : Logger = LogContext.getLogger( RemoteObjectDataService );
		
		[Inject]
		[Bindable]
		public var service : RemoteObject

		public function getEmployees():AsyncToken
		{
			LOG.debug('Calling getEmployees');
			return service.getEmployees() as AsyncToken;
		}
		
		public function getDogs():AsyncToken
		{
			LOG.debug('Calling getDogs');
			return service.getDogs() as AsyncToken;
		}
	}
}