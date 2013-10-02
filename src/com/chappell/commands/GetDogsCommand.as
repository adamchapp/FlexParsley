package com.chappell.commands
{
	import com.chappell.model.domain.DogModel;
	import com.chappell.remote.IDataService;
	
	import flash.events.EventDispatcher;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.events.ResultEvent;
	
	import org.spicefactory.lib.logging.LogContext;
	import org.spicefactory.lib.logging.Logger;
	
	public class GetDogsCommand extends EventDispatcher
	{
		public var LOG : Logger = LogContext.getLogger( GetDogsCommand );
		
		[Inject]
		[Bindable]
		public var service : IDataService;
		
		[Inject]
		[Bindable]
		public var model : DogModel;
		
		public function execute() : AsyncToken
		{
			LOG.debug('executing command');
			return service.getDogs() as AsyncToken;
		}
		
		public function result( result : ResultEvent ) : void
		{
			LOG.info('got dogs');
			model.updateDogs( result.result as Array );
		}
		
		public function error( fail : Object ) : void
		{
			LOG.error('RESULT FAILED');
		}
	}
}