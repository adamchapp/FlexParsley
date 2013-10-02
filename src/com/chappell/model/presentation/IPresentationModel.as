package com.chappell.model.presentation
{
	import flash.events.IEventDispatcher;
	
	import mx.collections.ArrayCollection;

	public interface IPresentationModel extends IEventDispatcher
	{
		function get dataProvider() : ArrayCollection;
		function set dataProvider( value : ArrayCollection ) : void;
		
		function selectItem( index : Number ) : void;
	}
}