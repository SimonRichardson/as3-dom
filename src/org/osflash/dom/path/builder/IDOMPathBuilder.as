package org.osflash.dom.path.builder
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public interface IDOMPathBuilder extends IDOMPathQuery
	{
		
		function select(name : String) : IDOMPathSelectBuilder;
		
		function toString() : String;
	}
}
