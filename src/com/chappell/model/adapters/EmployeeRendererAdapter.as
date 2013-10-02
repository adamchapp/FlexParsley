package com.chappell.model.adapters
{
	import com.chappell.model.presentation.ListItem;
	import com.ubs.example.domain.Employee;
	
	import mx.collections.ArrayCollection;
	
	public class EmployeeRendererAdapter implements IRendererAdapter
	{
		public function getItemRendererData(value:ArrayCollection):ArrayCollection
		{
			var rendererCollection : ArrayCollection = new ArrayCollection();
			
			for each ( var employee : Employee in value ) {
				var listItem : ListItem = new ListItem();
				listItem.title = employee.name;
				listItem.subtitle = employee.role;
				listItem.image = employee.image;
				
				rendererCollection.addItem(listItem);
			}
			
			return rendererCollection;
		}
	}
}