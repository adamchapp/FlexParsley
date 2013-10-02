package com.chappell.model.adapters
{
	import mx.collections.ArrayCollection;

	public interface IRendererAdapter
	{
		function getItemRendererData( value : ArrayCollection ) : ArrayCollection;
	}
}