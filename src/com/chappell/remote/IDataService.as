package com.chappell.remote
{
	import mx.rpc.AsyncToken;

	public interface IDataService
	{
		function getEmployees() : AsyncToken;
		function getDogs() : AsyncToken;
	}
}