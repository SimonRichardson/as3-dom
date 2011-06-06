package org.osflash.dom.path.builder
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public interface IDOMPathSelectBuilder extends IDOMPathQuery
	{
		
		function atIndex(index : uint) : IDOMPathIndexBuilder;
		
		function withAttribute(name : String) : IDOMPathAttributeBuilder;
		
		function andCallingMethod(name : String) : IDOMPathMethodBuilder;
		
		function where(name : String) : IDOMPathWhereBuilder;
		
		function toString() : String;
	}
}
