package org.osflash.dom.path.builder
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public interface IDOMPathAttributeBuilder extends IDOMPathQuery
	{
		
		function atIndex(index : uint) : IDOMPathIndexBuilder;
		
		function withIndex(index : uint) : IDOMPathIndexBuilder;
		
		function toString() : String;
	}
}
