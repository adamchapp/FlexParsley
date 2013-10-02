package com.chappell.remote
{
	import com.ubs.example.domain.Dog;
	import com.ubs.example.domain.Employee;
	
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	import mx.rpc.remoting.test.RemoteObjectStub;

	public class StubServiceConfig
	{		
		[Embed(source="data/employees.xml")]
		private var employeeData:Class;
		
		[Embed(source="data/dogs.xml")]
		public var dogData:Class;
		
		[Inject]
		[Bindable]
		public var service : RemoteObject;
		
		[Init]
		public function configureService() : void
		{
			if ( !(service is RemoteObjectStub) ) throw new Error("Remote object is not a stub");
			
			loadEmployeeData();
			loadDogData();
		}
		
		private function loadEmployeeData():void
		{
			var stubService : RemoteObjectStub = service as RemoteObjectStub;
			
			var employeeArray : Array = new Array();
			var xml : XML = XML(employeeData.data);
			
			for each ( var node : XML in xml.Employee ) {
				var employee : Employee = new Employee();
				employee.image = node.@image;
				employee.name = node.@name;
				employee.role = node.@role;
				
				employeeArray.push(employee);
			}
			
			stubService.result("getEmployees", [], new ResultEvent(ResultEvent.RESULT, false, false, employeeArray ) );
		}
		
		private function loadDogData():void
		{
			var stubService : RemoteObjectStub = service as RemoteObjectStub;
			
			var dogArray : Array = new Array();
			var xml : XML = XML(dogData.data);
			
			for each ( var node : XML in xml.Dog ) {
				var dog : Dog = new Dog();
				dog.image = node.@image;
				dog.name = node.@name;
				dog.breed = node.@breed;
				dog.owner = node.@owner;
				
				dogArray.push(dog);
			}
			
			stubService.result("getDogs", [], new ResultEvent(ResultEvent.RESULT, false, false, dogArray ) );
		}
	}
}