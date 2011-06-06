package org.osflash.dom.path.builder
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public interface IDOMPathMethodArgumentBuilder
	{
		
		function addInt(value : int) : IDOMPathMethodArgumentBuilder;
		
		function addUint(value : uint) : IDOMPathMethodArgumentBuilder;
		
		function addNumber(value : Number) : IDOMPathMethodArgumentBuilder;
		
		function addString(value : String) : IDOMPathMethodArgumentBuilder;
		
		function addBoolean(value : Boolean) : IDOMPathMethodArgumentBuilder;
		
		function addArray(value : Array) : IDOMPathMethodArgumentBuilder;
		
		function endArguments() : IDOMPathMethodBuilder;
	}
}
