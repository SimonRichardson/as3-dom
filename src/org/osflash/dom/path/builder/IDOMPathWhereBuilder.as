package org.osflash.dom.path.builder
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public interface IDOMPathWhereBuilder extends IDOMPathQuery
	{
		
		function addwhere(name : String, value : String) : IDOMPathWhereBuilder;
		
		function toString() : String;
	}
}
