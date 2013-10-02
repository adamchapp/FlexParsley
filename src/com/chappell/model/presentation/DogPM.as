package com.chappell.model.presentation
{
	import com.chappell.events.DogModelEvent;
	import com.chappell.events.GetDogsEvent;
	import com.chappell.events.SelectEmployeeEvent;
	import com.chappell.model.adapters.DogRendererAdapter;
	import com.chappell.model.adapters.IRendererAdapter;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import mx.collections.ArrayCollection;
	
	import org.spicefactory.lib.logging.LogContext;
	import org.spicefactory.lib.logging.Logger;
	
	[Event(name="getDogs", type="com.chappell.events.GetDogsEvent")]
	[ManagedEvents( "getDogs" )]
	
	public class DogPM extends EventDispatcher implements IPresentationModel
	{
		public static const LOG : Logger = LogContext.getLogger( DogPM );
		
		private var _adapter : IRendererAdapter;
		
		private var _dataProvider : ArrayCollection;
		
		[Init]
		public function getData() : void
		{
			LOG.debug('dispatching GetDogsEvent');
			
			_adapter = new DogRendererAdapter();
			
			dispatchEvent( new GetDogsEvent(GetDogsEvent.GET_DOGS) );
		}
		
		public function selectItem( index : Number ) : void {
			//selecting the dog list currently does nothing
		}
				
		[Bindable(event="collectionUpdated")]
		public function get dataProvider():ArrayCollection
		{
			return _dataProvider;
		}
		
		public function set dataProvider(value:ArrayCollection):void
		{
			_dataProvider = _adapter.getItemRendererData(value);
			
			dispatchEvent(new Event("collectionUpdated"));
		}
		
		[MessageHandler(selector="modelUpdated")]
		public function handleModelUpdate( event : DogModelEvent ) : void
		{
			LOG.debug('received DogModelEvent');
			dataProvider = event.data;
			
			dispatchEvent( new Event("modelUpdated") );
		}
	}
}
