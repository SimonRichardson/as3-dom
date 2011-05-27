package org.osflash.dom.path.builder
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public interface IDOMPathSelectBuilder extends IDOMPathQuery
	{
		
		function atIndex(index : uint) : IDOMPathIndexBuilder;
		
		function withIndex(index : uint) : IDOMPathIndexBuilder;
		
		function attribute(name : String) : IDOMPathAttributeBuilder;
		
		function withAttribute(name : String) : IDOMPathAttributeBuilder;
		
		function callingMethod(name : String, ...args) : IDOMPathMethodBuilder;
		
		function andCallingMethod(name : String, ...args) : IDOMPathMethodBuilder;
		
		function toString() : String;
	}
}
