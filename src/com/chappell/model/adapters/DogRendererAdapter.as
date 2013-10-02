package com.chappell.model.adapters
{
	import com.chappell.model.presentation.ListItem;
	import com.ubs.example.domain.Dog;
	
	import mx.collections.ArrayCollection;
	
	public class DogRendererAdapter implements IRendererAdapter
	{	
		public function getItemRendererData(value:ArrayCollection):ArrayCollection
		{
			var rendererCollection : ArrayCollection = new ArrayCollection();
			
			for each ( var dog : Dog in value ) {
				var listItem : ListItem = new ListItem();
				listItem.title = dog.name;
				listItem.subtitle = dog.breed;
				listItem.image = dog.image;
				
				rendererCollection.addItem(listItem);
			}
			
			return rendererCollection;
		}
	}
}