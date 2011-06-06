package org.osflash.dom.path.builder
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public interface IDOMPathMethodBuilder extends IDOMPathQuery
	{
		
		function addArguments(...args) : IDOMPathMethodBuilder;
		
		function startArguments() : IDOMPathMethodArgumentBuilder;
		
		function toString() : String;
	}
}
